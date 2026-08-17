---
title: Lists of Dictionaries
---

A single [dictionary]({{ site.baseurl }}{% link python/dictionaries.md %}) describes one thing, with a labeled value for each of its properties.
Engineering data usually comes as many such things: one row per flight, per test run, or per part.
Putting dictionaries in a [list]({{ site.baseurl }}{% link python/lists_tuples.md %}) gives you a table, where the list holds the rows and each dictionary's keys are the columns.

## Structure

Each element of the list is a dictionary with the same set of keys.
A row is reached by its position in the list, and a field within that row by its key:

```python
{% include python/dictlist_basics/main.py %}
```
```text
{% include python/dictlist_basics/screen_output.log %}
```

`flights[1]["altitude_km"]` reads as "row 1, column `altitude_km`."

## Iterating Over the Rows

A for loop over the list gives one dictionary per pass:

```python
{% include python/dictlist_iterate/main.py %}
```
```text
{% include python/dictlist_iterate/screen_output.log %}
```

Note the quotes inside the f-string: the outer string uses double quotes, so `flight['name']` uses single quotes to avoid ending the string early.

## Filtering Rows

A [list comprehension]({{ site.baseurl }}{% link python/list_comprehensions.md %}) with an `if` clause selects only the rows meeting a condition, producing a shorter list of the same kind:

```python
{% include python/dictlist_filter/main.py %}
```
```text
{% include python/dictlist_filter/screen_output.log %}
```

## Extracting a Single Field

A comprehension without a filter pulls one field out of every row, turning a column of the table into a plain list:

```python
{% include python/dictlist_column/main.py %}
```
```text
{% include python/dictlist_column/screen_output.log %}
```

This is often the step before handing the values to [NumPy]({{ site.baseurl }}{% link python/numpy.md %}) or [matplotlib]({{ site.baseurl }}{% link python/plotting.md %}), which work with plain sequences of numbers rather than dictionaries.

## Sorting by a Field

`sorted()` accepts a `key=` function that says which value to sort on, the same way it does for a plain dictionary:

```python
{% include python/dictlist_sort/main.py %}
```
```text
{% include python/dictlist_sort/screen_output.log %}
```

`lambda f: f["duration_min"]` receives one row and returns that row's duration, so the sort orders the rows by duration.
`reverse=True` sorts from largest to smallest.

## Summarizing the Rows

Built-in functions combine with a comprehension to total, average, or find an extreme across every row:

```python
{% include python/dictlist_aggregate/main.py %}
```
```text
{% include python/dictlist_aggregate/screen_output.log %}
```

`max(flights, key=...)` returns the whole row that has the largest value, rather than the value itself, which is what you want when you need to know *which* flight was highest.

## Building a List of Dictionaries from a File

The [File Input/Output]({{ site.baseurl }}{% link python/file_io.md %}) page introduced `csv.DictReader`, which produces exactly this structure from a CSV file.
Its values arrive as strings, so numeric fields need converting before they can be used in arithmetic:

```python
{% include python/dictlist_fromfile/main.py %}
```
```text
{% include python/dictlist_fromfile/screen_output.log %}
```

Without the `float()` conversions, `flights[0]["altitude_km"] + flights[1]["altitude_km"]` would join two strings end to end instead of adding two numbers.

{% capture notice-text %}
## Example: Mass by Subsystem
### Question
{:.no_toc}
Given a list of spacecraft parts, where each part records a name, a subsystem, and a mass, find the total mass belonging to each subsystem, then report the subsystems from heaviest to lightest.

### Solution
{:.no_toc}
A loop over the rows builds a dictionary keyed by subsystem, using the same `.get()` with a default pattern as counting, except adding the mass rather than 1.
Sorting the resulting dictionary's items by value orders the subsystems by total mass.

```python
{% include python/dictlist_example/main.py %}
```
```text
{% include python/dictlist_example/screen_output.log %}
```

Grouping a list of rows into a dictionary keyed by one of their fields is a common way to summarize tabular data.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. In a list of dictionaries, what does the list represent, and what does each dictionary represent?
1. How would you read the `mass` field of the third row of a list named `parts`?
1. Why does `flight['name']` use single quotes when written inside an f-string delimited by double quotes?
1. Write a list comprehension that keeps only the rows whose `duration_min` is greater than 60.
1. What does `max(flights, key=lambda f: f["altitude_km"])` return: a number, or a dictionary?
1. Why do numeric fields read by `csv.DictReader` need to be converted before they are used in arithmetic?
1. Describe how you would total a numeric field across every row in a list of dictionaries.
