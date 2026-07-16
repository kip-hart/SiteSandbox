---
title: Conditionals
---

Whether or not a block of code is executed in Python can be controlled using `if` statements.
Coupled with `elif` and `else`, you can write code that is executed depending on whether a logical expression is true.
For example, water boils into steam *if* the temperature is greater than the boiling point.

The Python documentation has a guide on [if Statements](https://docs.python.org/3/tutorial/controlflow.html#if-statements).

## Syntax

Conditional statements in Python follow this general structure:

```python
if condition1:
    statements1
elif condition2:
    statements2
else:
    statements3
```

Each condition is evaluated in order.
If `condition1` is true, `statements1` are executed and the rest are skipped.
If `condition1` is false but `condition2` is true, `statements2` are executed.
If none of the conditions are true, the `else` block is executed.
The `elif` and `else` blocks are both optional, and there can be any number of `elif` blocks.

Unlike MATLAB or C++, Python does not use an `end` keyword or curly braces to mark where a block starts and stops.
Instead, every line belonging to the same block must be indented by the same amount; the block ends as soon as a line returns to the previous indentation level.
The colon `:` at the end of the `if`, `elif`, and `else` lines is required, and forgetting it is a common source of syntax errors.

## Logical Expressions

Conditions are typically logical expressions involving comparison operators (`<`, `>`, `==`, `!=`, `<=`, `>=`) or logical operators (`and`, `or`, `not`).
A condition is true whenever it evaluates to Python's `True` value.

```python
{% include python/conditionals_disp/main.py %}
```
```text
{% include python/conditionals_disp/screen_output.log %}
```

{% capture notice-text %}
## Example: Material Selection
### Question
{:.no_toc}
An engineer is selecting a material for a structural component.
The material must have a yield strength above 250 MPa and a density below 8000 kg/m<sup>3</sup>.
Write a Python script to check if a material with yield strength 300 MPa and density 7800 kg/m<sup>3</sup> meets these criteria.

### Solution
{:.no_toc}

To evaluate the fitness of the material, we use an `if` statement to check the criteria.

```python
{% include python/conditionals_materials/main.py %}
```
```text
{% include python/conditionals_materials/screen_output.log %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Compound Conditions

Multiple conditions can be combined using logical operators.

* `and` is true only if both sides are true
* `or` is true if either side is true
* `not` reverses a condition, so `not True` is `False`

Both `and` and `or` short-circuit, stopping evaluation as soon as the overall result is known.
For example, in `condition1 and condition2`, if `condition1` is false, Python does not evaluate `condition2`, since the result is already determined.

## Nested If Statements

You can nest `if` statements inside other `if` blocks, to handle more complex logic.
Each nested `if` needs its own consistent indentation, one level deeper than the `if` it's nested inside.

```python
{% include python/conditionals_nested/main.py %}
```
```text
{% include python/conditionals_nested/screen_output.log %}
```

## A Few Tips

Writing `else if` as two words, rather than the single keyword `elif`, is a common syntax error carried over from other languages. Python does not recognize `else if` at all.
Similarly, using a single `=` instead of `==` inside a condition is a frequent mistake; `=` assigns a value, while `==` compares two values, and Python will raise a `SyntaxError` if you try to assign inside an `if` condition.
Finally, if a nested `if` statement starts to grow several levels deep, it is often clearer to pull that logic out into its own [function]({{ site.baseurl }}{% link python/user_functions.md %}) rather than keep nesting.

## Reading Questions

1. What is the purpose of an `if` statement in Python?
1. How does Python know where a block of code inside an `if` statement starts and ends, since it doesn't use an `end` keyword?
1. What happens if multiple conditions in an `if`-`elif`-`else` block are all true?
1. What is the difference between `=` and `==` in Python?
1. How would you write a conditional statement that checks if the value `x` is between 5 and 10, inclusive?
