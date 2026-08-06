---
title: Input & Data Types
---

This page covers how to read a value typed by the user, the basic categories of values Python works with, and how to convert between them.

## Keyboard Input
The built-in `input()` function pauses a script and waits for the user to type something and press Enter.
Whatever text they typed is returned as the value of the `input()` call.
An optional argument sets the prompt message shown before the user types:

```python
name = input("Enter your name: ")
print("Hello, " + name + "!")
```

```text
Enter your name: Kip
Hello, Kip!
```

**`input()` always returns text, even if the user types a number.**
Trying to do arithmetic directly on the result, such as `age = input("Enter your age: ")` followed by `age + 1`, raises an error - Python will not silently guess that you meant to treat `age` as a number.
This is a common first surprise, and the [Type Conversion](#type-conversion) section below explains how to handle it.

## Data Types
Every value in Python has a data type, which determines what operations make sense for it.
The `type()` function reports a value's type:

```python
{% include python/data_types_basic/main.py %}
```

```text
{% include python/data_types_basic/screen_output.log %}
```

The four types used above are the most common ones you'll encounter early on:

| Type    | Description                          | Example         |
|---------|---------------------------------------|-----------------|
| `int`   | Whole number, positive or negative    | `21`            |
| `float` | Decimal (floating point) number       | `9.807`         |
| `str`   | Text, enclosed in quotes              | `"Voyager"`     |
| `bool`  | `True` or `False`                     | `False`         |

Unlike C++, you never write these type names when creating a variable - Python infers the type from the value itself, as covered on the [Variables & Output]({{ site.baseurl }}{% link python/variables.md %}) page.

## Lists and Tuples

Two more common types hold more than one value at a time: lists and tuples.
Both are ordered sequences of values, indexed the same way as a string, but they differ in whether that sequence can change after it's created.
This section covers just the basics. See [Lists & Tuples]({{ site.baseurl }}{% link python/lists_tuples.md %}) for indexing, slicing, and the full set of list operations.

A list is created with square brackets and can be changed after creation. Values can be added, removed, or reassigned:

```python
{% include python/list_basics/main.py %}
```
```text
{% include python/list_basics/screen_output.log %}
```

A tuple is created with parentheses and, unlike a list, cannot be changed once created.
Tuples are often used for a fixed group of related values, such as a coordinate pair:

```python
{% include python/tuple_basics/main.py %}
```
```text
{% include python/tuple_basics/screen_output.log %}
```

Writing `lat, lon = coordinates` is called *tuple unpacking*. It assigns each value in the tuple to its own variable in a single line.

## Type Conversion
Because `input()` always returns a `str`, you often need to explicitly convert it to a number before using it in a calculation.
Python provides a built-in function for each type that attempts to convert its argument:

| Function  | Converts to |
|-----------|-------------|
| `int(x)`  | Integer     |
| `float(x)`| Floating point number |
| `str(x)`  | Text        |

```python
{% include python/type_conversion/main.py %}
```

```text
{% include python/type_conversion/screen_output.log %}
```

If the text cannot be interpreted as a number - for example, `int("abc")` - Python raises an error rather than guessing.
Always convert user input to the type you actually need before doing arithmetic with it.

{% capture notice-text %}
### Example: Fuel Mass Conversion
#### Question
{:.no_toc}
Prompt the user to enter a fuel mass in pounds, then print the equivalent mass in kilograms (1 lb = 0.4536 kg), rounded to 1 decimal place.

#### Solution
{:.no_toc}

```python
fuel_lb_text = input("Enter fuel mass in lb: ")
fuel_lb = float(fuel_lb_text)
fuel_kg = fuel_lb * 0.4536

print(f"{fuel_kg:.1f} kg")
```

```text
Enter fuel mass in lb: 500
226.8 kg
```

The value returned by `input()` is converted to a `float` before it is used in the multiplication.
If the `float(...)` conversion were left out, `fuel_lb * 0.4536` would raise an error, since you cannot multiply text by a number.

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. What data type does `input()` always return, regardless of what the user types?
1. What would go wrong if you tried to run `input("Enter your age: ") + 1` directly?
1. Which function converts a `str` to a `float`?
1. What happens if you call `int()` on text that isn't a valid whole number, like `int("hello")`?
1. What is the data type of the value `False`?
1. Write a line of code that reads a user's height (in text) and converts it to a `float` named `height_m`.
1. What is the main difference between a list and a tuple?
1. What does tuple unpacking mean?

## Practice Problem: Altitude Unit Conversion

### Your Task

Write a script named **`altitude_conversion.py`** that:

1. Prompts the user with `input()` for an altitude in meters, and converts the result to a `float` named `altitude_m`
2. Computes `altitude_ft`, the equivalent altitude in feet (1 m = 3.281 ft)
3. Prints the result with an f-string, rounded to 1 decimal place

Your variable name for the converted value must match exactly (`altitude_ft`) so that the checker below can find it.

### Checking Your Work

Download [check_altitude_conversion.py]({{ site.baseurl }}/assets/practice/python/check_altitude_conversion.py) and save it in the *same folder* as your `altitude_conversion.py` script.
Open a terminal in that folder and run:

```text
python check_altitude_conversion.py
```

The checker supplies its own test value for the `input()` prompt, so it won't wait for you to type anything - it just runs your script and reports whether `altitude_ft` is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
