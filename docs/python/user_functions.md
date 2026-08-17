---
title: User-Defined Functions
---

Python allows you to define your own functions, in addition to built-in ones like `print()` and `len()`.
This improves code organization, reduces repetition, and improves readability.
A function can be called as many times as needed, from anywhere later in the same script.

The Python documentation has a guide on [Defining Functions](https://docs.python.org/3/tutorial/controlflow.html#defining-functions).

## Purpose of Functions

Functions are reusable blocks of code that accept inputs, perform operations, and return outputs.
They are especially useful when a calculation needs to be performed multiple times with different inputs.
They can also abstract the details of a complex operation into a simpler interface.
For example, when you call `math.sqrt(x)` you are not particularly interested in the algorithm used to compute a square root. You just want the answer.

## Syntax

A function is defined with the `def` keyword:

```python
def function_name(param1, param2):
    # code to compute a result
    return value
```

Calling `function_name()` does nothing until you actually invoke it by name, followed by parentheses:

```python
{% include python/func_basics/main.py %}
```
```text
{% include python/func_basics/screen_output.log %}
```

## Parameters and Return Values

A function can accept one or more parameters, use them in its body, and send a result back with `return`.
Execution of the function stops as soon as `return` runs.

```python
{% include python/func_params_return/main.py %}
```
```text
{% include python/func_params_return/screen_output.log %}
```

{% capture notice-text %}
## Example: Axial Stress
### Question
{:.no_toc}
A force of 5000 N is applied to a beam with a cross-sectional area of 0.002 m<sup>2</sup>.
Given the formula for axial stress:

$$ \sigma = \frac{F}{A} $$

write a Python function that calculates stress for any force and area, then use it to find the stress for the givens above.
Express your answer in MPa.

### Solution
{:.no_toc}

```python
{% include python/func_axial_stress/main.py %}
```
```text
{% include python/func_axial_stress/screen_output.log %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Default Parameter Values

A parameter can be given a default value, used whenever the caller doesn't provide one.
Defaults make a function flexible without forcing every caller to specify every input:

```python
{% include python/func_defaults/main.py %}
```
```text
{% include python/func_defaults/screen_output.log %}
```

## Keyword vs. Positional Arguments

Arguments can be passed by position, matched to parameters in order, or by keyword, matched by name regardless of order:

```python
{% include python/func_keyword_args/main.py %}
```
```text
{% include python/func_keyword_args/screen_output.log %}
```

Keyword arguments are especially useful for a function with several parameters, since `reusable=True` is clearer at the call site than a bare `True` in the third position.

## Multiple Return Values

A `return` statement can return more than one value, separated by commas.
Python packs them into a tuple, which the caller can unpack into separate variables.
See [Tuples in Depth]({{ site.baseurl }}{% link python/lists_tuples.md %}#tuples-in-depth) on the Lists & Tuples page for a worked example.

## Recursion

A function can call itself, which is called *recursion*.
Each call should solve a smaller version of the problem, until it reaches a *base case* that can be answered directly without another call:

```python
{% include python/func_recursion/main.py %}
```
```text
{% include python/func_recursion/screen_output.log %}
```

`factorial(5)` calls `factorial(4)`, which calls `factorial(3)`, and so on down to `factorial(1)`, which returns `1` without recursing further.
Recursion fits naturally when a problem is defined in terms of smaller versions of itself, but for most engineering code, a loop is clearer and avoids Python's recursion depth limit.

## Functions as Values

Functions in Python are values, just like a number or a string.
A function can be stored in a variable, passed as an argument to another function, and called later:

```python
{% include python/func_higher_order/main.py %}
```
```text
{% include python/func_higher_order/screen_output.log %}
```

`apply_twice` works with whatever function it's given, calling that function twice without needing to know what it does.
A function that accepts or returns another function like this is called a *higher-order function*.

## Variable Scope

Variables created inside a function are *local* to that function, and only exist while it's running.
Assigning to a variable inside a function does not affect a variable of the same name outside it:

```python
{% include python/func_scope/main.py %}
```
```text
{% include python/func_scope/screen_output.log %}
```

`x` inside `modify_x` is a different variable from `x` at the top level, even though they share a name.
To actually modify an outer variable from inside a function, you'd need the `global` keyword, but in this course, prefer passing values in as parameters and getting values out with `return` instead.
It's much easier to reason about.

## Best Practices

* Use descriptive names for functions and their parameters, so a reader can guess what they do without reading the body
* Include a docstring describing the purpose of the function and any non-obvious steps
* Avoid hardcoding values inside a function - pass them in as parameters instead, so the function stays reusable
* Keep the scope of each function narrow - one task per function

## Reading Questions

1. What are the benefits of user-defined functions in Python?
1. What keyword ends a function's execution and sends a value back to the caller?
1. Describe which variables from a script are, and are not, available inside a function called by that script.
1. How would you define a function that calculates the volume of a cylinder given its radius and height?
1. What is the difference between a positional argument and a keyword argument?
1. If a function is defined as `def f(a, b=10):`, what value does `b` take in the call `f(5)`?
1. What is a base case, and why does a recursive function need one?
1. What does it mean for a function to be a "higher-order function"?
