---
title: Class Variables, Methods & Objects
---

The [Classes & Objects]({{ site.baseurl }}{% link python/classes.md %}) page covered defining a class, storing data on each object, and writing methods that use it.
This page covers data shared across every object of a class, methods that control how objects print and compare, classes that hold collections of other objects, and building one class on top of another.

## Class Variables

An attribute assigned through `self` belongs to one object.
A variable assigned directly inside the class body instead belongs to the class, and every object shares the same single copy:

```python
{% include python/class_variables/main.py %}
```
```text
{% include python/class_variables/screen_output.log %}
```

`part_count` is a *class variable*, so incrementing it in `__init__` counts every part ever created, no matter which object triggered it.
`name` and `mass` are *instance variables*, so each object keeps its own.

A class variable is read as `SpacecraftPart.part_count` from the class itself, or `p1.part_count` through any instance.
Write to it through the class name, as done above, since assigning `self.part_count = ...` would create a new instance variable that shadows the shared one rather than updating it.
{: .notice--warning}

## Private Attributes by Convention

Prefixing an attribute name with two underscores marks it as internal to the class:

```python
{% include python/class_private/main.py %}
```
```text
{% include python/class_private/screen_output.log %}
```

Python does not truly enforce privacy the way some languages do. The double underscore triggers *name mangling*, which makes the attribute awkward to reach from outside rather than impossible.
The point is to route changes through methods like `set_mass`, which can reject values that don't make sense, instead of letting any code assign whatever it wants directly.

## Controlling How an Object Prints

Printing an object with no instructions gives its type and memory address, which says nothing useful about its contents.
Defining a `__repr__` method replaces that with whatever text you choose:

```python
{% include python/class_repr/main.py %}
```
```text
{% include python/class_repr/screen_output.log %}
```

`__repr__` is used by `print()` and also whenever the object appears inside a list or dictionary, which is what makes a list of objects readable.
The `!r` inside the f-string formats the value the way Python would display it, which is why the name comes out with quotes around it.

Methods with two leading and trailing underscores, like `__init__` and `__repr__`, are called *special methods*.
Python calls them for you in response to specific syntax, rather than you calling them by name.

## Comparing Objects

By default, two separate objects are considered unequal even when they hold identical data, and Python has no way to sort them at all.
Defining `__eq__` and `__lt__` supplies those rules:

```python
{% include python/class_compare/main.py %}
```
```text
{% include python/class_compare/screen_output.log %}
```

`__eq__` defines what `==` means for the class, and `__lt__` defines what `<` means.
Once `__lt__` exists, `sorted()` can order a list of these objects without any extra arguments, since sorting is built on repeated less-than comparisons.

## Objects That Hold Other Objects

An attribute can hold anything, including a list of other objects, which is how a larger assembly is represented:

```python
{% include python/class_collection/main.py %}
```
```text
{% include python/class_collection/screen_output.log %}
```

`self.parts = []` inside `__init__` gives each `Spacecraft` its own empty list, so parts added to one vehicle never appear in another.
`total_mass` and `heaviest_part` then work across everything the vehicle currently holds, whatever that happens to be.

{% capture notice-text %}
## Example: Spacecraft Mass Budget
### Question
{:.no_toc}
A spacecraft is assembled from parts, each belonging to a subsystem.
Write classes that track the parts making up a vehicle and can report the total mass, the mass belonging to each subsystem, and the parts ordered from heaviest to lightest.

### Solution
{:.no_toc}
`Part` defines `__repr__` so a list of parts prints readably, and `__lt__` so parts can be sorted by mass directly.
`Spacecraft` holds the parts and provides the three summaries, reusing the grouping pattern from the [Lists of Dictionaries]({{ site.baseurl }}{% link python/dict_lists.md %}) page.

```python
{% include python/class_methods_example/main.py %}
```
```text
{% include python/class_methods_example/screen_output.log %}
```

Because `Part` defines `__lt__`, `parts_heaviest_first` just calls `sorted(self.parts, reverse=True)` without repeating what "heavier" means.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Inheritance

A class can be built on top of another, taking everything the original defines and then adding to or changing it:

```python
{% include python/class_inheritance/main.py %}
```
```text
{% include python/class_inheritance/screen_output.log %}
```

`Engine(Part)` means `Engine` inherits from `Part`, so it starts with `Part`'s attributes and methods.
`super().__init__(name, mass)` runs the parent's setup before `Engine` adds its own `thrust` attribute, which avoids repeating the lines that were already written once.
Defining `describe` again in `Engine` *overrides* the inherited version, so each class prints in the way that suits it.

`isinstance(engine, Part)` is `True` because an `Engine` is a kind of `Part`.
That relationship is the test for whether inheritance is the right tool: use it when the new class genuinely is a more specific version of the original, not merely when it would be convenient to reuse a few methods.

## Reading Questions

1. What is the difference between a class variable and an instance variable?
1. Why should a class variable be updated through the class name rather than through `self`?
1. What does a leading double underscore on an attribute name signal, and does Python enforce it?
1. What does `__repr__` control, and where is it used besides a direct `print()` call?
1. What do `__eq__` and `__lt__` define for a class?
1. Once a class defines `__lt__`, what else becomes possible without writing any extra code?
1. Why is `self.parts = []` written inside `__init__` rather than in the class body?
1. What does `super().__init__(...)` do in a child class?
1. What question should you ask to decide whether inheritance is the right tool?
