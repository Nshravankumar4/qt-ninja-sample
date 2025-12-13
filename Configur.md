Got it 👍
Below is a very clear, step-by-step LOCAL WINDOWS SETUP GUIDE written so anyone can follow it from a fresh laptop.
You can copy-paste this directly into your README.md under a section like “Local Windows Setup”.


---

Local Windows Setup Guide (Qt 6 + CMake + Ninja)

This section explains exactly how to set up your Windows laptop to build this project locally, including what to install, versions, where to download, and how everything connects.


---

🖥️ System Requirements

Windows 10 or Windows 11 (64-bit)

At least 8 GB RAM (recommended)

Internet connection



---

1️⃣ Install Git

Why?

Used to clone the repository and push code to GitHub.

Download

👉 https://git-scm.com/download/win

Installation Notes

Keep all default options

Enable “Git from command line and 3rd-party tools”


Verify

git --version


---

2️⃣ Install Visual Studio 2022 (MSVC Compiler)

Why?

Qt on Windows uses MSVC to compile C++ code.

Download

👉 https://visualstudio.microsoft.com/downloads/

Choose:

Visual Studio 2022 Community (Free)


During Installation

Select Workloads: ✅ Desktop development with C++

Under Individual Components, ensure:

MSVC v143 – VS 2022 C++ x64/x86 build tools

Windows 10/11 SDK


Verify

Open:

> x64 Native Tools Command Prompt for VS 2022



Run:

cl


---

3️⃣ Install CMake

Why?

CMake generates Ninja build files.

Version Required

CMake 3.16 or newer


Download

👉 https://cmake.org/download/

Choose:

Windows x64 Installer


Installation Options

✔ Add CMake to system PATH

Verify

cmake --version


---

4️⃣ Install Ninja

Why?

Ninja is a fast build system used instead of Visual Studio .sln files.

Download

👉 https://github.com/ninja-build/ninja/releases

Download:

ninja-win.zip


Setup

1. Extract ninja.exe


2. Copy to:

C:\Program Files\ninja\


3. Add to PATH:

C:\Program Files\ninja



Verify

ninja --version


---

5️⃣ Install Qt 6.5.3 (LTS)

Why Qt 6.5?

Long-Term Support

Compatible with Qt 6.3 projects

Works on GitHub Actions


Download Qt Online Installer

👉 https://www.qt.io/download-qt-installer

During Installation

Select:

✔ Qt 6.5.3
✔ MSVC 2019 64-bit (recommended)
OR
✔ MSVC 2022 64-bit (if available)

✔ Qt Widgets
✔ CMake support

⚠️ Do NOT select MinGW

Default Install Location

C:\Qt\6.5.3\msvc2019_64


---

6️⃣ Install Qt Creator

Qt Creator usually installs with Qt installer.

Verify:

C:\Qt\Tools\QtCreator\bin\qtcreator.exe


---

7️⃣ Configure Qt Creator Kit

Open Qt Creator →

Go to:

Tools → Options → Kits

Kit Settings

Setting	Value

Qt Version	Qt 6.5.3
Compiler	MSVC 2022 x64
Debugger	CDB
CMake	System CMake
Generator	Ninja


Click Apply → OK


---

8️⃣ Clone Project from GitHub

git clone https://github.com/19r01a05g9-gif/qt-ninja-sample.git
cd qt-ninja-sample


---

9️⃣ Build Project Using Command Line (Recommended)

Open:

x64 Native Tools Command Prompt for VS 2022

Configure

cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

Build

cmake --build build

Run

build\src\QtNinjaSample.exe


---

🔄 Build Flow (Simple Explanation)

Qt Creator / CMD
     ↓
CMake (configures project)
     ↓
Ninja (build system)
     ↓
MSVC (compiler)
     ↓
Qt Libraries (Qt6Core, Qt6Widgets)
     ↓
Executable (.exe)


---

🧪 Common Issues & Fixes

❌ "unresolved external symbol metaObject"

✅ Fix:

set(CMAKE_AUTOMOC ON)

❌ Qt not found

✅ Fix:

Ensure correct MSVC Qt version

Qt and compiler must match (MSVC ↔ MSVC)


❌ Ninja not found

✅ Fix:

Add Ninja folder to PATH



---

✅ Final Result

Works on local Windows

Works on GitHub Actions

Uses Qt 6 + CMake + Ninja

Industry-standard setup



---

If you want next:

📦 Installer (.exe)

🧪 Unit tests

🎨 QML version

🐧 Linux build

🧾 Architecture diagram


Just tell me 👍
