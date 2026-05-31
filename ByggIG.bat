@echo off
setlocal EnableExtensions EnableDelayedExpansion

:: UTF-8 support
chcp 65001 >nul 2>nul

:: ANSI colors
for /F %%a in ('echo prompt $E^| cmd') do set "ESC=%%a"
set "RED=%ESC%[91m"
set "GREEN=%ESC%[92m"
set "YELLOW=%ESC%[93m"
set "BLUE=%ESC%[94m"
set "CYAN=%ESC%[96m"
set "RESET=%ESC%[0m"

:: ================================================================================
:: LMDI Implementation Guide - Windows Build Script (OPTIMIZED)
:: ================================================================================

:: Script location
set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"
set "DIRECT_MODE=0"
if /i "%~1"=="build" set "DIRECT_MODE=1"

:: Find IG files
if exist "%SCRIPT_DIR%\ig.ini" (
    set "IG_DIR=%SCRIPT_DIR%"
    echo %GREEN%IG filer funnet i script directory%RESET%
) else if exist "%SCRIPT_DIR%\LMDI\ig.ini" (
    set "IG_DIR=%SCRIPT_DIR%\LMDI"
    echo %GREEN%IG filer funnet i LMDI subdirectory%RESET%
) else (
    echo %RED%FEIL: Kan ikke finne ig.ini! Sjekk mappestruktur.%RESET%
    pause
    exit /b 1
)

set "SUSHI_CONFIG=%IG_DIR%\sushi-config.yaml"
if not exist "%SUSHI_CONFIG%" (
    echo %RED%FEIL: Fant ikke %SUSHI_CONFIG%%RESET%
    pause
    exit /b 1
)

:: Konfigurasjonsvariabler
set "PUBLISHER_DIR=%SCRIPT_DIR%\publisher"
set "PUBLISHER_JAR=%PUBLISHER_DIR%\publisher.jar"
:: Pin IG Publisher til en konkret versjon. lag-en-doklag.py er koblet til
:: publisher sin HTML-markup, sa speilingen kan ryke stille ved auto-oppgradering.
:: Bump bevisst og test /en-speilingen nar du oppgraderer. Hold i synk med workflows.
set "PUBLISHER_VERSION=2.2.8"
set "PUBLISHER_VERSION_FILE=%PUBLISHER_DIR%\version.txt"
set "PUBLISHER_URL=https://github.com/HL7/fhir-ig-publisher/releases/download/%PUBLISHER_VERSION%/publisher.jar"
set "BUILD_DIR=%SCRIPT_DIR%\.ig-build"
set "NO_BASIS_EXTRACT_DIR=%BUILD_DIR%\no-basis-snapshot"
call :READ_NOBASIS_VERSION || exit /b 1
set "NO_BASIS_FILE=%BUILD_DIR%\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz"
set "NO_BASIS_URL=https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz"
set "FHIR_CACHE=%USERPROFILE%\.fhir\packages"

:: Java heap settings
set "JAVA_OPTS=-Xmx4g -Xms2g -XX:+UseG1GC -XX:+UseStringDeduplication -Djava.awt.headless=true"

:: Startup info
echo %CYAN%================================================================================
echo   LMDI IG Build System - OPTIMIZED VERSION
echo ================================================================================%RESET%
echo.
echo Script dir:  %SCRIPT_DIR%
echo IG dir:      %IG_DIR%
echo No-basis:    %NO_BASIS_VERSION%
echo FHIR Cache:  %FHIR_CACHE%
echo.
if "%DIRECT_MODE%"=="1" goto BUILD
timeout /t 2 >nul

:MENU
cls
echo %BLUE%================================================================================
echo   LMDI IG Build System
echo ================================================================================%RESET%
echo.
echo   %CYAN%IG Directory:%RESET% %IG_DIR%
echo.
echo   Velg en opsjon:
echo.
echo   %CYAN%1.%RESET% Bygg IG %GREEN%(anbefalt)%RESET%
echo   %CYAN%2.%RESET% Installer/fiks no-basis pakke
echo   %CYAN%3.%RESET% Sjekk dependencies
echo   %CYAN%4.%RESET% Rens cache og output
echo   %CYAN%5.%RESET% Kjør bare SUSHI
echo   %CYAN%6.%RESET% Åpne output i nettleser
echo   %CYAN%7.%RESET% Avslutt
echo.
set /p choice="Skriv inn valg (1-7): "

if "%choice%"=="1" goto BUILD
if "%choice%"=="2" goto INSTALL_NOBASIS
if "%choice%"=="3" goto CHECK_DEPS
if "%choice%"=="4" goto CLEAN
if "%choice%"=="5" goto SUSHI_ONLY
if "%choice%"=="6" goto OPEN_OUTPUT
if "%choice%"=="7" goto END

echo %RED%Ugyldig valg.%RESET%
timeout /t 2 >nul
goto MENU

:: ================================================================================
:: BUILD - Hovedfunksjon
:: ================================================================================
:BUILD
echo.
echo %BLUE%Starter IG build...%RESET%
echo.
call :START_BUILD_TIMER

:: Sjekk og installer dependencies
call :CHECK_JAVA || goto BUILD_FAILED
call :CHECK_PYTHON || goto BUILD_FAILED
call :ENSURE_PUBLISHER || goto BUILD_FAILED
call :ENSURE_NOBASIS || goto BUILD_FAILED
call :ENSURE_SUSHI || goto BUILD_FAILED

:: Gå til IG directory
echo.
echo Bytter til IG directory: %IG_DIR%
cd /d "%IG_DIR%"

:: Kjør SUSHI først
echo.
echo %BLUE%Kjører SUSHI...%RESET%
call sushi . 2>&1
if %errorlevel% neq 0 (
    echo %RED%SUSHI feilet!%RESET%
    goto BUILD_FAILED
)
echo %GREEN%SUSHI OK!%RESET%

:: Kjør IG Publisher
echo.
echo %BLUE%Kjører IG Publisher...%RESET%
echo Dette kan ta flere minutter...
java %JAVA_OPTS% -jar "%PUBLISHER_JAR%" publisher -ig ig.ini -no-sushi
if %errorlevel% neq 0 (
    echo %RED%IG Publisher feilet!%RESET%
    goto BUILD_FAILED
)
call :BUILD_ENGLISH_DOC_LAYER || goto BUILD_FAILED

call :PRINT_BUILD_TIMING
echo.
echo %GREEN%================================================================================
echo   IG BUILD FULLFØRT!
echo ================================================================================%RESET%
echo.
echo Output: %IG_DIR%\output\index.html
echo.
if "%DIRECT_MODE%"=="1" exit /b 0
set /p open="Åpne i nettleser? (j/n): "
if /i "%open%"=="j" start "" "%IG_DIR%\output\index.html"

pause
goto MENU

:BUILD_FAILED
call :PRINT_BUILD_TIMING
echo.
echo %RED%Build feilet! Sjekk feilmeldinger over.%RESET%
if "%DIRECT_MODE%"=="1" exit /b 1
pause
goto MENU

:: ================================================================================
:: SUSHI ONLY
:: ================================================================================
:SUSHI_ONLY
echo.
echo %BLUE%Kjører bare SUSHI...%RESET%
echo.

call :ENSURE_NOBASIS || goto SUSHI_FAILED
call :ENSURE_SUSHI || goto SUSHI_FAILED

:: Gå til IG directory
cd /d "%IG_DIR%"
echo Kjører SUSHI i: %CD%

call sushi . 2>&1
if %errorlevel% neq 0 goto SUSHI_FAILED

echo %GREEN%SUSHI fullført!%RESET%
pause
goto MENU

:SUSHI_FAILED
echo %RED%SUSHI feilet!%RESET%
pause
goto MENU

:: ================================================================================
:: Hjelpefunksjoner - OPTIMIZED TO AVOID NPM HANG
:: ================================================================================

:CHECK_JAVA
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%Java mangler! Installer Java 11+ først.%RESET%
    exit /b 1
)
echo %GREEN%Java OK%RESET%
exit /b 0

:CHECK_PYTHON
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo %GREEN%Python OK%RESET%
    exit /b 0
)
where py >nul 2>&1
if %errorlevel% equ 0 (
    echo %GREEN%Python launcher OK%RESET%
    exit /b 0
)
echo %RED%Python mangler! Trengs for engelsk dokumentasjonsflate.%RESET%
exit /b 1

:ENSURE_SUSHI
:: Use where instead of running sushi directly
where sushi >nul 2>&1
if %errorlevel% neq 0 (
    echo %YELLOW%SUSHI mangler!%RESET%
    echo.
    echo Installer SUSHI manuelt med:
    echo   npm install -g fsh-sushi
    echo.
    echo Deretter kjør scriptet på nytt.
    exit /b 1
)
echo %GREEN%SUSHI OK%RESET%
exit /b 0

:RUN_PYTHON
where python >nul 2>&1
if %errorlevel% equ 0 (
    python %*
    exit /b !errorlevel!
)
py -3 %*
exit /b !errorlevel!

:BUILD_ENGLISH_DOC_LAYER
if not exist "%SCRIPT_DIR%\scripts\lag-en-doklag.py" (
    echo %YELLOW%scripts\lag-en-doklag.py finnes ikke. Hopper over engelsk dokumentasjonsflate.%RESET%
    exit /b 0
)
echo.
echo %BLUE%Bygger engelsk dokumentasjonsflate...%RESET%
call :RUN_PYTHON "%SCRIPT_DIR%\scripts\lag-en-doklag.py" --ig-root "%IG_DIR%" --output-dir "%IG_DIR%\output"
exit /b !errorlevel!

:ENSURE_PUBLISHER
:: Last ned pa nytt hvis jar mangler eller den pinnede versjonen er endret
set "INSTALLED_PUBLISHER_VERSION="
if exist "%PUBLISHER_VERSION_FILE%" set /p INSTALLED_PUBLISHER_VERSION=<"%PUBLISHER_VERSION_FILE%"
if exist "%PUBLISHER_JAR%" if "%INSTALLED_PUBLISHER_VERSION%"=="%PUBLISHER_VERSION%" (
    echo %GREEN%Publisher %PUBLISHER_VERSION% OK%RESET%
    exit /b 0
)

echo %YELLOW%Laster ned IG Publisher %PUBLISHER_VERSION%...%RESET%
if not exist "%PUBLISHER_DIR%" mkdir "%PUBLISHER_DIR%"

powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%PUBLISHER_URL%' -OutFile '%PUBLISHER_JAR%' -UseBasicParsing } catch { exit 1 }"

if %errorlevel% neq 0 (
    echo %RED%Publisher download feilet!%RESET%
    exit /b 1
)

if not exist "%PUBLISHER_JAR%" (
    echo %RED%Publisher fil ikke funnet etter nedlasting!%RESET%
    exit /b 1
)

> "%PUBLISHER_VERSION_FILE%" echo %PUBLISHER_VERSION%
echo %GREEN%Publisher %PUBLISHER_VERSION% lastet ned%RESET%
exit /b 0

:ENSURE_NOBASIS
set "cache_dir=%FHIR_CACHE%\hl7.fhir.no.basis#%NO_BASIS_VERSION%"
if exist "%cache_dir%\package\package.json" (
    echo %GREEN%no-basis %NO_BASIS_VERSION% OK%RESET%
    exit /b 0
)

echo %YELLOW%no-basis %NO_BASIS_VERSION% snapshot mangler!%RESET%
echo.
echo Alternativer for installasjon:
echo.
echo   Alternativ 1: Kjør valg 2 fra menyen for automatisk installasjon
echo.
echo   Alternativ 2: Installer manuelt med denne sekvensen:
echo     1. Last ned snapshot: %NO_BASIS_URL%
echo     2. Pakk ut .tgz-filen
echo     3. Kopier innholdet fra package\ til: %cache_dir%\package\
echo.
exit /b 1

:: ================================================================================
:: INSTALL_NOBASIS - Installerer no-basis snapshot uten npm-overhead
:: ================================================================================
:INSTALL_NOBASIS
echo.
echo %BLUE%Installerer/fikser no-basis med snapshot...%RESET%
echo.

set "cache_dir=%FHIR_CACHE%\hl7.fhir.no.basis#%NO_BASIS_VERSION%"
if exist "%cache_dir%" (
    echo Sletter gammel cache...
    rmdir /S /Q "%cache_dir%" 2>nul
)

if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

echo.
echo %YELLOW%Laster ned no-basis snapshot hvis den mangler...%RESET%
if not exist "%NO_BASIS_FILE%" if exist "%SCRIPT_DIR%\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz" (
    copy /Y "%SCRIPT_DIR%\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz" "%NO_BASIS_FILE%" >nul
)
if not exist "%NO_BASIS_FILE%" if exist "%BUILD_DIR%\npm\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz" (
    copy /Y "%BUILD_DIR%\npm\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz" "%NO_BASIS_FILE%" >nul
)
if not exist "%NO_BASIS_FILE%" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%NO_BASIS_URL%' -OutFile '%NO_BASIS_FILE%' -UseBasicParsing } catch { Write-Host $_; exit 1 }"
    if errorlevel 1 (
        echo %RED%Nedlasting av snapshot feilet!%RESET%
        pause
        goto MENU
    )
    if not exist "%NO_BASIS_FILE%" (
        echo %RED%Nedlasting av snapshot feilet!%RESET%
        pause
        goto MENU
    )
) else (
    echo %GREEN%Snapshot allerede nedlastet%RESET%
)

where tar >nul 2>&1
if errorlevel 1 (
    echo %RED%Fant ikke tar.exe. Installer Windows tar eller bruk npm-oppsett manuelt.%RESET%
    pause
    goto MENU
)

echo.
echo %YELLOW%Pakker ut snapshot direkte til FHIR package cache...%RESET%
if exist "%NO_BASIS_EXTRACT_DIR%" rmdir /S /Q "%NO_BASIS_EXTRACT_DIR%" 2>nul
mkdir "%NO_BASIS_EXTRACT_DIR%"
tar -xzf "%NO_BASIS_FILE%" -C "%NO_BASIS_EXTRACT_DIR%"
if errorlevel 1 (
    echo %RED%Utpakking av snapshot feilet!%RESET%
    pause
    goto MENU
)
if not exist "%NO_BASIS_EXTRACT_DIR%\package\package.json" (
    echo %RED%Snapshot mangler package\package.json etter utpakking.%RESET%
    pause
    goto MENU
)

if not exist "%cache_dir%" mkdir "%cache_dir%"
if not exist "%cache_dir%\package" mkdir "%cache_dir%\package"

xcopy /E /Y /Q "%NO_BASIS_EXTRACT_DIR%\package\*" "%cache_dir%\package\" >nul
if errorlevel 1 (
    echo %RED%Kopiering til FHIR cache feilet!%RESET%
    pause
    goto MENU
)

if exist "%cache_dir%\package\package.json" (
    echo %GREEN%no-basis %NO_BASIS_VERSION% snapshot installert og konfigurert!%RESET%
    echo Cache: %cache_dir%\package\
) else (
    echo %RED%Kopiering til FHIR cache feilet!%RESET%
)

pause
goto MENU

:: ================================================================================
:: CHECK_DEPS - Modified to handle npm safely
:: ================================================================================
:CHECK_DEPS
echo.
echo %BLUE%Sjekker dependencies...%RESET%
echo.

:: Java
java -version >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[X] Java mangler%RESET%
) else (
    echo %GREEN%[✓] Java OK%RESET%
    for /f "tokens=3" %%i in ('java -version 2^>^&1 ^| findstr /i "version"') do (
        echo     Version: %%i
    )
)

:: Node
where node >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[X] Node.js mangler%RESET%
) else (
    echo %GREEN%[✓] Node.js OK%RESET%
    for /f %%i in ('node --version 2^>^&1') do echo     Version: %%i
)

:: Python
where python >nul 2>&1
if %errorlevel% equ 0 (
    echo %GREEN%[✓] Python OK%RESET%
) else (
    where py >nul 2>&1
    if %errorlevel% equ 0 (
        echo %GREEN%[✓] Python launcher OK%RESET%
    ) else (
        echo %RED%[X] Python mangler%RESET%
    )
)

:: NPM - check with where only
where npm >nul 2>&1
if %errorlevel% neq 0 (
    echo %RED%[X] NPM mangler%RESET%
) else (
    echo %GREEN%[✓] NPM OK%RESET%
    echo     %YELLOW%(version check skipped to avoid hang)%RESET%
)

:: SUSHI
where sushi >nul 2>&1
if %errorlevel% neq 0 (
    echo %YELLOW%[!] SUSHI mangler%RESET%
    echo     Installer med: npm install -g fsh-sushi
) else (
    echo %GREEN%[✓] SUSHI OK%RESET%
    :: Try to get version in safe way
    for /f "tokens=*" %%i in ('call sushi --version 2^>^&1 ^| findstr /i "sushi"') do (
        echo     Version: %%i
    )
)

:: Publisher
if exist "%PUBLISHER_JAR%" (
    echo %GREEN%[✓] IG Publisher installert%RESET%
    for %%A in ("%PUBLISHER_JAR%") do echo     Size: %%~zA bytes
) else (
    echo %YELLOW%[!] IG Publisher mangler%RESET%
)

:: No-basis
set "cache_dir=%FHIR_CACHE%\hl7.fhir.no.basis#%NO_BASIS_VERSION%"
if exist "%cache_dir%\package\package.json" (
    echo %GREEN%[✓] no-basis %NO_BASIS_VERSION% i cache%RESET%
) else (
    echo %YELLOW%[!] no-basis mangler%RESET%
)

:: FHIR Cache info
echo.
echo %CYAN%FHIR Cache:%RESET%
if exist "%FHIR_CACHE%" (
    echo   Location: %FHIR_CACHE%

    :: Count packages
    set "count=0"
    for /d %%D in ("%FHIR_CACHE%\*") do set /a count+=1
    echo   Packages: !count!
) else (
    echo   %YELLOW%Cache eksisterer ikke%RESET%
)

pause
goto MENU

:: ================================================================================
:: CLEAN
:: ================================================================================
:CLEAN
echo.
echo %YELLOW%Renser output og cache...%RESET%

cd /d "%IG_DIR%"

if exist "output" (
    echo Sletter output...
    rmdir /S /Q "output" 2>nul
)
if exist "temp" (
    echo Sletter temp...
    rmdir /S /Q "temp" 2>nul
)
if exist "template" (
    echo Sletter template...
    rmdir /S /Q "template" 2>nul
)
if exist "fsh-generated" (
    echo Sletter fsh-generated...
    rmdir /S /Q "fsh-generated" 2>nul
)
if exist "%BUILD_DIR%" (
    echo Sletter lokal bygg-cache...
    rmdir /S /Q "%BUILD_DIR%" 2>nul
)

echo %GREEN%Rensing fullført!%RESET%
pause
goto MENU

:: ================================================================================
:: OPEN_OUTPUT
:: ================================================================================
:OPEN_OUTPUT
if exist "%IG_DIR%\output\index.html" (
    start "" "%IG_DIR%\output\index.html"
    echo %GREEN%Åpner i nettleser...%RESET%
) else (
    echo %RED%Output finnes ikke! Kjør bygg først.%RESET%
)
pause
goto MENU

:: ================================================================================
:: END
:: ================================================================================
:END
echo %CYAN%Ha det!%RESET%
exit /b 0

:: ================================================================================
:: Utility functions
:: ================================================================================
:READ_NOBASIS_VERSION
set "NO_BASIS_VERSION="
for /f "usebackq tokens=1,* delims=:" %%a in (`findstr /R /C:"^[	 ]*hl7\.fhir\.no\.basis:" "%SUSHI_CONFIG%"`) do (
    set "NO_BASIS_VERSION=%%b"
)
set "NO_BASIS_VERSION=%NO_BASIS_VERSION: =%"
set "NO_BASIS_VERSION=%NO_BASIS_VERSION:"=%"
set "NO_BASIS_VERSION=%NO_BASIS_VERSION:'=%"
if "%NO_BASIS_VERSION%"=="" (
    echo %RED%FEIL: Fant ikke hl7.fhir.no.basis-versjon i %SUSHI_CONFIG%%RESET%
    exit /b 1
)
echo(%NO_BASIS_VERSION%| findstr /R /C:"^[0-9][0-9]*\.[0-9][0-9]*\.[0-9][0-9]*$" >nul
if errorlevel 1 (
    echo %RED%FEIL: Ugyldig hl7.fhir.no.basis-versjon "%NO_BASIS_VERSION%" i %SUSHI_CONFIG%%RESET%
    exit /b 1
)
exit /b 0

:START_BUILD_TIMER
for /f "usebackq tokens=*" %%t in (`powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"`) do set "BUILD_STARTED_AT=%%t"
for /f "usebackq tokens=*" %%t in (`powershell -NoProfile -Command "[DateTimeOffset]::Now.ToUnixTimeSeconds()"`) do set "BUILD_STARTED_EPOCH=%%t"
echo Starttid: %BUILD_STARTED_AT%
exit /b 0

:PRINT_BUILD_TIMING
if "%BUILD_STARTED_EPOCH%"=="" exit /b 0
for /f "usebackq tokens=*" %%t in (`powershell -NoProfile -Command "Get-Date -Format 'yyyy-MM-dd HH:mm:ss'"`) do set "BUILD_FINISHED_AT=%%t"
for /f "usebackq tokens=*" %%t in (`powershell -NoProfile -Command "[DateTimeOffset]::Now.ToUnixTimeSeconds() - %BUILD_STARTED_EPOCH%"`) do set "BUILD_DURATION_SECONDS=%%t"
for /f "usebackq tokens=*" %%t in (`powershell -NoProfile -Command "$s = [int64]%BUILD_DURATION_SECONDS%; [TimeSpan]::FromSeconds($s).ToString('hh\:mm\:ss')"`) do set "BUILD_DURATION=%%t"
echo.
echo Starttid: %BUILD_STARTED_AT%
echo Sluttid:  %BUILD_FINISHED_AT%
echo Varighet: %BUILD_DURATION%
exit /b 0
