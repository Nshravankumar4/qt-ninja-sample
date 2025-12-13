Perfect! Here’s a complete, ready-to-copy README guide for your project so you can set up everything locally on Windows and build your Qt 6 + VS2019 + C++17 project successfully. You can paste this directly into README.md.


---

Qt Ninja Sample – Local Windows Setup Guide

This guide explains how to set up your local Windows environment to build the Qt Ninja Sample project using:

Qt 6.5.x (MSVC 2019 64-bit)

Visual Studio 2019 (MSVC v142)

C++17

CMake 3.21+

Ninja



---

1️⃣ Required Software & Versions

Component	Version	Notes

Windows	10 / 11 (64-bit)	64-bit OS required
Qt	6.5.x (MSVC 2019 64-bit)	Must match compiler
Visual Studio	2019	Desktop development with C++ workload
MSVC Compiler	v142 (x64)	Must match Qt build
CMake	3.21+	Required for Qt 6 CMake builds
Ninja	1.10+	Recommended for fast builds
Qt Creator	4.x / 5.x	To manage kits and run/debug easily



---

2️⃣ Install Software

Step 2.1 – Install Visual Studio 2019

1. Download from Visual Studio Downloads


2. Select Desktop development with C++ workload


3. Make sure MSVC v142 x64/x86 and Windows 10 SDK are installed


4. Verify compiler:



cl

You should see:

Microsoft (R) C/C++ Optimizing Compiler Version 19.xx


---

Step 2.2 – Install Qt 6.5.x

1. Download Qt Online Installer


2. Select Qt 6.5.x → MSVC 2019 64-bit


3. Include Qt Creator, CMake, Qt Widgets module


4. Install path example:



C:\Qt\6.5.3\msvc2019_64


---

Step 2.3 – Install CMake

1. Download from CMake Downloads


2. Add to PATH


3. Verify:



cmake --version


---

Step 2.4 – Install Ninja

1. Download Ninja from GitHub Releases


2. Copy ninja.exe to:



C:\Program Files\ninja\

3. Add to PATH


4. Verify:



ninja --version


---

3️⃣ Configure Qt Creator Kit

1. Open Qt Creator → Tools → Options → Kits



Step 3.1 – Add Qt Version

Navigate to:


C:\Qt\6.5.3\msvc2019_64\bin\qmake.exe

Qt Creator detects Qt 6.5.x automatically


Step 3.2 – Compiler

MSVC 2019 x64

Must match Qt 6 MSVC build


Step 3.3 – CMake

Set path to installed CMake


Step 3.4 – Debugger

Auto-detected (CDB)


Step 3.5 – Generator

Ninja


✅ Kit should be all green


---

4️⃣ Configure Project CMake

Ensure your CMakeLists.txt contains:

cmake_minimum_required(VERSION 3.21)
project(QtNinjaSample LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Enable Qt6 automatic MOC, UIC, RCC
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

find_package(Qt6 REQUIRED COMPONENTS Widgets)

qt_add_executable(QtNinjaSample
    main.cpp
    MainWindow.cpp
    MainWindow.h
)

target_link_libraries(QtNinjaSample
    PRIVATE Qt6::Widgets
)


---

5️⃣ Build Project Locally

Option 1 – Qt Creator

1. Open project in Qt Creator


2. Select Kit: Qt 6.5.x MSVC 2019 64-bit


3. Click Run CMake → Build → Run




---

Option 2 – Command Line

1. Open x64 Native Tools Command Prompt for VS2019


2. Configure CMake:



cmake -S . -B build -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=C:\Qt\6.5.3\msvc2019_64

3. Build:



cmake --build build

4. Run executable:



build\QtNinjaSample.exe


---

6️⃣ Common Problems & Fixes

Issue	Cause	Fix

Kit not found / invalid	qmake path missing	Add correct qmake.exe
Unresolved symbols (metaObject)	AUTOMOC OFF	Enable CMAKE_AUTOMOC ON
Qt headers not found	CMAKE_PREFIX_PATH missing	Set CMAKE_PREFIX_PATH to Qt folder
Ninja not recognized	PATH missing	Add Ninja to PATH
Compiler mismatch	Qt MSVC ≠ VS	Install matching Qt version



---

7️⃣ Build Flow Summary

Qt Creator Kit
   ↓
CMake (AUTOMOC, AUTOUIC, AUTORCC)
   ↓
Ninja
   ↓
MSVC 2019 Compiler
   ↓
Qt6 Widgets
   ↓
Executable

> Key: Qt version, compiler, and CMake generator must match exactly.




---

This README will let you setup your Windows environment and build the project without errors, exactly like GitHub Actions CI.


---

If you want, I can also make a diagram with screenshots of Qt Creator Kit setup + paths, so you can literally follow step-by-step visually.

Do you want me to make that?
Ah! Now I understand clearly — you want a complete Qt Creator Kit setup for your project, with exact paths, all fields filled, step by step, so you can just follow it on Windows with Qt 6 + VS2019 + C++17 + Ninja. I’ll give it in a way that you can copy directly.


---

Full Qt Creator Kit Setup (Step by Step)

Assumptions for this setup

Windows 10 / 11 64-bit

Qt 6.5.3 MSVC2019 64-bit installed at:


C:\Qt\6.5.3\msvc2019_64

Visual Studio 2019 installed with Desktop C++ workload (MSVC v142, x64)

CMake 3.21+ installed

Ninja installed and added to PATH



---

1️⃣ Add MSVC Compiler Manually

1. Open Qt Creator → Tools → Options → Kits → Compilers


2. Click Add → Microsoft Visual C++ → choose C++



Fields to fill:

Field	Value

Name	MSVC 2019 x64
Path to compiler	C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Tools\MSVC\14.29.30133\bin\Hostx64\x64\cl.exe
ABI	x86-windows-msvc2019-64bit
Type	C++


3. (Optional) Repeat for C compiler with same cl.exe path




---

2️⃣ Add Qt Version

1. Open Qt Creator → Tools → Options → Kits → Qt Versions


2. Click Add


3. Select qmake.exe from your Qt installation:



C:\Qt\6.5.3\msvc2019_64\bin\qmake.exe

4. Qt Creator will detect Qt 6.5.3 MSVC2019 64-bit




---

3️⃣ Add CMake

1. Open Qt Creator → Tools → Options → Kits → CMake


2. Click Add


3. Path to CMake executable:



C:\Program Files\CMake\bin\cmake.exe


---

4️⃣ Add Debugger (CDB)

Usually auto-detected if you installed VS2019 Desktop with C++

If not, browse to:


C:\Program Files (x86)\Windows Kits\10\Debuggers\x64\cdb.exe


---

5️⃣ Create a Kit

1. Open Qt Creator → Tools → Options → Kits → Kits → Add


2. Fill fields:



Field	Value

Name	Qt6 MSVC2019 Ninja
Device type	Desktop
Qt version	Qt 6.5.3 MSVC2019 64-bit
Compiler C++	MSVC 2019 x64 (from step 1)
Compiler C	MSVC 2019 x64 (from step 1)
Debugger	CDB (auto-detected or path above)
CMake	CMake 3.21+ (path from step 3)
CMake generator	Ninja
Environment	System default
Qt mkspec	win32-msvc
Shadow build	Checked (optional, recommended)


✅ All checkmarks must be green — kit is valid


---

6️⃣ Set CMake Prefix Path for Qt

1. In Kit configuration → CMake configuration, add:



CMAKE_PREFIX_PATH=C:\Qt\6.5.3\msvc2019_64

> This allows CMake to find Qt headers and libraries automatically.




---

7️⃣ Configure Your Project

1. Open your Qt Ninja Sample project in Qt Creator


2. Select Kit: Qt6 MSVC2019 Ninja


3. Click Run CMake → ensure configuration succeeds




---

8️⃣ Build & Run

Click Build → Build the project

Click Run → Run the executable



---

✅ Optional Command Line Build

cd path\to\project
cmake -S . -B build -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=C:\Qt\6.5.3\msvc2019_64

cmake --build build
build\QtNinjaSample.exe


---

9️⃣ Notes

Make sure Qt version matches compiler (MSVC2019 64-bit)

Make sure CMake generator matches your setup (Ninja here)

CMAKE_AUTOMOC / AUTOUIC / AUTORCC must be ON in CMakeLists.txt

All paths (qmake.exe, cl.exe, cmake.exe, cdb.exe) must be exact



---

This fully working kit setup ensures your project will build locally exactly like GitHub Actions CI.


---

If you want, I can now make a visual diagram with screenshots of Qt Creator → Compilers → Kits tab showing exact paths and checkmarks, so you can just follow it visually without mistakes.

Do you want me to make that too?
