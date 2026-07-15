---
title: MATLAB User Interface
---

When MATLAB opens, it presents several panels arranged around the screen, plus a toolbar (called the **Toolstrip**) across the top.
Each panel has a specific job, and knowing what each one is for will help you navigate MATLAB quickly.
This page walks through the default layout.

The MATLAB Help Center has a [Desktop Basics](https://www.mathworks.com/help/matlab/learn_matlab/desktop.html) page with more details and screenshots of the current layout.

## Toolstrip
The Toolstrip runs along the top of the window and is organized into tabs, starting with **Home**.
The Home tab contains the most commonly used buttons: creating a new script, opening an existing file, saving your work, and importing data.
Other tabs, such as **Plots** and **Apps**, appear depending on what you're doing - for example, the Plots tab becomes useful once you've selected a variable in the Workspace that you want to visualize.

## Command Window
The Command Window is the center panel and the most important one for getting started.
It works like a calculator: type a command or expression, press Enter, and MATLAB executes it immediately.

```matlab
>> 2 + 2

ans =

     4
```

Anything you can put in a script can also be typed directly into the Command Window.
This makes it a convenient place to test a single line of code or check the value of a variable, but for anything longer than a few lines you should write a [script]({{ site.baseurl }}{% link matlab/scripts.md %}) instead so your work is saved and repeatable.

## Workspace
The Workspace panel, typically on the right, lists every variable currently defined - its name, value, size, and data type.
It updates automatically as you run commands or scripts.
Double-clicking a variable opens the Variable Editor, a spreadsheet-like view that lets you inspect or manually edit its contents.

The Workspace only shows variables that currently exist.
Running the `clear` command, or closing MATLAB, removes them.
See [Variables]({{ site.baseurl }}{% link matlab/variables.md %}) for more on creating, displaying, and clearing variables.

## Current Folder
The Current Folder panel, typically on the left, is a file browser scoped to MATLAB's current working directory.
It shows the scripts, functions, data files, and other files in that folder.
Double-clicking a `.m` file here opens it in the Editor.

The current folder matters because MATLAB looks there first when you type the name of a script or function.
If a file isn't in the current folder (or on MATLAB's search path), MATLAB won't be able to find it, even if the file exists somewhere else on your computer.

## Editor
The Editor opens whenever you create or open a script or function file (`.m`).
Unlike the Command Window, code typed in the Editor is not run line-by-line as you type it - you write the whole file, save it, then run it as a [script]({{ site.baseurl }}{% link matlab/scripts.md %}).
The Editor includes syntax highlighting and basic error checking, flagging likely mistakes before you even run the code.

## Command History
MATLAB keeps a log of every command you've run in the Command Window, available in the Command History panel.
This can be useful for finding a command you ran earlier but forgot to save into a script.
Double-clicking an entry in the Command History re-runs it.

## Reading Questions

1. Which panel would you use to check the current value of a variable named `x`?
1. Which panel would you use to see the contents of a script before opening it?
1. What is the difference between typing a command in the Command Window versus in the Editor?
1. Why does it matter whether a file is in MATLAB's current folder?
1. How would you re-run a command you typed 10 minutes ago without retyping it?
