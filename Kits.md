Perfect, thanks for clarifying 👍
You already have Qt 5 and Visual Studio 2019, and the build is failing mainly because kits + compiler + CMake + Ninja are not aligned.
Below is a VERY CLEAR, CORRECT, STEP-BY-STEP guide specifically for:

✅ Qt 5

✅ Visual Studio 2019 (MSVC v142)

✅ CMake

✅ Ninja

✅ Qt Creator Kits


This is written so you can copy directly into README.md and also follow it locally without guessing.


---

Local Windows Setup (Qt 5 + Visual Studio 2019 + Ninja)

This project is built using Qt 5, MSVC 2019 compiler, CMake, and Ninja on Windows.


---

1️⃣ Supported & REQUIRED Versions (IMPORTANT)

Component	Version

OS	Windows 10 / 11 (64-bit)
Qt	Qt 5.15.x (LTS)
Compiler	MSVC 2019 (v142)
Visual Studio	Visual Studio 2019
CMake	3.16+
Ninja	1.10+
Qt Creator	4.x / 5.x


⚠️ DO NOT mix Qt MSVC builds
Qt built with MSVC 2019 MUST use MSVC 2019 compiler only


---

2️⃣ Verify Visual Studio 2019 (MSVC v142)

Open:

x64 Native Tools Command Prompt for VS 2019

Run:

cl

You must see:

Microsoft (R) C/C++ Optimizing Compiler Version 19.xx

If not:

Open Visual Studio Installer

Modify → Enable Desktop development with C++



---

3️⃣ Verify Qt 5 Installation

Correct Qt version path should look like:

C:\Qt\5.15.2\msvc2019_64

❌ WRONG examples:

mingw81_64   (wrong compiler)
msvc2017_64  (compiler mismatch)

Required folders:

bin/
include/
lib/
plugins/


---

4️⃣ Configure Qt Creator (MOST IMPORTANT)

Open Qt Creator

Go to:

Tools → Options → Kits


---

🔹 Step 4.1: Qt Version

Tools → Options → Qt Versions

✔ Add:

C:\Qt\5.15.2\msvc2019_64\bin\qmake.exe

Qt Version name should show:

Qt 5.15.2 (MSVC 2019 64-bit)


---

🔹 Step 4.2: Compiler

Tools → Options → Compilers

Ensure you see:

Microsoft Visual C++ Compiler 2019 (x64)

If missing:

Click Add → MSVC

Select VS2019 x64 compiler



---

🔹 Step 4.3: CMake

Tools → Options → CMake

Set:

CMake executable: C:\Program Files\CMake\bin\cmake.exe


---

🔹 Step 4.4: Ninja

Tools → Options → Kits → Desktop Qt 5.15.2 MSVC 2019 64bit

Set:

CMake Generator: Ninja


---

✅ Final Kit Should Look Like

Setting	Value

Qt Version	Qt 5.15.x MSVC 2019
Compiler	MSVC 2019 x64
Debugger	CDB
CMake	System CMake
Generator	Ninja


✔ If any field is red → kit is broken


---

5️⃣ Required CMake Settings (Qt 5)

Your CMakeLists.txt MUST contain:

cmake_minimum_required(VERSION 3.16)
project(QtNinjaSample LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

find_package(Qt5 REQUIRED COMPONENTS Widgets)

add_executable(QtNinjaSample
    main.cpp
    MainWindow.cpp
    MainWindow.h
)

target_link_libraries(QtNinjaSample
    Qt5::Widgets
)

⚠️ Do NOT mix keyword and plain signatures ❌ Wrong:

target_link_libraries(app Qt5::Widgets)
target_link_libraries(app PRIVATE something)

✔ Correct:

target_link_libraries(app PRIVATE Qt5::Widgets)


---

6️⃣ Build Using Command Line (RECOMMENDED)

Open:

x64 Native Tools Command Prompt for VS 2019

Configure

cmake -S . -B build -G Ninja ^
  -DCMAKE_BUILD_TYPE=Release ^
  -DCMAKE_PREFIX_PATH=C:\Qt\5.15.2\msvc2019_64

Build

cmake --build build

Run

build\QtNinjaSample.exe


---

7️⃣ Why Build Was Failing Earlier (Root Cause)

❌ Qt 5 + Qt 6 mixed ❌ MSVC 2019 Qt used with MSVC 2022 compiler ❌ Wrong Kit (MinGW instead of MSVC) ❌ AUTOMOC not enabled ❌ target_link_libraries mixed styles


---

🔄 Correct Build Flow (Qt 5)

Qt Creator
   ↓
CMake
   ↓
Ninja
   ↓
MSVC 2019 (v142)
   ↓
Qt 5.15 Widgets
   ↓
.exe


---

✅ Summary (One Line)

> Qt version, compiler version, and kit must MATCH exactly — otherwise Windows Qt builds WILL FAIL




---

If you want, next I can:

🔍 Check your exact Qt 5 path

🧰 Fix your current broken kit

🧪 Provide working sample repo

📷 Provide Qt Creator screenshots (step-by-step)


Just tell me 👍
