---
title: While Loops
---

A `while` loop in C++ repeatedly executes a block of code as long as a given condition remains true.  
The condition is evaluated before each iteration, making it ideal for scenarios where the number of repetitions is not known in advance.  
Use `while` loops when you want to continue looping until some runtime condition changes, such as reading input until end-of-file or waiting for a user action.

## Syntax 
```cpp
while (condition) {
    // loop body
}
```

* __condition__: a boolean expression checked before each pass
* __loop body__: code block that runs only if the condition evaluates to true

For example, to count from 1 to 5:

```cpp
{% include cpp/while_count/main.cpp %}
```
Prints this line:

```text
{% include cpp/while_count/screen_output.log %}
```

## Iterating over an Array

```cpp
int values[4] = {10, 20, 30, 40};
int i = 0;
while (i < 4) {
    cout << values[i] << endl;
    i++;
}
```

Here, the loop variable `i` is declared outside the loop, and incremented within the body.

## Infinite Loops

A `while` loop whose condition never becomes false runs indefinitely:

while (true) {
    // infinite loop
}

Ensure you include a `break` or altering condition when an infinite loop must terminate.

## Pros and Cons
* Advantages
    - __Flexibility__: Loop continues based on runtime conditions
    - __Simplicity__: Clear structure for conditional repetition
* Disadvantages
    - Risk of infinite loops if condition never becomes false
    - Less concise when loop control variables require manual setup

## Reading Questions
1. What is the key difference between a `while` loop and a `for` loop in C++?
1. Write a `while` loop that prints the numbers from 10 down to 1.
1. In a `while` loop, when is the condition checked relative to the loop body execution?
1. How can you prevent an infinite `while` loop from running forever?
1. What do break and continue do inside a `while` loop?
1. Given an array `int data[5]`, write a `while` loop to compute the sum of its elements.
1. Where must you declare the loop control variable if you want to use it after the loop ends?
1. Describe a use case where a `while` loop is more appropriate than a `for` loop.
