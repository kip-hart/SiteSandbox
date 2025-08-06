---
title: Variables & Data Types
---

Variables are named storage locations, and each variable has a data type.
That type determines how much memory is required to hold that variable, and
how to read and write that variable to the bits in memory.
The most common data types in this course are `float`, `double`, and `int` - though there are many more.

## Basic Data Types

C++ provides several fundamental types.
The exact size of each type can vary, but the table below summarizes typical 64-bit desktop ranges:

| Type                  | Description                  | Typical Size | Value Range                          |
|-----------------------|------------------------------|--------------|--------------------------------------|
| `char`                | Character (ASCII/Unicode)    | 1 byte       | –128 to 127 (signed)                 |
| `bool`                | Boolean flag                 | 1 byte       | true or false                        |
| `int`                 | Integer                      | 4 bytes      | –2<sup>31</sup> to 2<sup>31</sup>–1  |
| `unsigned`            | Non-negative integer         | 4 bytes      | 0 to 2<sup>32</sup>–1                |
| `float`               | Single-precision floating    | 4 bytes      | ~1.2E–38 to 3.4E+38                  |
| `double`              | Double-precision floating    | 8 bytes      | ~2.2E–308 to 1.8E+308                |
| `long long`           | Extended integer             | 8 bytes      | –2<sup>63</sup> to 2<sup>63</sup>–1  |
| `unsigned long long`  | Extended unsigned integer    | 8 bytes      | 0 to 2<sup>64</sup>–1                |

## Variable Declaration

A declaration introduces a variable's name and type to the compiler.
Until you initialize it, its value is indeterminate and often garbage.

```cpp
int count;
double average;
char grade;
bool isComplete;
```

Each line tells the compiler to both allocate storage sufficient for the given type and to associate it with the chosen variable name.
You can also declare multiple variables of the same type on one line:

```cpp
int x, y, z;
```

Many style guides recommend separating declarations into their own line,
for readability and to avoid accidental uninitialized variables.

## Initializing Variables

Initialization assigns a value at the moment of declaration.
C++ offers three common styles:

1. Copy Initialization\
```cpp
int value = 42;
double pi = 3.14159;
```
2. Direct initialization\
```cpp
int value(42);
double pi(3.14159);
```
3. Uniform initialization
```cpp
int value{42};
double pi{3.14159};
```

Uniform initialization prevents narrowing conversions, like assigning a `double` to an `int` without an explicit case,
which makes it safer.
If you declare without an initializer at block scope, the variable is left uninitialized.
At file scope, uninitialized variables get zero-initialized.

Uniform initialization was introduced in C++11.
{: .notice}

## Reading Questions

1. What two memory-related features are determined by a variable's data type?
1. How does an `unsigned` integer differ from a signed `int`?
1. What does it mean to declare a variable in C++?
1. What happens to the value of a variable declared without an initializer?
1. Write a single-line declaration that introduces three double-precision numbers `x`, `y`, and `z`.
1. Write a single-line declaration for the integer `k` and initialize it to 10 using copy initialization.
1. Repeat the previous except use uniform initialization.
1. If a source file contains a declared variable that is not initialized, will it fail to compile? If not, will it always fail to run?
