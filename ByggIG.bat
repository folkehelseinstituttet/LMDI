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
:: LMDI Implementation Guide - Windows build script
::
:: Målet er å bygge lokalt på samme måte som GitHub Actions-workflowen
:: LMDI-gh-pages-root.yml / LMDI-gh-pages:
::   - Leser no-basis-versjon fra sushi-config.yaml
::   - Installerer FHIR R4 core og no-basis snapshot
::   - Klargjør .fhir-snapshot slik Docker-containeren ser samme cache
::   - Kjører IG Publisher i hl7fhir/ig-publisher-base:latest
::   - Lokal bygging kjører SUSHI separat og Publisher med -no-sushi for å unngå Publisher-timeout
::   - Kjører engelsk dokumentasjonsflate
::   - Kopierer certificates.zip til output
:: ================================================================================

set "SCRIPT_DIR=%~dp0"
set "SCRIPT_DIR=%SCRIPT_DIR:~0,-1%"

set "SCRIPT_VERSION=2026-05-18.5"
set "IG=LMDI"
set "IG_DIR=%SCRIPT_DIR%\%IG%"
set "IG_INI=%IG_DIR%\ig.ini"
set "SUSHI_CONFIG=%IG_DIR%\sushi-config.yaml"

if not exist "%IG_INI%" (
    echo %RED%FEIL: Fant ikke %IG_INI%%RESET%
    echo Kjør scriptet fra repo-roten, eller legg det i mappen over LMDI.
    pause
    exit /b 1
)

if not exist "%SUSHI_CONFIG%" (
    if exist "%SCRIPT_DIR%\sushi-config.yaml" (
        set "SUSHI_CONFIG=%SCRIPT_DIR%\sushi-config.yaml"
    ) else (
        echo %RED%FEIL: Fant ikke sushi-config.yaml%RESET%
        pause
        exit /b 1
    )
)

set "PUBLISHER_JAR=%SCRIPT_DIR%\publisher.jar"
set "PUBLISHER_URL=https://github.com/HL7/fhir-ig-publisher/releases/latest/download/publisher.jar"
set "BUILD_DIR=%SCRIPT_DIR%\.ig-build"
set "NPM_WORK_DIR=%BUILD_DIR%\npm"
set "NO_BASIS_EXTRACT_DIR=%BUILD_DIR%\no-basis-snapshot"
set "FHIR_SNAPSHOT_DIR=%SCRIPT_DIR%\.fhir-snapshot"
set "LOCAL_FHIR_CACHE=%USERPROFILE%\.fhir\packages"
set "DOCKER_IMAGE=hl7fhir/ig-publisher-base:latest"
set "DOCKER_START_TIMEOUT_SECONDS=120"

call :READ_NOBASIS_VERSION || exit /b 1
set "NO_BASIS_URL=https://raw.githubusercontent.com/HL7Norway/resources/main/snapshots/hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz"
set "NO_BASIS_FILE=%NPM_WORK_DIR%\hl7.fhir.no.basis-%NO_BASIS_VERSION%-snapshots.tgz"
set "FHIR_R4_CACHE_DIR=%LOCAL_FHIR_CACHE%\hl7.fhir.r4.core#4.0.1\package"
set "NO_BASIS_CACHE_DIR=%LOCAL_FHIR_CACHE%\hl7.fhir.no.basis#%NO_BASIS_VERSION%\package"
set "FHIR_R4_DOCKER_CACHE_DIR=%FHIR_SNAPSHOT_DIR%\packages\hl7.fhir.r4.core#4.0.1\package"
set "NO_BASIS_DOCKER_CACHE_DIR=%FHIR_SNAPSHOT_DIR%\packages\hl7.fhir.no.basis#%NO_BASIS_VERSION%\package"

:MENU
cls
echo %BLUE%================================================================================
echo   LMDI IG Build System - lokal IG-bygging
echo ================================================================================%RESET%
echo.
echo   Repo:            %SCRIPT_DIR%
echo   IG:              %IG_INI%
echo   sushi-config:    %SUSHI_CONFIG%
echo   no-basis:        %NO_BASIS_VERSION%
echo   Docker image:    %DOCKER_IMAGE%
echo   Script version:  %SCRIPT_VERSION%
echo.
echo   Velg en opsjon:
echo.
echo   %CYAN%1.%RESET% Bygg IG lokalt uten Docker %GREEN%(anbefalt)%RESET%
echo   %CYAN%2.%RESET% Bygg IG som workflowen i Docker
echo   %CYAN%3.%RESET% Installer/fiks FHIR-pakker og no-basis snapshot
echo   %CYAN%4.%RESET% Sjekk dependencies
echo   %CYAN%5.%RESET% Rens lokal output og bygg-cache
echo   %CYAN%6.%RESET% Åpne output i nettleser
echo   %CYAN%7.%RESET% Avslutt
echo.
set /p choice="Skriv inn valg (1-7): "

if "%choice%"=="1" goto BUILD_LOCAL
if "%choice%"=="2" goto BUILD_DOCKER
if "%choice%"=="3" goto INSTALL_PACKAGES
if "%choice%"=="4" goto CHECK_DEPS
if "%choice%"=="5" goto CLEAN
if "%choice%"=="6" goto OPEN_OUTPUT
if "%choice%"=="7" goto END

echo %RED%Ugyldig valg.%RESET%
timeout /t 2 >nul
goto MENU

:: ================================================================================
:: BUILD_LOCAL
:: ================================================================================
:BUILD_LOCAL
echo.
echo %BLUE%Starter lokal IG build uten Docker med ByggIG.bat %SCRIPT_VERSION%...%RESET%
echo.

call :CHECK_NPM || goto BUILD_FAILED
call :CHECK_PYTHON || goto BUILD_FAILED
call :CHECK_JAVA || goto BUILD_FAILED
call :CHECK_SUSHI || goto BUILD_FAILED
call :ENSURE_PUBLISHER || goto BUILD_FAILED
call :INSTALL_PACKAGES_INTERNAL || goto BUILD_FAILED
call :RUN_SUSHI_LOCALLY || goto BUILD_FAILED
call :RUN_PUBLISHER_LOCALLY || goto BUILD_FAILED
call :BUILD_ENGLISH_DOC_LAYER || goto BUILD_FAILED
call :COPY_CERTIFICATES || goto BUILD_FAILED
goto BUILD_SUCCESS

:: ================================================================================
:: BUILD_DOCKER
:: ================================================================================
:BUILD_DOCKER
echo.
echo %BLUE%Starter workflow-lik IG build i Docker med ByggIG.bat %SCRIPT_VERSION%...%RESET%
echo.

call :CHECK_DOCKER || goto BUILD_FAILED
call :CHECK_NPM || goto BUILD_FAILED
call :CHECK_PYTHON || goto BUILD_FAILED
call :ENSURE_PUBLISHER || goto BUILD_FAILED
call :INSTALL_PACKAGES_INTERNAL || goto BUILD_FAILED
call :RUN_PUBLISHER_IN_DOCKER || goto BUILD_FAILED
call :BUILD_ENGLISH_DOC_LAYER || goto BUILD_FAILED
call :COPY_CERTIFICATES || goto BUILD_FAILED

:BUILD_SUCCESS
echo.
echo %GREEN%================================================================================
echo   IG BUILD FULLFØRT
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
echo %RED%Build feilet. Sjekk feilmeldinger over.%RESET%
pause
goto MENU

:: ================================================================================
:: INSTALL_PACKAGES
:: ================================================================================
:INSTALL_PACKAGES
echo.
echo %BLUE%Installerer/fikser FHIR-pakker og no-basis snapshot...%RESET%
echo.
call :CHECK_NPM || goto INSTALL_FAILED
call :INSTALL_PACKAGES_INTERNAL || goto INSTALL_FAILED
echo.
echo %GREEN%FHIR-pakker og no-basis snapshot er klargjort.%RESET%
pause
goto MENU

:INSTALL_FAILED
echo.
echo %RED%Installasjon feilet.%RESET%
pause
goto MENU

:INSTALL_PACKAGES_INTERNAL
if exist "%FHIR_R4_CACHE_DIR%\package.json" if exist "%NO_BASIS_CACHE_DIR%\package.json" (
    echo %GREEN%FHIR R4 core og no-basis %NO_BASIS_VERSION% finnes allerede i lokal FHIR-cache.%RESET%
    call :ENSURE_DOCKER_FHIR_SNAPSHOT_CACHE || exit /b 1
    exit /b 0
)

if not exist "%NPM_WORK_DIR%" mkdir "%NPM_WORK_DIR%"
cd /d "%NPM_WORK_DIR%"

if exist "%NPM_WORK_DIR%\package.json" del /Q "%NPM_WORK_DIR%\package.json" >nul 2>nul
if exist "%NPM_WORK_DIR%\package-lock.json" del /Q "%NPM_WORK_DIR%\package-lock.json" >nul 2>nul

if exist "%FHIR_R4_CACHE_DIR%\package.json" (
    echo %GREEN%FHIR R4 core 4.0.1 finnes allerede i lokal FHIR-cache.%RESET%
) else (
    echo %YELLOW%Installerer FHIR R4 core 4.0.1 fra Simplifier...%RESET%
    call npm --registry https://packages.simplifier.net install hl7.fhir.r4.core@4.0.1
    if errorlevel 1 exit /b 1
    if exist "%NPM_WORK_DIR%\node_modules\hl7.fhir.r4.core\package.json" (
        if not exist "%FHIR_R4_CACHE_DIR%" mkdir "%FHIR_R4_CACHE_DIR%"
        xcopy /E /Y /Q "%NPM_WORK_DIR%\node_modules\hl7.fhir.r4.core\*" "%FHIR_R4_CACHE_DIR%\" >nul
        if errorlevel 1 exit /b 1
    )
)

echo.
if exist "%NO_BASIS_CACHE_DIR%\package.json" (
    echo %GREEN%no-basis %NO_BASIS_VERSION% finnes allerede i lokal FHIR-cache.%RESET%
    goto PACKAGES_READY
)

echo %YELLOW%Laster ned no-basis snapshot %NO_BASIS_VERSION%...%RESET%
if not exist "%NO_BASIS_FILE%" (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%NO_BASIS_URL%' -OutFile '%NO_BASIS_FILE%' -UseBasicParsing } catch { Write-Host $_; exit 1 }"
    if errorlevel 1 exit /b 1
)
if not exist "%NO_BASIS_FILE%" exit /b 1

echo.
echo %YELLOW%Installerer no-basis snapshot med npm...%RESET%
call npm install "%NO_BASIS_FILE%"
if errorlevel 1 exit /b 1

set "NO_BASIS_SOURCE_DIR=%NPM_WORK_DIR%\node_modules\hl7.fhir.no.basis"
if not exist "%NO_BASIS_SOURCE_DIR%\package.json" (
    echo %YELLOW%Fant ikke node_modules\hl7.fhir.no.basis etter npm install. Pakker ut snapshot direkte.%RESET%
    call :EXTRACT_NOBASIS_SNAPSHOT || exit /b 1
    set "NO_BASIS_SOURCE_DIR=%NO_BASIS_EXTRACT_DIR%\package"
)

echo.
echo %YELLOW%Klargjør lokal .fhir cache...%RESET%
if not exist "%NO_BASIS_CACHE_DIR%" mkdir "%NO_BASIS_CACHE_DIR%"
xcopy /E /Y /Q "%NO_BASIS_SOURCE_DIR%\*" "%NO_BASIS_CACHE_DIR%\" >nul
if errorlevel 1 exit /b 1

:PACKAGES_READY
call :ENSURE_DOCKER_FHIR_SNAPSHOT_CACHE || exit /b 1

if exist "%NO_BASIS_DOCKER_CACHE_DIR%\no-basis-Substance.StructureDefinition.json" (
    echo %GREEN%no-basis snapshot er klargjort for Docker.%RESET%
) else (
    echo %YELLOW%Advarsel: Fant ikke no-basis-Substance.StructureDefinition.json i snapshot-cachen.%RESET%
)

cd /d "%SCRIPT_DIR%"
exit /b 0

:ENSURE_DOCKER_FHIR_SNAPSHOT_CACHE
echo %YELLOW%Klargjør .fhir-snapshot for Docker...%RESET%

if exist "%FHIR_R4_CACHE_DIR%\package.json" (
    if exist "%FHIR_R4_DOCKER_CACHE_DIR%" rmdir /S /Q "%FHIR_R4_DOCKER_CACHE_DIR%" >nul 2>nul
    mkdir "%FHIR_R4_DOCKER_CACHE_DIR%"
    xcopy /E /Y /Q "%FHIR_R4_CACHE_DIR%\*" "%FHIR_R4_DOCKER_CACHE_DIR%\" >nul
    if errorlevel 1 exit /b 1
)

if exist "%NO_BASIS_DOCKER_CACHE_DIR%" rmdir /S /Q "%NO_BASIS_DOCKER_CACHE_DIR%" >nul 2>nul
mkdir "%NO_BASIS_DOCKER_CACHE_DIR%"
xcopy /E /Y /Q "%NO_BASIS_CACHE_DIR%\*" "%NO_BASIS_DOCKER_CACHE_DIR%\" >nul
if errorlevel 1 exit /b 1
exit /b 0

:EXTRACT_NOBASIS_SNAPSHOT
where tar >nul 2>&1
if errorlevel 1 (
    echo %RED%Fant ikke tar.exe. Installer/fiks Windows tar eller Node/npm-installasjonen.%RESET%
    exit /b 1
)
if exist "%NO_BASIS_EXTRACT_DIR%" rmdir /S /Q "%NO_BASIS_EXTRACT_DIR%" >nul 2>nul
mkdir "%NO_BASIS_EXTRACT_DIR%"
tar -xzf "%NO_BASIS_FILE%" -C "%NO_BASIS_EXTRACT_DIR%"
if errorlevel 1 exit /b 1
if not exist "%NO_BASIS_EXTRACT_DIR%\package\package.json" (
    echo %RED%Snapshot-utpakking feilet: fant ikke package\package.json.%RESET%
    exit /b 1
)
exit /b 0

:: ================================================================================
:: RUN_SUSHI_LOCALLY
:: ================================================================================
:RUN_SUSHI_LOCALLY
cd /d "%SCRIPT_DIR%"

echo.
echo %BLUE%Kjører SUSHI lokalt uten Publisher-timeout...%RESET%
echo.

call sushi --out "%IG_DIR%" "%IG_DIR%"
if errorlevel 1 exit /b 1
exit /b 0

:: ================================================================================
:: RUN_PUBLISHER_LOCALLY
:: ================================================================================
:RUN_PUBLISHER_LOCALLY
cd /d "%SCRIPT_DIR%"

echo.
echo %BLUE%Kjører IG Publisher lokalt med Java uten å kjøre SUSHI på nytt...%RESET%
echo.

java -jar "%PUBLISHER_JAR%" publisher -ig "%IG%\ig.ini" -no-sushi
if errorlevel 1 exit /b 1
exit /b 0

:: ================================================================================
:: RUN_PUBLISHER_IN_DOCKER
:: ================================================================================
:RUN_PUBLISHER_IN_DOCKER
cd /d "%SCRIPT_DIR%"

echo.
echo %BLUE%Kjører IG Publisher i Docker, samme modus som workflowen...%RESET%
echo.

docker run --rm ^
  -v "%SCRIPT_DIR%:/github/workspace" ^
  -v "%FHIR_SNAPSHOT_DIR%:/home/publisher/.fhir" ^
  -e "IG=%IG%" ^
  -e "NO_BASIS_VERSION=%NO_BASIS_VERSION%" ^
  --workdir /github/workspace ^
  %DOCKER_IMAGE% ^
  bash -c "echo Docker container started && echo Checking snapshot && ls -la /home/publisher/.fhir/packages/ || true && if [ -f /home/publisher/.fhir/packages/hl7.fhir.no.basis#${NO_BASIS_VERSION}/package/no-basis-Substance.StructureDefinition.json ]; then echo 'Found snapshot in Docker container'; else echo 'Snapshot not found in Docker container'; fi && echo Running IG Publisher && java -jar publisher.jar publisher -ig ${IG}/ig.ini -generate"

if errorlevel 1 exit /b 1
exit /b 0

:: ================================================================================
:: Etterarbeid fra workflowen
:: ================================================================================
:BUILD_ENGLISH_DOC_LAYER
if not exist "%SCRIPT_DIR%\scripts\lag-en-doklag.py" (
    echo %YELLOW%Advarsel: scripts\lag-en-doklag.py finnes ikke. Hopper over engelsk dokumentasjonsflate.%RESET%
    exit /b 0
)

echo.
echo %BLUE%Bygger engelsk dokumentasjonsflate...%RESET%
call :RUN_PYTHON "%SCRIPT_DIR%\scripts\lag-en-doklag.py" --ig-root "%IG_DIR%" --output-dir "%IG_DIR%\output"
if errorlevel 1 exit /b 1
exit /b 0

:COPY_CERTIFICATES
echo.
echo %BLUE%Kopierer certificates.zip til output...%RESET%
if not exist "%IG_DIR%\input\includes\certificates.zip" (
    echo %YELLOW%Advarsel: Fant ikke %IG_DIR%\input\includes\certificates.zip. Hopper over kopiering.%RESET%
    exit /b 0
)
if not exist "%IG_DIR%\output" mkdir "%IG_DIR%\output"
copy /Y "%IG_DIR%\input\includes\certificates.zip" "%IG_DIR%\output\" >nul
if errorlevel 1 exit /b 1
exit /b 0

:: ================================================================================
:: CHECK_DEPS
:: ================================================================================
:CHECK_DEPS
echo.
echo %BLUE%Sjekker dependencies...%RESET%
echo.

call :CHECK_NPM
call :CHECK_PYTHON
call :CHECK_JAVA
call :CHECK_SUSHI
call :CHECK_DOCKER_OPTIONAL

if exist "%PUBLISHER_JAR%" (
    echo %GREEN%[OK] publisher.jar finnes i repo-roten%RESET%
) else (
    echo %YELLOW%[!] publisher.jar mangler, lastes ned ved bygg%RESET%
)

if exist "%NO_BASIS_DOCKER_CACHE_DIR%\package.json" (
    echo %GREEN%[OK] no-basis %NO_BASIS_VERSION% finnes i .fhir-snapshot%RESET%
) else (
    echo %YELLOW%[!] no-basis %NO_BASIS_VERSION% mangler i .fhir-snapshot%RESET%
)

pause
goto MENU

:CHECK_DOCKER
where docker >nul 2>&1
if errorlevel 1 (
    echo %RED%[X] Docker mangler. Installer Docker Desktop eller kjør workflowen i GitHub.%RESET%
    exit /b 1
)
docker version >nul 2>&1
if errorlevel 1 (
    echo %YELLOW%[!] Docker finnes, men Docker daemon svarer ikke.%RESET%
    call :START_DOCKER_DESKTOP || exit /b 1
)
echo %GREEN%[OK] Docker%RESET%
exit /b 0

:CHECK_DOCKER_OPTIONAL
where docker >nul 2>&1
if errorlevel 1 (
    echo %YELLOW%[!] Docker mangler. Kun nødvendig for valg 2.%RESET%
    exit /b 0
)
docker version >nul 2>&1
if errorlevel 1 (
    echo %YELLOW%[!] Docker finnes, men daemon svarer ikke. Kun nødvendig for valg 2.%RESET%
    exit /b 0
)
echo %GREEN%[OK] Docker for workflow-bygg%RESET%
exit /b 0

:START_DOCKER_DESKTOP
set "DOCKER_DESKTOP_EXE="
if exist "%ProgramFiles%\Docker\Docker\Docker Desktop.exe" set "DOCKER_DESKTOP_EXE=%ProgramFiles%\Docker\Docker\Docker Desktop.exe"
if not defined DOCKER_DESKTOP_EXE if exist "%LocalAppData%\Docker\Docker Desktop.exe" set "DOCKER_DESKTOP_EXE=%LocalAppData%\Docker\Docker Desktop.exe"

if not defined DOCKER_DESKTOP_EXE (
    echo %RED%[X] Fant ikke Docker Desktop. Start Docker manuelt, eller installer Docker Desktop.%RESET%
    exit /b 1
)

echo %YELLOW%Starter Docker Desktop...%RESET%
start "" "%DOCKER_DESKTOP_EXE%"
echo %YELLOW%Venter på Docker daemon i opptil %DOCKER_START_TIMEOUT_SECONDS% sekunder...%RESET%

for /L %%s in (1,1,%DOCKER_START_TIMEOUT_SECONDS%) do (
    docker version >nul 2>&1
    if not errorlevel 1 (
        echo.
        echo %GREEN%Docker daemon svarer.%RESET%
        exit /b 0
    )
    <nul set /p "=."
    timeout /t 1 /nobreak >nul
)

echo.
echo %RED%[X] Docker Desktop startet ikke innen %DOCKER_START_TIMEOUT_SECONDS% sekunder.%RESET%
echo Start Docker Desktop manuelt og prøv igjen.
exit /b 1

:CHECK_NPM
where npm >nul 2>&1
if errorlevel 1 (
    echo %RED%[X] npm mangler. Installer Node.js.%RESET%
    exit /b 1
)
echo %GREEN%[OK] npm%RESET%
exit /b 0

:CHECK_PYTHON
where python >nul 2>&1
if not errorlevel 1 (
    echo %GREEN%[OK] python%RESET%
    exit /b 0
)
where py >nul 2>&1
if not errorlevel 1 (
    echo %GREEN%[OK] py launcher%RESET%
    exit /b 0
)
echo %RED%[X] Python mangler. Trengs for scripts\lag-en-doklag.py.%RESET%
exit /b 1

:CHECK_JAVA
where java >nul 2>&1
if errorlevel 1 (
    echo %RED%[X] Java mangler. Trengs for lokal IG Publisher-kjøring.%RESET%
    exit /b 1
)
echo %GREEN%[OK] Java%RESET%
exit /b 0

:CHECK_SUSHI
where sushi >nul 2>&1
if errorlevel 1 (
    echo %RED%[X] SUSHI mangler. Installer med: npm install -g fsh-sushi%RESET%
    exit /b 1
)
echo %GREEN%[OK] SUSHI%RESET%
exit /b 0

:CHECK_JAVA_OPTIONAL
where java >nul 2>&1
if errorlevel 1 (
    echo %YELLOW%[!] Java mangler lokalt, men Publisher kjøres i Docker.%RESET%
) else (
    echo %GREEN%[OK] Java lokalt%RESET%
)
exit /b 0

:ENSURE_PUBLISHER
if exist "%PUBLISHER_JAR%" (
    echo %GREEN%publisher.jar finnes.%RESET%
    exit /b 0
)

echo %YELLOW%Laster ned IG Publisher til repo-roten, slik workflowen gjør...%RESET%
powershell -NoProfile -ExecutionPolicy Bypass -Command "try { [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri '%PUBLISHER_URL%' -OutFile '%PUBLISHER_JAR%' -UseBasicParsing } catch { Write-Host $_; exit 1 }"
if errorlevel 1 exit /b 1
if not exist "%PUBLISHER_JAR%" exit /b 1
echo %GREEN%publisher.jar lastet ned.%RESET%
exit /b 0

:: ================================================================================
:: CLEAN
:: ================================================================================
:CLEAN
echo.
echo %YELLOW%Renser lokal output og bygg-cache...%RESET%

if exist "%IG_DIR%\output" rmdir /S /Q "%IG_DIR%\output" 2>nul
if exist "%IG_DIR%\temp" rmdir /S /Q "%IG_DIR%\temp" 2>nul
if exist "%IG_DIR%\template" rmdir /S /Q "%IG_DIR%\template" 2>nul
if exist "%IG_DIR%\fsh-generated" rmdir /S /Q "%IG_DIR%\fsh-generated" 2>nul
if exist "%BUILD_DIR%" rmdir /S /Q "%BUILD_DIR%" 2>nul
if exist "%FHIR_SNAPSHOT_DIR%" rmdir /S /Q "%FHIR_SNAPSHOT_DIR%" 2>nul

echo %GREEN%Rensing fullført.%RESET%
pause
goto MENU

:: ================================================================================
:: OPEN_OUTPUT / END
:: ================================================================================
:OPEN_OUTPUT
if exist "%IG_DIR%\output\index.html" (
    start "" "%IG_DIR%\output\index.html"
    echo %GREEN%Åpner i nettleser...%RESET%
) else (
    echo %RED%Output finnes ikke. Kjør bygg først.%RESET%
)
pause
goto MENU

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

:RUN_PYTHON
where python >nul 2>&1
if not errorlevel 1 (
    python %*
    exit /b !errorlevel!
)
py -3 %*
exit /b !errorlevel!
