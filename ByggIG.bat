@echo off
setlocal enabledelayedexpansion

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

:: Konfigurasjonsvariabler
set "PUBLISHER_DIR=%SCRIPT_DIR%\publisher"
set "PUBLISHER_JAR=%PUBLISHER_DIR%\publisher.jar"
set "NO_BASIS_VERSION=2.2.0"
set "PUBLISHER_URL=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
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

:: Sjekk og installer dependencies
call :CHECK_JAVA || goto BUILD_FAILED
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

echo.
echo %GREEN%================================================================================
echo   IG BUILD FULLFØRT!
echo ================================================================================%RESET%
echo.
echo Output: %IG_DIR%\output\index.html
echo.
set /p open="Åpne i nettleser? (j/n): "
if /i "%open%"=="j" start "" "%IG_DIR%\output\index.html"

pause
goto MENU

:BUILD_FAILED
echo.
echo %RED%Build feilet! Sjekk feilmeldinger over.%RESET%
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

:ENSURE_PUBLISHER
if exist "%PUBLISHER_JAR%" (
    echo %GREEN%Publisher OK%RESET%
    exit /b 0
)

echo %YELLOW%Laster ned IG Publisher...%RESET%
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

echo %GREEN%Publisher lastet ned%RESET%
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
echo     1. npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1
echo     2. Last ned snapshot: %NO_BASIS_URL%
echo     3. npm install hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz
echo     4. Kopier node_modules\hl7.fhir.no.basis til: %cache_dir%\package\
echo.
exit /b 1

:: ================================================================================
:: INSTALL_NOBASIS - Følger korrekt sekvens for no-basis snapshot
:: ================================================================================
:INSTALL_NOBASIS
echo.
echo %BLUE%Installerer/fikser no-basis med snapshot...%RESET%
echo.

:: Slett gammel cache
set "cache_dir=%FHIR_CACHE%\hl7.fhir.no.basis#%NO_BASIS_VERSION%"
if exist "%cache_dir%" (
    echo Sletter gammel cache...
    rmdir /S /Q "%cache_dir%" 2>nul
)

:: Gå til script directory
cd /d "%SCRIPT_DIR%"

:: Steg 1: Installer FHIR R4 Core fra Simplifier
echo.
echo %YELLOW%Steg 1: Installerer FHIR R4 Core fra Simplifier...%RESET%
if not exist "node_modules\hl7.fhir.r4.core" (
    start /wait cmd /c "npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1 && echo. && echo FHIR R4 Core installert! && timeout /t 2"
    
    if not exist "node_modules\hl7.fhir.r4.core" (
        echo %RED%FHIR R4 Core installasjon feilet!%RESET%
        pause
        goto MENU
    )
) else (
    echo %GREEN%FHIR R4 Core allerede installert%RESET%
)

:: Steg 2: Last ned no-basis snapshot
echo.
echo %YELLOW%Steg 2: Laster ned no-basis snapshot...%RESET%
set "nobasis_file=hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz"
if not exist "%nobasis_file%" (
    powershell -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%NO_BASIS_URL%' -OutFile '%nobasis_file%' -UseBasicParsing; Write-Host 'Snapshot lastet ned!' -ForegroundColor Green } catch { Write-Host 'Download feilet!' -ForegroundColor Red; exit 1 }"
    
    if not exist "%nobasis_file%" (
        echo %RED%Nedlasting av snapshot feilet!%RESET%
        pause
        goto MENU
    )
) else (
    echo %GREEN%Snapshot allerede nedlastet%RESET%
)

:: Steg 3: Installer no-basis snapshot med npm
echo.
echo %YELLOW%Steg 3: Installerer no-basis snapshot med npm...%RESET%
start /wait cmd /c "npm install %nobasis_file% && echo. && echo no-basis snapshot installert! && timeout /t 3"

:: Sjekk om node_modules ble opprettet
if not exist "node_modules\hl7.fhir.no.basis" (
    echo %RED%npm install av no-basis feilet eller ble avbrutt!%RESET%
    pause
    goto MENU
)

:: Steg 4: Opprett FHIR package cache struktur
echo.
echo %YELLOW%Steg 4: Kopierer til FHIR package cache...%RESET%
if not exist "%cache_dir%" mkdir "%cache_dir%"
if not exist "%cache_dir%\package" mkdir "%cache_dir%\package"

:: Kopier alle filer fra node_modules til cache
xcopy /E /Y /Q "node_modules\hl7.fhir.no.basis\*" "%cache_dir%\package\" >nul

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