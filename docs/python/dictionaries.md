---
title: Dictionaries
---

A [list]({{ site.baseurl }}{% link python/lists_tuples.md %}) stores values in order, and you reach each one by its numeric position.
A dictionary instead stores *key-value pairs*, and you reach each value by its key.
That makes a dictionary the right choice whenever the data is naturally labeled, such as a part's name, subsystem, and mass, rather than numbered.

The Python documentation has a guide on [Dictionaries](https://docs.python.org/3/tutorial/datastructures.html#dictionaries).

## Creating a Dictionary

A dictionary is written with curly braces, with each key separated from its value by a colon:

```python
{% include python/dict_basics/main.py %}
```
```text
{% include python/dict_basics/screen_output.log %}
```

Keys are usually strings, though any immutable value can be used.
`len()` reports the number of key-value pairs.

## Accessing Values

A value is looked up by writing its key in square brackets, the same syntax a list uses for an index:

```python
{% include python/dict_access/main.py %}
```
```text
{% include python/dict_access/screen_output.log %}
```

Looking up a key that doesn't exist with `part["cost"]` raises a `KeyError`.
The `in` operator checks whether a key is present, and `.get()` looks up a key without raising an error, returning `None` (or a default value you supply) when the key is missing.

Note that a dictionary is not indexed by position, so `part[0]` raises a `KeyError` rather than returning the first pair.
{: .notice--warning}

## Adding, Updating, and Removing Entries

Assigning to a key either updates it, if it already exists, or adds it if it doesn't:

```python
{% include python/dict_modify/main.py %}
```
```text
{% include python/dict_modify/screen_output.log %}
```

`del` removes a key outright, while `.pop()` removes the key and returns its value.

## Iterating Over a Dictionary

Looping over a dictionary directly gives its keys.
`.values()` gives the values, and `.items()` gives both at once as a pair:

```python
{% include python/dict_iterate/main.py %}
```
```text
{% include python/dict_iterate/screen_output.log %}
```

`for key, value in part.items()` unpacks each pair into two loop variables, which is usually what you want when you need both the label and the number.

## Dictionary Comprehensions

A dictionary comprehension works like a [list comprehension]({{ site.baseurl }}{% link python/list_comprehensions.md %}), except it produces `key: value` pairs:

```python
{% include python/dict_comprehension/main.py %}
```
```text
{% include python/dict_comprehension/screen_output.log %}
```

The pattern is `{key_expression: value_expression for item in iterable}`, and an `if` clause filters items the same way it does in a list comprehension.

{% capture notice-text %}
## Example: Aircraft Mass Breakdown
### Question
{:.no_toc}
An aircraft's takeoff mass is made up of the empty aircraft, fuel, passengers, and cargo.
Given each component's mass, compute the total takeoff mass, what fraction of the total each component represents, and which component is heaviest.

### Solution
{:.no_toc}
`sum` over `.values()` totals the masses, a dictionary comprehension converts each mass to a fraction, and `max` with `key=` finds the heaviest component by its value rather than its name.

```python
{% include python/dict_example/main.py %}
```
```text
{% include python/dict_example/screen_output.log %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## A Dictionary as a Lookup Table

Because a dictionary maps one value to another, it works well as a lookup table, replacing a long chain of `if`-`elif` comparisons:

```python
{% include python/dict_lookup/main.py %}
```
```text
{% include python/dict_lookup/screen_output.log %}
```

`.get()` with a default handles the case where the category isn't in the table, which is the equivalent of the final `else` in an `if`-`elif` chain.

## Counting with a Dictionary

Counting how many times each value appears is a common use of `.get()` with a default of zero:

```python
{% include python/dict_counting/main.py %}
```
```text
{% include python/dict_counting/screen_output.log %}
```

On the first pass for a given status, `counts.get(r, 0)` returns `0` because the key isn't there yet, so the count starts at 1.
On later passes it returns the running count, which then increases by one.

## Sorting a Dictionary

`sorted()` on a dictionary sorts its keys.
To sort by value instead, sort `.items()` and tell `sorted` which part of each pair to use:

```python
{% include python/dict_sorting/main.py %}
```
```text
{% include python/dict_sorting/screen_output.log %}
```

The `key=` argument takes a function that receives one item and returns the value to sort on.
Here `lambda pair: pair[1]` is a small unnamed function that returns the second element of each `(key, value)` pair, so the sort uses the counts rather than the status names.

## Reading Questions

1. What is the main difference between how you access a value in a list and in a dictionary?
1. What happens if you look up a key that doesn't exist with square brackets? How does `.get()` behave differently?
1. How do you check whether a key exists in a dictionary?
1. What is the difference between `del part["mass"]` and `part.pop("mass")`?
1. What does `.items()` produce when used in a for loop?
1. Write a dictionary comprehension that maps each number from 1 to 5 to its cube.
1. Why might you use a dictionary instead of a long `if`-`elif` chain?
1. How would you sort a dictionary by its values rather than its keys?
