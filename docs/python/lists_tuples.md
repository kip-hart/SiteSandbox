---
title: Lists & Tuples
---

The [Input & Data Types]({{ site.baseurl }}{% link python/input_data_types.md %}) page introduced lists and tuples as two ways to hold more than one value at a time.
This page covers indexing and slicing, the operations that change a list, and where tuples are used beyond a simple coordinate pair.

The Python documentation has guides on [Lists](https://docs.python.org/3/tutorial/introduction.html#lists) and [Tuples](https://docs.python.org/3/tutorial/datastructures.html#tuples-and-sequences).

## Indexing and Slicing

A list is indexed the same way as a string: `[0]` for the first element, `[-1]` for the last, and `[start:stop]` for a slice that includes `start` up to (but not including) `stop`.

```python
{% include python/lists_indexing_slicing/main.py %}
```
```text
{% include python/lists_indexing_slicing/screen_output.log %}
```

`altitudes[::-1]` uses a slice with a step of `-1`, which walks the list backward and produces a reversed copy.

## Modifying a List

Unlike a string or a tuple, a list can be changed after it's created:

```python
{% include python/lists_mutating/main.py %}
```
```text
{% include python/lists_mutating/screen_output.log %}
```

`append` adds a value to the end, `insert` adds one at a specific position, `pop` removes and returns the last value, and `remove` deletes the first value that matches the one given.
Each of these changes the list in place, rather than creating a new one.

A few more methods round out the common ways to modify a list:

```python
{% include python/lists_more_methods/main.py %}
```
```text
{% include python/lists_more_methods/screen_output.log %}
```

`extend` adds every value from another list, `count` reports how many times a value appears, `index` finds the position of the first match, and `reverse` flips the list in place.

## Concatenation and Repetition

`+` and `*` work on lists, but not the way they work on numbers:

```python
{% include python/lists_concat_repeat/main.py %}
```
```text
{% include python/lists_concat_repeat/screen_output.log %}
```

`a + b` joins the two lists end to end, and `a * 3` repeats the list's contents three times.
Neither one does element-wise math; that's what [NumPy Arrays]({{ site.baseurl }}{% link python/numpy.md %}) are for.

## Assignment Does Not Copy a List

Assigning a list to a new variable does not create a second, independent list; it just gives the same list a second name:

```python
{% include python/lists_aliasing/main.py %}
```
```text
{% include python/lists_aliasing/screen_output.log %}
```

`alias` and `original` refer to the same list, so a change made through `alias` shows up when reading `original` too.
Calling `.copy()` (or `list(original)`) creates an independent list, so changes to the copy don't affect the original.
This is a common source of bugs when it's unexpected.

## Common List Operations

A handful of built-in functions work on any list:

```python
{% include python/lists_operations/main.py %}
```
```text
{% include python/lists_operations/screen_output.log %}
```

`sorted(altitudes)` returns a new, sorted list without changing the original, while `altitudes.sort()` sorts the list in place.
The `in` operator tests whether a value appears anywhere in the list.

{% capture notice-text %}
## Example: Fuel Log Summary
### Question
{:.no_toc}
An aircraft's fuel remaining is logged once per hour during a flight.
Given the hourly readings, find the largest single-hour fuel burn and which hour it happened in.

### Solution
{:.no_toc}
A for loop builds a list of the hour-to-hour differences, then `max` and `index` find the largest one and where it occurred.

```python
{% include python/lists_example/main.py %}
```
```text
{% include python/lists_example/screen_output.log %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Tuples in Depth

A tuple looks and behaves like a list, except that it cannot be changed after it's created.
Attempting to assign to an element, such as `coordinates[0] = 0`, raises a `TypeError`.
This makes tuples a good fit for a fixed group of values that should never be modified, such as coordinates or a return value made up of several related numbers.

A function can only `return` a single value, but that value can be a tuple, which is how a function returns several results at once:

```python
{% include python/tuples_depth/main.py %}
```
```text
{% include python/tuples_depth/screen_output.log %}
```

`orbit_stats` returns `v, T`, which Python packs into a tuple automatically.
Writing `velocity, period = orbit_stats(398600, 6778)` unpacks that tuple directly into two variables; assigning the result to a single variable, as in `result`, keeps it as one tuple.

## Nested Lists

A list can contain other lists, which is a crude way to represent a 2D grid in plain Python:

```python
{% include python/lists_nested/main.py %}
```
```text
{% include python/lists_nested/screen_output.log %}
```

`grid[1]` is the second row (itself a list), and `grid[1][1]` indexes into that row for a single element.
Nested lists get unwieldy quickly for anything numeric, which is one of the reasons [NumPy Arrays]({{ site.baseurl }}{% link python/numpy.md %}) exist.

## Reading Questions

1. What is the difference between `altitudes[1:3]` and `altitudes[:3]`?
1. Name two list methods that change a list in place.
1. What is the difference between `sorted(altitudes)` and `altitudes.sort()`?
1. Why can't a list element be reassigned inside a tuple?
1. If a function ends with `return v, T`, what type of value does it return, and how would you unpack it into two variables?
1. How would you access the middle element of `grid = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]`?
1. What does `[1, 2] + [3, 4]` produce? What about `[1, 2] * 2`?
1. If `b = a` for two lists, and then `b.append(5)` is called, does `a` change? Why?
1. How would you make an independent copy of a list, rather than a second name for the same list?
