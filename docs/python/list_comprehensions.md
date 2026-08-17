---
title: List Comprehensions
---

A list comprehension builds a new list from an existing sequence in a single line.
It replaces a common pattern seen on the [For Loops]({{ site.baseurl }}{% link python/for_loops.md %}) page: create an empty list, loop over something, and append to it on each pass.

The Python documentation has a guide on [List Comprehensions](https://docs.python.org/3/tutorial/datastructures.html#list-comprehensions).

## Syntax

A list comprehension follows this pattern:

```python
[expression for item in iterable]
```

`item` takes on each value in `iterable` in turn, `expression` is evaluated using that value, and the results are collected into a new list.

```python
{% include python/comp_manual_vs/main.py %}
```
```text
{% include python/comp_manual_vs/screen_output.log %}
```

Both loops above produce the same list. The comprehension just does it in one line instead of three.

## Filtering with a Condition

Adding `if condition` after the `for` clause skips any item for which the condition is false:

```python
{% include python/comp_filter/main.py %}
```
```text
{% include python/comp_filter/screen_output.log %}
```

Only values of `i` where `i % 2 == 0` is true make it into `evens`.
Every other value is skipped entirely, not included as some placeholder.

## Comprehension with an if/else Expression

A different use of `if` inside a comprehension is a conditional *expression*, written before the `for` clause, which chooses between two values rather than filtering:

```python
{% include python/comp_ifelse/main.py %}
```
```text
{% include python/comp_ifelse/screen_output.log %}
```

Every altitude produces a label, either `"high"` or `"low"`, so the output list is always the same length as the input.
This is different from the filtering form above: `if` before the `for` chooses a value for every item, while `if` after the `for` decides whether an item is included at all.

## Looping Over Two Sequences with zip()

`for` in a comprehension can iterate over `zip()` of two sequences, pairing up corresponding elements from each:

```python
{% include python/comp_zip/main.py %}
```
```text
{% include python/comp_zip/screen_output.log %}
```

`zip(names, masses)` pairs each name with the mass at the same position, and the comprehension builds one description string per pair.

## Calling a Function Inside a Comprehension

The expression in a comprehension can be a function call, applying that function to every item in the sequence:

```python
{% include python/comp_function/main.py %}
```
```text
{% include python/comp_function/screen_output.log %}
```

`classify_signal` is called once per reading, and the comprehension collects the results into `strengths`.

## Nested Comprehensions

A comprehension can be nested inside another, which is one way to build a 2D grid:

```python
{% include python/comp_nested/main.py %}
```
```text
{% include python/comp_nested/screen_output.log %}
```

The outer comprehension builds one row per value of `i`, and the inner comprehension builds that row's three columns.
Nested comprehensions get hard to read quickly. If you find yourself nesting more than two levels, a regular for loop is often clearer.

A comprehension can also use two `for` clauses side by side, rather than nested, to flatten a list of lists into a single flat list:

```python
{% include python/comp_flatten/main.py %}
```
```text
{% include python/comp_flatten/screen_output.log %}
```

This reads as "for each `row` in `grid`, for each `value` in that `row`, keep `value`."
That's the same order the two `for` clauses would appear in an equivalent nested for loop.

## Reading Questions

1. What problem does a list comprehension solve compared to writing a for loop that appends to an empty list?
1. Write a list comprehension that produces the cubes of the numbers from 0 to 9.
1. In `[i for i in range(10) if i % 3 == 0]`, what does the `if` clause do to the resulting list?
1. What is the difference between `if` used as a filter (after `for`) and `if` used as a conditional expression (before `for`) in a list comprehension?
1. Can a list comprehension call a function as its expression? Give an example.
1. What does `zip(names, masses)` produce when used inside a comprehension's `for` clause?
1. How would you flatten `[[1, 2], [3, 4]]` into `[1, 2, 3, 4]` using a comprehension?
