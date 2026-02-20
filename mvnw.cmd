@REM ----------------------------------------------------------------------------
@REM Maven Start Up Batch script
@REM
@REM This batch script is intended to be called from the Windows command line
@REM (cmd or powershell) to set environment variables and run Maven.
@REM ----------------------------------------------------------------------------

@echo off

setlocal enabledelayedexpansion

set DIRNAME=%~dp0
if "%DIRNAME%" == "" set DIRNAME=.
set APP_BASE_NAME=%~n0
set APP_HOME=%DIRNAME%

cd /d "%APP_HOME%"

if not defined JAVA_HOME (
    echo Error: JAVA_HOME is not set and no 'java' command could be found in your PATH.
    echo.
    echo Please set the JAVA_HOME variable in your environment to match the
    echo location of your Java installation.
    exit /b 1
)

set JAVA_EXE=%JAVA_HOME%\bin\java.exe
if not exist "%JAVA_EXE%" (
    echo Error: JAVA_HOME is set to an invalid directory: %JAVA_HOME%
    echo.
    echo Please set the JAVA_HOME variable in your environment to match the
    echo location of your Java installation.
    exit /b 1
)

setlocal enabledelayedexpansion

set MAVEN_HOME=%APP_HOME%\.mvn\wrapper\maven-3.9.6
set MAVEN_CMD_LINE_ARGS=%*
set MAVEN_OPTS=-XX:+IgnoreUnrecognizedVMOptions -XX:+AggressiveOpts

if not exist "%MAVEN_HOME%\bin\mvn.cmd" (
    echo Maven not found. Downloading Maven 3.9.6...
    
    set MAVEN_ZIP=%APP_HOME%\.mvn\wrapper\maven-3.9.6.zip
    set MAVEN_URL=https://archive.apache.org/dist/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.zip
    
    if not exist "%APP_HOME%\.mvn\wrapper" mkdir "%APP_HOME%\.mvn\wrapper"
    
    powershell -Command "Invoke-WebRequest -Uri '%MAVEN_URL%' -OutFile '%MAVEN_ZIP%'" || (
        echo Failed to download Maven
        exit /b 1
    )
    
    powershell -Command "Expand-Archive -Path '%MAVEN_ZIP%' -DestinationPath '%APP_HOME%\.mvn\wrapper'" || (
        echo Failed to extract Maven
        exit /b 1
    )
    
    for /d %%A in ("%APP_HOME%\.mvn\wrapper\apache-maven-*") do (
        ren "%%A" "maven-3.9.6"
    )
    
    del "%MAVEN_ZIP%"
)

"%MAVEN_HOME%\bin\mvn.cmd" %MAVEN_CMD_LINE_ARGS%
exit /b %ERRORLEVEL%
