---
title: For Loops
---

A `for` loop in C++ is a control structure used to repeat a block of code a fixed number of times.  
It is ideal when the number of iterations is known in advance, such as iterating over array elements or performing a calculation a set number of times.

The `for` loop consists of three parts: initialization, condition, and update.  
These are placed inside parentheses and separated by semicolons.

## Syntax

```cpp
for (initialization; condition; update) {
    // loop body
}
```

* __Initialization__: Sets up a loop control variable, such as `int i=0`
* __Condition__: Evaluated before each iteration; loop continues with this is true
* __Update__: Modifies the loop control variable after each iteration

For example, to count from 1 to 5:

```cpp
{% include cpp/for_count/main.cpp %}
```
Prints this line:

```text
{% include cpp/for_count/screen_output.log %}
```

## Iterating over an Array

You can use a loop to access each element of the array `values` using the index `i`:

```cpp
int values[4] = {10, 20, 30, 40};

for (int i = 0; i < 4; i++) {
    cout << values[i] << endl;
}
```

## Loop Control and Scope
The loop control variable, like `int i`, is scoped to the loop if declared inside the `for` statement.
It cannot be accessed outside the loop body:

```cpp
for (int i = 0; i < 3; i++) {
    cout << i << endl;
}
// i is not accessible here
```

If declared outside the loop, the variable persists after the loop ends.

## Infinite Loops

If the condition is always true, the loop will run forever:

```cpp
for (;;) {
    // infinite loop
}
```

This is equivalent to `while(true)` and should be used with caution.

## Nested Loops

You can place one `for` loop inside another to iterate over multi-dimensional data:

```cpp
for (int row = 0; row < 3; row++) {
    for (int col = 0; col < 4; col++) {
        cout << "(" << row << "," << col << ") ";
    }
    cout << endl;
}
```

This prints a 3×4 grid of coordinates.

## Reading Questions
1. What are the three components of a `for` loop?
1. Write a `for` loop that prints the numbers from 10 down to 1.
1. How many times does the loop `for (int i = 0; i < 7; i++)` execute?
1. What happens if the condition in a `for` loop is always false?
1. Can you declare the loop control variable outside the `for` loop? What are the implications?
1. Write a nested for loop that prints a 2×3 grid of asterisks (`*`).
1. How would you use a `for` loop to sum the elements of an array?
