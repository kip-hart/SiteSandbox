---
title: Variables & Output
---

Now that Python is installed and VS Code can run a script, this page covers the two building blocks of every program: storing values in **variables** and displaying them with **screen output**.

## Variables
A variable is a name associated with a value stored in memory.
Unlike C++, Python does not require you to declare a variable's type ahead of time - simply assign a value with `=` and Python figures out the type automatically:

```python
altitude = 10000
velocity = 245.6
craft_name = "Voyager"
```

Each of these lines creates a variable and immediately assigns it a value.
There is no separate declaration step, and a variable can later be reassigned to a value of a different type if needed.
The types used above - whole numbers, decimal numbers, and text - are covered in more detail on the [Input & Data Types]({{ site.baseurl }}{% link python/input_data_types.md %}) page.

### Naming Variables
Python variable names:

1. Must start with a letter or underscore (not a digit)
2. May contain only letters, digits, and underscores
3. Are case-sensitive, so `velocity` and `Velocity` are different variables
4. Cannot be one of Python's reserved keywords, such as `for`, `if`, or `class`

The [Python style guide (PEP 8)](https://peps.python.org/pep-0008/#function-and-variable-names) recommends `snake_case` for variable names - all lowercase, with underscores separating words, as in the examples above.
Following this convention makes your code easier for others (including your future self) to read.

## Displaying Output with print()
Python does not automatically display the value of a variable the way MATLAB does when a line isn't terminated with a semicolon.
To show something on screen, call the built-in `print()` function:

```python
{% include python/print_basics/main.py %}
```

```text
{% include python/print_basics/screen_output.log %}
```

A few things to notice:

* `print()` automatically adds a newline at the end of its output, so you do not need to add `\n` yourself like you would with `cout` in C++.
* Passing several values, separated by commas, prints them separated by a single space. This works even when mixing text and numbers - `print()` converts each value to text for you.
* Typing a bare variable name on its own line, like `altitude`, only echoes its value when working directly in an interactive Python session. Inside a script file, it does nothing; you must call `print()`.

## Formatting Output
For engineering calculations, printing every digit of a floating point number is rarely useful.
An f-string (formatted string) lets you embed variables directly inside a string and control how numbers are displayed:

```python
{% include python/fstring_kinetic_energy/main.py %}
```

```text
{% include python/fstring_kinetic_energy/screen_output.log %}
```

An f-string is written like a normal string, but with an `f` immediately before the opening quote.
Anything inside curly braces `{}` is evaluated as Python code and inserted into the string.
Adding `:.2f` after a value formats it as a fixed-point number with 2 digits after the decimal point; the number of digits can be changed to whatever precision is appropriate.

{% capture notice-text %}
### Example: Formatted Altitude Report
#### Question
{:.no_toc}
A weather balloon rises at 5.25 meters per second and has been ascending for 320 seconds.
Write a Python script that computes the balloon's altitude and prints it rounded to 1 decimal place, in the form `Altitude: ___ m`.

### Solution
{:.no_toc}

```python
{% include python/balloon_altitude/main.py %}
```

```text
{% include python/balloon_altitude/screen_output.log %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. What is the main difference between declaring a variable in C++ and creating one in Python?
1. Which of these are valid Python variable names: `2x_speed`, `x_2speed`, `for`, `x-speed`, `_altitude`?
1. What naming convention does PEP 8 recommend for Python variables?
1. What happens if you type a variable name by itself on a line in a Python script, rather than passing it to `print()`?
1. What character does `print()` automatically add to the end of its output?
1. Write a line of code that prints the values of two variables, `x` and `y`, separated by a comma and space, in the form `x = 3, y = 7`.
1. What does adding `:.2f` inside an f-string's curly braces do?
