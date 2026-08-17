---
title: NumPy Arrays
---

NumPy is a third-party library for numeric arrays and the math operations that go with them.
It fills a gap that plain Python lists leave open: fast, element-wise math over a whole sequence of numbers at once.

The [Using Libraries]({{ site.baseurl }}{% link python/libraries.md %}) page covers importing a library in general.
NumPy is almost always imported under the alias `np`.

The NumPy documentation has a [Quickstart guide](https://numpy.org/doc/stable/user/quickstart.html).

## Why NumPy?

A plain Python list does not support element-wise math.
Multiplying a list by a number repeats its contents rather than scaling each value:

```python
{% include python/numpy_why/main.py %}
```
```text
{% include python/numpy_why/screen_output.log %}
```

Converting the list to a NumPy array with `np.array()` changes what `*` means: instead of repeating the sequence, it multiplies every element.

## Creating Arrays

NumPy provides several functions for creating arrays beyond converting an existing list:

```python
{% include python/numpy_create/main.py %}
```
```text
{% include python/numpy_create/screen_output.log %}
```

`np.zeros` and `np.ones` create arrays filled with a single value, `np.arange` works like `range()` but returns an array, and `np.linspace` produces a fixed number of evenly spaced points between two bounds.

## Array Shape and dtype

Every array has a `shape`, describing its dimensions, and a `dtype`, describing the type of value it stores:

```python
{% include python/numpy_shape_dtype/main.py %}
```
```text
{% include python/numpy_shape_dtype/screen_output.log %}
```

Unlike a plain Python list, every element of a NumPy array shares the same `dtype`.
Passing `dtype=float` (or another type) when creating an array forces that type, regardless of what the input values look like.

## Reshaping an Array

`reshape` returns the same data arranged into a different shape, without changing the number of elements:

```python
{% include python/numpy_reshape/main.py %}
```
```text
{% include python/numpy_reshape/screen_output.log %}
```

The new shape's dimensions must multiply out to the same total count as the original.
Reshaping 6 elements into `(2, 3)` works because $2 \times 3 = 6$, but reshaping into `(2, 4)` would raise an error.

## Element-wise Arithmetic

Arithmetic between two arrays of the same shape operates element by element, with no loop needed:

```python
{% include python/numpy_elementwise/main.py %}
```
```text
{% include python/numpy_elementwise/screen_output.log %}
```

This is the main advantage NumPy has over a list comprehension for numeric work: `x ** 2` is both shorter and faster than `[xi ** 2 for xi in x]`.

## Broadcasting

Arithmetic between an array and a single number applies to every element, with no loop and no need to build a second array of the same shape:

```python
{% include python/numpy_broadcast/main.py %}
```
```text
{% include python/numpy_broadcast/screen_output.log %}
```

This is called *broadcasting*: NumPy treats the single number as if it were stretched to match the array's shape.
The same idea extends to arithmetic between arrays of compatible, but not identical, shapes, though the shapes used in this course are usually the same size already.

## Indexing, Slicing, and Boolean Masking

Basic indexing and slicing on a NumPy array work the same as on a list.
Boolean masking is new: comparing an array to a value produces an array of `True`/`False`, which can then be used to select only the matching elements.

```python
{% include python/numpy_masking/main.py %}
```
```text
{% include python/numpy_masking/screen_output.log %}
```

`h < 2000` produces a mask the same length as `h`, and `h[mask]` keeps only the elements where the mask is `True`.
Combining conditions on arrays uses `&` (and) and `|` (or), not Python's `and`/`or`, which don't work element-wise.

{% capture notice-text %}
## Example: Filtering Noisy Sensor Readings
### Question
{:.no_toc}
A gravimeter logs local gravity readings in m/s<sup>2</sup>, but a loose connection occasionally produces a garbage value far outside the physically reasonable range.
Given the readings below, keep only the values between 9.0 and 10.5 m/s<sup>2</sup>, then compute their average.

### Solution
{:.no_toc}
A boolean mask built from both bounds at once selects only the valid readings, which `np.mean` then averages.

```python
{% include python/numpy_example/main.py %}
```
```text
{% include python/numpy_example/screen_output.log %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Useful Reductions

A *reduction* collapses an array down to a single summary value.
NumPy provides several as both functions (`np.mean(v)`) and array methods (`v.mean()`):

```python
{% include python/numpy_reductions/main.py %}
```
```text
{% include python/numpy_reductions/screen_output.log %}
```

`np.argmax` (and `np.argmin`) return the *index* of the extreme value, not the value itself, which is useful for finding where something happened rather than just what the peak value was.

## Concatenating Arrays

`np.concatenate` joins a list of arrays end to end into a single array:

```python
{% include python/numpy_concat/main.py %}
```
```text
{% include python/numpy_concat/screen_output.log %}
```

This is useful for combining readings collected in separate batches, such as data logged before and after a pause, into one array for analysis.

## 2D Arrays and Matrix Operations

A NumPy array can have more than one dimension, which is how matrices are represented:

```python
{% include python/numpy_2d/main.py %}
```
```text
{% include python/numpy_2d/screen_output.log %}
```

`@` performs true matrix multiplication, while `*` still multiplies element by element, even for a 2D array.
Mixing these up is a common source of bugs.
`np.linalg` provides other linear algebra operations, including `det` for the determinant and `norm` for a vector's magnitude.

## Reading Questions

1. What does `[1, 2, 3] * 2` produce for a plain Python list, versus a NumPy array?
1. What is the difference between `np.zeros(5)` and `np.arange(5)`?
1. What does an array's `shape` describe?
1. What is a boolean mask, and how is it used to filter an array?
1. Why must `&` be used instead of `and` when combining two conditions on NumPy arrays?
1. What is the difference between `np.argmax(v)` and `np.max(v)`?
1. What is the difference between `M @ M` and `M * M` for a 2D array `M`?
1. What condition must a shape satisfy to be a valid `reshape` target for a given array?
1. What does broadcasting mean when adding a single number to a NumPy array?
1. What does `np.concatenate` do, and how is it different from adding two arrays together with `+`?
