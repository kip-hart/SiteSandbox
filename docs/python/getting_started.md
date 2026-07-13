---
title: Getting Started with Python
---

## Install Visual Studio Code
We will use [Visual Studio Code](https://code.visualstudio.com/) (VS Code) for learning Python.
Download and install it for free, accepting the default options along the way.
If you've never used VS Code before, take a few minutes to click around the interface - the [Get Started with VS Code](https://code.visualstudio.com/docs/getstarted/getting-started) walkthrough is a good introduction.

## Install Python
This course uses your computer's own ("system") Python install directly - no Windows Subsystem for Linux (WSL), virtual machines, or cloud services required.
Follow the section below for your operating system.

### Windows
1. Go to [python.org/downloads](https://www.python.org/downloads/) and download the latest stable release for Windows.
2. Run the installer. On the first screen, **check the box labeled "Add python.exe to PATH"** before clicking "Install Now." This step is easy to miss, but without it, VS Code and the terminal won't be able to find Python.
3. Once installation finishes, open a new terminal (PowerShell or Command Prompt) and run `python --version` to confirm it printed a version number.

### macOS
Recent versions of macOS do not include Python 3 by default.
1. Go to [python.org/downloads](https://www.python.org/downloads/) and download the latest stable release for macOS.
2. Open the downloaded `.pkg` file and follow the installer prompts.
3. Once installation finishes, open Terminal and run `python3 --version` to confirm it printed a version number. On macOS, the command is `python3`, not `python`.

### Linux
Most Linux distributions already include Python 3.
Open a terminal and run `python3 --version` to check.
If it's missing, install it with your distribution's package manager, for example `sudo apt install python3` on Ubuntu/Debian or `sudo dnf install python3` on Fedora.

## Checking for an Outdated Python Version
If you're using a hand-me-down or older computer, it may already have a version of Python installed that is no longer supported.
Each Python version only receives security updates for a few years after release, and running an unsupported version can cause confusing installation errors with newer packages.
Check the version you have with `python --version` (or `python3 --version` on macOS/Linux), and compare it against the actively supported versions listed on the [Python Developer's Guide](https://devguide.python.org/versions/).

If your version is no longer supported (or Python isn't there at all):
1. Install the latest version from [python.org/downloads](https://www.python.org/downloads/) by following the OS-specific steps above.
2. You do not need to uninstall the old version first - simply installing the newer version and pointing VS Code at it (see below) is enough.
3. If you aren't sure how Python was previously installed on the computer (from python.org, the Microsoft Store, Anaconda, or otherwise), installing fresh from python.org and explicitly selecting it in VS Code is the most reliable fix.

## Selecting a Python Interpreter in VS Code
Because a computer can end up with more than one Python install - for example, an old version alongside a newly installed one - VS Code needs to be told which one to use:

1. Open the Command Palette (`Ctrl+Shift+P` on Windows/Linux, `Cmd+Shift+P` on macOS).
2. Type "Python: Select Interpreter" and press Enter.
3. Choose the newest version in the list.

The selected interpreter's version appears in the bottom-right corner of the VS Code window whenever a Python file is open.

## Recommended Extension
Install the official [Python extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python) from Microsoft.
In VS Code, open the Extensions view (`Ctrl+Shift+X` on Windows/Linux, `Cmd+Shift+X` on macOS), search for "Python," and install the one published by Microsoft.
This extension bundles everything needed for this course: syntax highlighting, code completion, and an in-editor debugger.
It also provides the interpreter selection command described above.

## Running Python Code for the First Time
1. Create a new file named `hello.py` and save it somewhere you can find again, such as a `Documents/ENAE202` folder.
2. Type the following into the file:

   ```python
   print("Hello, World!")
   ```

3. Click the "Run" button (a triangle) in the top-right corner of the editor, or right-click anywhere in the file and choose "Run Python File in Terminal."
4. A terminal panel will open at the bottom of VS Code and print `Hello, World!`.
