
Below is a clean, easy-to-copy README.md that explains everything clearly:

What tools are used

Versions

Windows environment

GitHub Actions (YML) flow

Qt Creator kit setup

How the build works (locally & CI)


👉 You can copy-paste this directly into your README.md.


---

Qt Ninja Sample (Qt 6 + CMake + Ninja)

This repository demonstrates a Qt 6 Widgets application built using CMake + Ninja on Windows, with GitHub Actions CI.

The setup is suitable for learning, interviews, and real projects.


---

🔧 Tools & Versions Used

💻 Development Environment (Windows)

Tool	Version

Operating System	Windows 10 / 11 (64-bit)
Qt	Qt 6.5.3 (LTS)
C++ Standard	C++17
Compiler	MSVC (Visual Studio 2022)
MSVC Toolset	v143
CMake	≥ 3.16
Build System	Ninja
Git	Latest
IDE	Qt Creator / Visual Studio / VS Code



---

🧱 Project Structure

qt-ninja-sample/
├── CMakeLists.txt
├── README.md
├── src/
│   ├── CMakeLists.txt
│   ├── main.cpp
│   ├── MainWindow.h
│   └── MainWindow.cpp
├── .github/
│   └── workflows/
│       └── build-windows.yml
└── .gitignore


---

⚙️ CMake Configuration (How Build Works)

Key CMake Features Used

qt_add_executable() – Qt 6 recommended API

CMAKE_AUTOMOC – Enables Qt Meta-Object Compiler (moc)

CMAKE_AUTOUIC, CMAKE_AUTORCC – Future-proof Qt UI/resource handling

Ninja generator for fast builds


Important CMake Settings

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

Why AUTOMOC is Required

Classes using Q_OBJECT need Qt’s moc-generated code.
Without AUTOMOC, linker errors occur.


---

▶️ Local Build Instructions (Windows)

1️⃣ Open Developer Command Prompt

Use:

“x64 Native Tools Command Prompt for VS 2022”


2️⃣ Configure Project

cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Release

3️⃣ Build

cmake --build build

4️⃣ Run Application

build\src\QtNinjaSample.exe


---

🧩 Qt Creator Setup (Very Important)

Qt Version

Qt 6.5.3

Compiler: MSVC 2019 or MSVC 2022 (must match Qt build)


Kit Configuration

In Qt Creator → Tools → Options → Kits:

Setting	Value

Qt Version	Qt 6.5.3
Compiler	MSVC 2022 (x64)
Debugger	CDB (from VS)
CMake	System CMake
Generator	Ninja


Open Project

Open CMakeLists.txt

Select the configured Ninja + MSVC Kit

Build & Run



---

🤖 GitHub Actions CI (Windows)

This project uses GitHub Actions to automatically build on every push.

CI Environment

Item	Value

Runner OS	windows-latest
Qt	6.5.3 (installed via install-qt-action)
Compiler	MSVC
Build Tool	Ninja
Build Type	Release


CI Flow (build-windows.yml)

1. Checkout repository


2. Setup MSVC environment


3. Install Ninja


4. Install Qt 6.5.3


5. Configure with CMake


6. Build with Ninja



Why Qt 6.5.3 in CI?

Qt 6.3.x is EOL and unavailable on CI mirrors.
Qt 6.5 is LTS and source-compatible, making CI stable.


---

🪟 Windows-Specific Notes

pthread warnings are normal on Windows

WrapVulkanHeaders warning is safe to ignore

Ninja does not generate .sln files

Visual Studio is used only as a compiler provider



---

🧠 Common Errors Fixed in This Project

Issue	Fix

target_link_libraries error	Use keyword signature (PRIVATE)
Qt meta-object linker errors	Enable CMAKE_AUTOMOC
CI PowerShell errors	Use single-line CMake commands
Qt version not found	Use Qt 6.5 LTS in CI



---

🎯 Why This Setup Is Industry-Ready

✔ Qt 6 LTS
✔ CMake best practices
✔ Ninja fast builds
✔ MSVC toolchain
✔ GitHub CI automation
✔ Works locally & on CI


---

📌 Summary

This repository shows a clean, modern Qt 6 C++ project with:

Proper CMake configuration

Correct Qt meta-object handling

Ninja-based builds

CI verification on Windows


Ideal for learning, interviews, and production starters.


---

If you want, I can also:

Add CI build badge

Upload exe as artifact

Add Linux/macOS CI

Convert to Qt QML

Add unit tests


Just tell me 👍
