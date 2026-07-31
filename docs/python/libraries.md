---
title: Using Libraries
---

A library (also called a module or package) is a collection of pre-written code that you can use in your own scripts.
Python comes with a large **standard library** of built-in modules covering common tasks, and you can install many more third-party libraries - later pages in this course use two popular ones, numpy and matplotlib.

## Importing a Library
To use a library, first import it with the `import` statement.
Everything the library provides is then accessed with `library_name.thing_name`:

```python
{% include python/library_math_basic/main.py %}
```

```text
{% include python/library_math_basic/screen_output.log %}
```

The `math` module is part of the standard library, so it's always available - there's nothing to install.
It provides constants like `math.pi` and functions like `math.sqrt()` that aren't built directly into the language.

## Selective Imports
If you only need a few specific names from a library, you can import them directly with `from ... import ...`.
This lets you drop the `library_name.` prefix:

```python
{% include python/library_from_import/main.py %}
```

```text
{% include python/library_from_import/screen_output.log %}
```

This form is convenient for a couple of frequently used names, but importing an entire library with `import library_name` (as in the first example) is usually clearer in longer scripts, since `math.sqrt(x)` makes it obvious where `sqrt` came from, while a bare `sqrt(x)` does not.

## Import Aliases
Libraries with long names are often imported under a shorter alias using `import library_name as alias`.
This is especially common for the numpy and matplotlib libraries used later in this course:

```python
import numpy as np
import matplotlib.pyplot as plt
```

These aliases (`np` and `plt`) are just convention - the library still works the same either way - but nearly all Python code you'll encounter uses them, so it's worth adopting the same convention early.
See [NumPy Arrays]({{ site.baseurl }}{% link python/numpy.md %}) and [Plotting with Matplotlib]({{ site.baseurl }}{% link python/plotting.md %}) for more.

## Installing Third-Party Libraries
Standard library modules like `math` ship with Python and never need to be installed.
Third-party libraries, like numpy and matplotlib, do not - they must be installed once per computer using `pip`, Python's package installer, from a terminal:

```text
pip install numpy matplotlib
```

If a library isn't installed and you try to `import` it, Python raises a `ModuleNotFoundError`.
If you see that error, double check the spelling of the library name, then make sure it has been installed with `pip` for the same Python interpreter VS Code is using (see [Selecting a Python Interpreter in VS Code]({{ site.baseurl }}{% link python/getting_started.md %}#selecting-a-python-interpreter-in-vs-code)).

## Reading Questions

1. What is the difference between the standard library and a third-party library?
1. What command would you use to import the `math` module?
1. After running `import math`, how would you access the value of $\pi$?
1. What is the difference between `import math` and `from math import sqrt`?
1. What do `np` and `plt` refer to, by convention?
1. What error does Python raise if you try to import a library that isn't installed?
1. How do you install a third-party library like numpy?

## Practice Problem: Descent Angle

### Your Task

Write a script named **`descent_angle.py`** that starts from the given values:

```python
horizontal_distance_m = 8000
altitude_loss_m = 500
```

Import the `math` module, then compute `descent_angle_deg`, the descent angle in degrees, using `math.atan` and `math.degrees`.
Print the result with an f-string, rounded to 2 decimal places.

Your variable name for the answer must match exactly (`descent_angle_deg`) so that the checker below can find it.

### Checking Your Work

Download [check_descent_angle.py]({{ site.baseurl }}/assets/practice/python/check_descent_angle.py) and save it in the *same folder* as your `descent_angle.py` script.
Open a terminal in that folder and run:

```text
python check_descent_angle.py
```

The checker runs your script and reports whether `descent_angle_deg` is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
