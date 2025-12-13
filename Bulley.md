Perfect! Here's a ready-to-use build_with_coverage.bat for your Qt Ninja Sample project with BullseyeCoverage integration. You just need to edit the paths once to match your local setup.


---

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


---

How to Use Locally

1. Edit paths in the bat file:

QT_DIR → your Qt6 MSVC installation path

VS_DEV_CMD → path to vcvars64.bat for MSVC 2019

BULLSEYE_DIR → Bullseye installation path



2. Place the bat file in the root of your project (next to CMakeLists.txt).


3. Open Command Prompt and run the bat:



build_with_coverage.bat

4. Output:

.cov file will be created in your project root (coverage.cov)

Build logs, compilation, and executable output appear in the terminal





---

✅ Key Features of This Bat File

Starts coverage before build (cov01 -1)

Cleans old builds to ensure instrumented compilation

Wraps compiler with Bullseye (covc cl)

Runs your executable to record executed lines

Stops coverage and writes .cov



---

If you want, I can also create a GitHub Actions workflow that uses this bat file to build your project on CI and generate Bullseye coverage automatically, just like your local run.

Do you want me to create that workflow too?
