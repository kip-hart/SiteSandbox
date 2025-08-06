---
title: Compiling & Executing
---

After writing your C++ source file, running it is a two-step process.
First it needs to be *compiled* into an executable program.
Once it compiles, you then run that program.

Compiling the program requires the `g++` function on your computer.
In general, you can compile C++ source files for a variety of hardware - from a Windows desktop to an Arduino board in a drone.
The compiler creates an executable that runs on the target hardware.
There are other C++ compilers such as `clang` and `i++`.
In our class, the differences between these will not make a difference.
For large-scale computing or realtime embedded systems, the choice of compiler may affect performance.

## Compiling with g++

To translate your human-readable code into an executable,
invoke the `g++` compiler from the terminal by running:

```bash
g++ hello_world.cpp
```

This instructs the compiler to process the file `hello_world.cpp` and
produce the default executable `a.out` (or `a.exe` on Windows).
If you want a custom name for your executable, add the `-o` flag:

```bash
g++ hello_world.cpp -o hello_world
```

This tells `g++` to output a compiled program called `hello_world` (or `hello_world.exe`).

## Multiple Source Files

Larger projects often span several `.cpp` files.
You can compile them all at once by listing each file in your compile command:

```bash
g++ file1.cpp file2.cpp file3.cpp -o my_program
```

You can also grab all `.cpp` files in folder using the `*` wildcard:

```bash
g++ *.cpp -o my_program
```

## Additional Compiler Flags

Compilers offer options to help you catch mistakes early, control optimization, and include debugging information.
For example, `-Wall` enables most warning messages, while `-Wextra` activates additional diagnostics.
The `g++` compiler will always try to create an executable, even if there are warnings.
Adding these flags can expose what warnings it encounters.
The `-pedantic-errors` flag will convert diagnostic warnings into errors and prevent the executable from being generated.
This flag forces you to follow good programming habits and can prevent bugs from turning up when you run the executable.

Specifying a language standard with `-std=c++17` (or another version) ensures your code is interpreted according to modern C++ rules.
The `-g` flag embeds symbols for use by debuggers like `gdb`, and optimization levels such as `-O2` focus on generating faster code.
Using these flags together can dramatically improve code quality and maintainability.

## Compiler Errors

When your code contains syntax mistakes or semantic contradictions,
the compiler emits error messages and halts the build.
Each message includes a file name and line number, guiding you directly to the problematic code. Warnings, on the other hand, alert you to suspicious constructs - such as unused variables or implicit conversions - but do not stop the build.
Treating warnings as seriously as errors helps prevent bugs when executing your code.

## Program Execution

After successful compilation, run the produced executable by typing its name in the shell.
On Unix-like systems you prepend `./` to the executable (`./hello_world`),
whereas on Windows you simply run `hello_world.exe`.

```
> ./hello_world
Hello, World!
```

The program’s output appears in the console, and upon termination, the shell’s built-in variables (`$?` on Unix or `%ERRORLEVEL%` on Windows) capture the exit code.
By convention, `return 0;` indicates success, while any nonzero value signals an error condition you define.

## Reading Questions

1. What are the two main steps to run a C++ source file?
1. Write the shell command to compile a source file named `quadratic.cpp` into an executable named `quad`.
1. What is the purpose of the `-Wall` flag in the `g++` compiler?
1. Describe the effect of including the `-pedantic-errors` flag during compilation?
1. What is the difference between a compiler warning and compiler error?
1. How do you execute a compiled program?
1. What does the exit code `0` indicate after a program finishes running?
