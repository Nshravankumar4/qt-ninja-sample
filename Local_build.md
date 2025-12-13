Perfect! We can create a Windows batch file that will configure, build, and run your Qt Ninja Sample project locally using your installed Qt 6.5.3 MSVC2019 64-bit + Ninja + CMake + VS2019 setup.

Here’s a ready-to-use build.bat you can place in your project root:

@echo off
REM =============================================
REM Build Script for Qt Ninja Sample Project
REM Works with Qt 6.5.3 MSVC2019 64-bit + Ninja + CMake
REM =============================================

REM ----- Step 1: Set environment variables -----
SET QT_PATH=C:\Qt\6.5.3\msvc2019_64
SET VS_PATH=C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise
SET CMAKE_PATH=C:\Program Files\CMake\bin
SET NINJA_PATH=C:\Program Files\ninja

REM Add tools to PATH
SET PATH=%VS_PATH%\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64;%CMAKE_PATH%;%NINJA_PATH%;%QT_PATH%\bin;%PATH%

REM ----- Step 2: Go to project root -----
CD /D %~dp0

REM ----- Step 3: Clean previous build (optional) -----
IF EXIST build (
    echo Cleaning previous build folder...
    rmdir /S /Q build
)

REM ----- Step 4: Configure CMake -----
echo Configuring project with CMake...
cmake -S . -B build -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=%QT_PATH%

IF ERRORLEVEL 1 (
    echo CMake configuration failed.
    pause
    exit /b 1
)

REM ----- Step 5: Build project -----
echo Building project...
cmake --build build --config Release

IF ERRORLEVEL 1 (
    echo Build failed.
    pause
    exit /b 1
)

REM ----- Step 6: Run the executable -----
echo Running QtNinjaSample.exe...
build\QtNinjaSample.exe

pause


---

How this script works

1. Sets paths to your Qt, Visual Studio, CMake, and Ninja


2. Adds them to PATH so cl.exe, qmake.exe, cmake.exe, and ninja.exe are available


3. Cleans previous build (optional)


4. Runs CMake configure for Ninja + Qt6


5. Builds the project


6. Runs the resulting executable




---

Usage

1. Place build.bat in the root of your project:



qt-ninja-sample\build.bat

2. Open Command Prompt (x64 Native Tools for VS2019 recommended)


3. Run:



build.bat

The script will build and run your Qt Ninja Sample project automatically.



---

Notes

Make sure the paths in the script match your local installation paths:

%QT_PATH% → Qt 6.5.3 MSVC2019 folder

%VS_PATH% → Visual Studio installation folder

%CMAKE_PATH% → CMake folder

%NINJA_PATH% → Ninja folder


If you update Qt or VS, you need to update these paths.



---

If you want, I can also make a **version that automatically detects installed Qt and VS paths so you don’t have to manually edit paths in the batch file.

Do you want me to make that auto-detect version too?
