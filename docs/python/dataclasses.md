---
title: Type Hints & Dataclasses
---

This page covers two features that make code easier to read and harder to get wrong: *type hints*, which record what kind of value a variable or parameter is meant to hold, and *dataclasses*, which remove most of the repetitive code involved in writing a class that mainly stores data.

The Python documentation has guides on [Type Hints](https://docs.python.org/3/library/typing.html) and [Dataclasses](https://docs.python.org/3/library/dataclasses.html).

## Type Hints on Functions

A hint is written after a parameter name with a colon, and after the parameter list with an arrow for the return value:

```python
{% include python/hints_functions/main.py %}
```
```text
{% include python/hints_functions/screen_output.log %}
```

`exhaust_velocity: float` says the parameter is meant to be a float, and `-> float` says the function returns one.
The function behaves exactly as it would without the hints.

## Hints Are Not Enforced

Python does not check hints while the program runs.
Passing the wrong type is allowed, and the program only fails if and when the value is actually used in a way it doesn't support:

```python
{% include python/hints_not_enforced/main.py %}
```
```text
{% include python/hints_not_enforced/screen_output.log %}
```

The call ran, and the error came from `math.log` receiving a string, not from the hint being violated.
Hints are documentation for you, your teammates, and tools like editors and linters, rather than a runtime guarantee.
{: .notice--warning}

## Hints on Variables and Collections

Variables can be annotated the same way, and collection types can say what they contain:

```python
{% include python/hints_collections/main.py %}
```
```text
{% include python/hints_collections/screen_output.log %}
```

`list[float]` is a list of floats, `dict[str, float]` is a dictionary with string keys and float values, and `tuple[float, float]` is a tuple of exactly two floats.

## Values That Might Be Missing

A vertical bar between two types means "either one."
This is how a function says it returns a value *or* nothing, which is common for a lookup that might not find anything:

```python
{% include python/hints_optional/main.py %}
```
```text
{% include python/hints_optional/screen_output.log %}
```

`float | None` tells a reader to expect `None` sometimes and to check for it before doing arithmetic on the result.
This pattern is also written `Optional[float]`, using `from typing import Optional`, which you will see in older code.

## The Problem Dataclasses Solve

Writing a class whose job is mostly to hold a few values takes a lot of repetitive code, with each field name spelled out several times:

```python
{% include python/dataclass_boilerplate/main.py %}
```
```text
{% include python/dataclass_boilerplate/screen_output.log %}
```

Every field appears in the parameter list, in an assignment, in `__repr__`, and in `__eq__`.
Adding one more field means editing four places, and forgetting one produces a subtle bug.

## Dataclasses

Putting `@dataclass` above a class definition tells Python to generate `__init__`, `__repr__`, and `__eq__` from the fields you list:

```python
{% include python/dataclass_basic/main.py %}
```
```text
{% include python/dataclass_basic/screen_output.log %}
```

Each field is declared once, as a name with a type hint, and the three methods follow from that.
This is one place the hints are doing real work: `@dataclass` reads them to decide which class-body assignments are fields.

`@dataclass` is a *decorator*, a piece of syntax that modifies the thing defined below it.
{: .notice}

## Default Values

A field can be given a default, which makes it optional when creating an object:

```python
{% include python/dataclass_defaults/main.py %}
```
```text
{% include python/dataclass_defaults/screen_output.log %}
```

Fields with defaults must come after fields without them, for the same reason default parameters come last in a normal [function]({{ site.baseurl }}{% link python/user_functions.md %}).

## Mutable Defaults

A list or dictionary default needs `field(default_factory=...)` rather than a plain `= []`:

```python
{% include python/dataclass_factory/main.py %}
```
```text
{% include python/dataclass_factory/screen_output.log %}
```

`default_factory=list` calls `list` once per object, so each one gets its own empty list.

Writing `parts: list[str] = []` instead would give every object made from the class one shared list, so appending to one vehicle's parts would silently change all of them.
Dataclasses refuse to be defined that way, raising `ValueError: mutable default ... is not allowed: use default_factory`.
A plain class or a default function argument has the same hazard without the warning, so the rule is worth remembering beyond dataclasses.
{: .notice--warning}

## Adding Methods

A dataclass is still a normal class, so methods work exactly as they do on any other:

```python
{% include python/dataclass_methods/main.py %}
```
```text
{% include python/dataclass_methods/screen_output.log %}
```

The generated `__repr__` also descends into the parts, so printing the spacecraft shows everything it contains.

## Validating Fields

`__post_init__` runs automatically right after the generated `__init__`, which makes it the place to check that the values given make sense:

```python
{% include python/dataclass_postinit/main.py %}
```
```text
{% include python/dataclass_postinit/screen_output.log %}
```

Raising an error here stops an invalid object from ever existing, rather than letting a bad value travel through the rest of the program before causing trouble somewhere else.

## Ordering and Immutability

`@dataclass` takes arguments that change what it generates.
`order=True` adds the comparison methods, so objects can be sorted, and `frozen=True` blocks changes after creation:

```python
{% include python/dataclass_options/main.py %}
```
```text
{% include python/dataclass_options/screen_output.log %}
```

With `order=True`, objects compare using their fields in the order declared, so `Reading` sorts by altitude first.
With `frozen=True`, assigning to a field raises a `FrozenInstanceError`, which suits values that should never change once set.

{% capture notice-text %}
## Example: Telemetry Readings
### Question
{:.no_toc}
A vehicle reports telemetry readings, each with a timestamp, an altitude, and a status that defaults to `"nominal"`.
An altitude below zero is invalid and should be rejected outright.
Build a list of readings, report the ones that aren't nominal, and compute the mean altitude.

### Solution
{:.no_toc}
`@dataclass` supplies the constructor and the printing, `__post_init__` enforces the altitude rule, and a regular method answers whether a reading is nominal.

```python
{% include python/dataclass_example/main.py %}
```
```text
{% include python/dataclass_example/screen_output.log %}
```

Filtering and averaging use the same comprehension patterns as a [list of dictionaries]({{ site.baseurl }}{% link python/dict_lists.md %}), with `r.altitude` in place of `r["altitude"]`.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Dataclasses vs. Dictionaries

Both hold a group of labeled values, and either can be the right choice:

* A **dictionary** suits data whose keys aren't known in advance, such as rows read from a file whose columns vary.
* A **dataclass** suits data with a fixed, known set of fields, and gives you editor autocompletion and typo protection in return.

The typo case is the clearest difference.
Writing `part.subsytsem` is flagged by your editor before you run anything, while `part["subsytsem"]` looks fine until it raises a `KeyError` at runtime.

## Reading Questions

1. What does the hint in `def f(x: float) -> float:` say about `x` and about the return value?
1. Does Python stop a program from passing a string to a parameter hinted as `float`? What actually happens?
1. What does the hint `dict[str, float]` describe?
1. What does `float | None` say about a function's return value, and what should the caller do about it?
1. Which three methods does `@dataclass` generate for you?
1. Why must a list field use `field(default_factory=list)` instead of `= []`?
1. When does `__post_init__` run, and what is it typically used for?
1. What do the `order=True` and `frozen=True` arguments to `@dataclass` do?
1. Give one situation where a dictionary is a better choice than a dataclass, and one where the reverse is true.
