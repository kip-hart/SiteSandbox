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
