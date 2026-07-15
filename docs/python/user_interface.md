---
title: VS Code User Interface
---

Now that Python and the Python extension are installed, this page tours VS Code's interface so you know where to look for what you need.
The [User Interface](https://code.visualstudio.com/docs/getstarted/userinterface) page in the VS Code documentation covers this in more depth, with up-to-date screenshots.

## Activity Bar and Side Bar
The **Activity Bar** is the narrow strip of icons on the far left edge of the window.
Clicking an icon opens a corresponding view in the **Side Bar** next to it.
The two you'll use most in this course are:

* **Explorer** (top icon, looks like stacked pages): shows the files and folders in whatever folder you have open in VS Code. Click a file to open it in the Editor.
* **Extensions** (icon made of squares): where you installed the Python extension - see [Recommended Extension]({{ site.baseurl }}{% link python/getting_started.md %}#recommended-extension).

There's also a **Run and Debug** icon, which gives more control than the Run button described on the Getting Started page - for example, pausing execution at a specific line to inspect variables.
This isn't necessary for the exercises in this course, but is worth knowing about as your programs grow more complex.

## Editor
The Editor is the large central area where you write code.
Each open file appears as its own tab across the top; a dot on a tab means that file has unsaved changes.
Save the current file with `Ctrl+S` (Windows/Linux) or `Cmd+S` (macOS).
With the Python extension installed, the Editor provides syntax highlighting and autocompletion as you type.

## Panel: Terminal
The **Panel** is the area at the bottom of the window, with tabs for Terminal, Problems, Output, and more.
The Terminal tab is where the output of your script appears when you click Run - it's an actual command-line terminal running inside VS Code, not just a read-only log.
You can also type commands directly into it, such as checking your Python version (`python --version`) or installing a library (`pip install numpy`).

Toggle the panel open or closed with `` Ctrl+` `` - this shortcut uses Control on both Windows/Linux and macOS.

## Status Bar
The Status Bar runs along the very bottom edge of the window.
Among other things, it shows which Python interpreter is currently selected - see [Selecting a Python Interpreter in VS Code]({{ site.baseurl }}{% link python/getting_started.md %}#selecting-a-python-interpreter-in-vs-code) for why this matters and how to change it.
Clicking the interpreter version in the Status Bar is a shortcut to the same interpreter picker.

## Reading Questions

1. Which icon in the Activity Bar do you click to browse the files in your project?
1. Where does the printed output of a script appear when you click Run?
1. How do you toggle the integrated terminal open and closed with the keyboard?
1. Besides running scripts, what else can you do in the integrated terminal?
1. Where in the window can you check which Python interpreter is currently selected?
1. What does a dot on a file's tab in the Editor indicate?
