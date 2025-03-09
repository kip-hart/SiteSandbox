---
title: Hello World
src: hello_world/
src_01: hello_world.cpp
---

This file contains the classic minimal example of a C++ source file, "Hello World".
First, the file specifies that the `iostream` standard library is used here and
it should be included during compilation.
Next, it imports the names of functions and constants from the `std` namespace.
Specifically, `cout` and `endl` are imported to make the code more readable
(and generally faster to write) than if we had to specify `std::cout` and `std::endl`.

The core of this file is the `main` function.
Preceding the word `main` is the specification that this function returns an integer, `int`.
Within the input parentheses is the word `void`, which indicates that this function takes no input.
All `main` functions in this course having the same prototype: `int main(void)`.
The curly braces, `{}`, contain the contents of the `main` function.

The first line of the function *out*puts two things: the string `"Hello, World!"` and the carriage return `endl`.
This character is equivalent to pressing the Enter key to go down to the next line.
The second line of the function returns the integer `0`.
This is the expected behavior of a `main` function, indicating that the preceding code executed successfully.

```cpp
{% include {{ site.cpp_dir }}{{ page.src }}{{ page.src_01 }} %}
```

This file can be compiled by running the terminal command:
```bash
g++ {{ page.src_01 }}
```

This will create an executable named `a.exe` on Windows computers, and `a.out` on Mac and Linux.
To run the executable, type `./a.exe` on Windows or `./a.out` on Mac and Linux.
The output from running the executable is:

```text
{% include {{ site.cpp_dir }}{{ page.src }}screen_output.log %}
```
