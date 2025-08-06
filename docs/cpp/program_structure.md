---
title: Program Structure
---

C++ programs have a little more overhead compared to MATLAB.
As we will see, this makes it easier to manage larger and more complicated projects.
Consider this MATLAB function:

```matlab
function main
    disp('Hello, World!')
end
```

This simply prints the phase "Hello, World!" to the Command Window.
To accomplish the same in C++, we would write a file containing:

```cpp
#include <iostream>

using namespace std;

int main(void){
    cout << "Hello, World!" << endl;
    return 0;
}
```

The C++ implementation has some more elements, but we can see a couple similarities.
The following explains the key elements of a basic C++ source file.

## Commented "Hello, World!"

```cpp
{% include cpp/hello_world/hello_world.cpp %}
```

## Filename

The name of this file is `hello_world.cpp`. 
The `.cpp` extension identifies this as a C++ source file.
Other C++ files have a `.h` extension, but they will become relevant later in the course.
Unlike MATLAB, the name of a source file does not need to match the name of any function within the file.

## Preprocessor Directives

The line `#include <iostream>` is *including* a standard C++ library named `iostream`.
This library provides input and output related functions, such as `cout` to output text to the terminal.

Given how useful these input and output functions are, it may be strange that they are not immediately available - without including a library.
The reason is that C++ is a very generic language, used in everything from desktop computers to jet engines.
The jet engine has no screen or keyboard, so input/output functions would be useless in that context.

By organizing C++ built-in functions into libraries and letting users choose which ones to include, programs written in C++ are smaller and faster.
For a list of all standard libraries, visit [C++ Standard Library headers](https://en.cppreference.com/w/cpp/header.html).

## Namespace Declarations

By writing `using namespace std;`, you are telling the compiler that
unqualified names such as `cout` and `endl` refer to entities in the standard namespace.
This avoids the need to prefix them with `std::` every time.
In other words, `iostream` includes the function `std::cout` and by using the `std` namespace, we are letting the C++ compiler know that `cout` is shorthand for `std::cout`.

## Program Entry Point

The function signature `int main(void)` marks where execution begins.
The C++ compiler looks for a function matching the `int main(void)` signature and runs
the code in that function.
Breaking this line down further, `int` means that this function returns an integer, a variable of type `int`.
The name of the function is `main`.
The inputs to the function are contained in parentheses, and in this case there are no
inputs so we use the keyword `void`.
This keyword is not strictly necessary, and you can compile `int main()`,
however it is less clear that the `main` function takes no arguments.

## Code Statements

The content of the `main` function is contained within the curly braces `{}`
that follow the function signature.
A function can contain any number of statements.
Each one must be terminated with a semicolon, `;`.
Whitespace does not matter in C++.
Multiple statements can be written on a single line.
A statement can be split across multiple lines.
In general, statements are indented to make it visually clear which function is calling them.

## Return Statement

The statement `return 0;` signals successful completion of the program.
If you return a nonzero value, that value can be used to indicate different error conditions.
There is no common meaning for non-zero return values,
so you would need to document what those error codes mean.

## Comments

Lines starting with `//` are single-line comments.
You can also use them to comment at the end of a line of code.
Anything between `/*` and `*/` is a multi-line comment.
Comments are ignored by the compiler and serve to explain your code's intent
to human readers.

## Reading Questions

1. What are two ways C++ files are different from MATLAB files? What benefits do those differences have?
1. What is the correct file extension for C++ source files?
1. What does `#include <iostream>` do?
1. Which C++ standard library handles random number generation? Hint: check the website.
1. Which function in a cpp file does a C++ executable run?
1. What does `return 0;` do in a C++ program?
1. When would you return a non-zero integer?
