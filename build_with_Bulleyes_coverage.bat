@echo off
REM ==============================================
REM Qt Ninja Sample - Build with Bullseye Coverage
REM ==============================================

REM --- Paths (EDIT THESE TO MATCH YOUR SYSTEM) ---
set QT_DIR=C:\Qt\6.5.3\msvc2019_64
set VS_DEV_CMD="C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
set BULLSEYE_DIR=C:\Program Files\BullseyeCoverage
set PROJECT_DIR=%~dp0
set BUILD_DIR=%PROJECT_DIR%build
set COVFILE=%PROJECT_DIR%coverage.cov

REM --- Add Bullseye to PATH ---
set PATH=%BULLSEYE_DIR%;%PATH%

REM --- Start Bullseye coverage ---
echo Starting Bullseye coverage...
cov01 -1

REM --- Setup Visual Studio environment ---
echo Setting up VS environment...
call %VS_DEV_CMD%

REM --- Clean previous build ---
if exist "%BUILD_DIR%" (
    echo Cleaning previous build...
    rmdir /s /q "%BUILD_DIR%"
)

REM --- Configure CMake with Ninja and Qt ---
echo Configuring CMake project...
cmake -S "%PROJECT_DIR%" -B "%BUILD_DIR%" -G Ninja ^
  -DCMAKE_PREFIX_PATH="%QT_DIR%" ^
  -DCMAKE_C_COMPILER="covc cl" ^
  -DCMAKE_CXX_COMPILER="covc cl"

REM --- Build the project ---
echo Building project...
cmake --build "%BUILD_DIR%"

REM --- Run the executable ---
echo Running the executable...
"%BUILD_DIR%\QtNinjaSample.exe"

REM --- Stop Bullseye coverage ---
echo Stopping Bullseye coverage and generating .cov file...
cov01 -0

echo ==============================================
echo Build + Coverage completed.
echo Coverage file: %COVFILE%
echo ==============================================
pause
