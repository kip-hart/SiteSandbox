---
title: Classes & Objects
---

A [dictionary]({{ site.baseurl }}{% link python/dictionaries.md %}) groups related data together under one variable, with values you access by name.
A **class** takes that same idea a step further: it groups data together *and* bundles in the functions that operate on that data, so both travel together as a single unit.

The Python documentation has a guide on [Classes](https://docs.python.org/3/tutorial/classes.html).

## Defining a Class

A class is defined with the `class` keyword, and by convention its name is written in `CapWords` rather than the `snake_case` used for variables and functions.

```python
{% include python/class_basics/main.py %}
```
```text
{% include python/class_basics/screen_output.log %}
```

The `__init__` method runs automatically whenever a new object is created, and its job is to set up that object's starting data.
Creating an object, called *instantiating* the class, looks like calling the class by name: `SpacecraftPart("proptank", 1200.0)`.

The first parameter of every method, named `self` by convention, is the object the method was called on.
Assigning to `self.name` stores a value on that particular object, and reading `tank.name` later reads it back.
You never pass `self` in yourself. Python supplies it automatically from whatever object is to the left of the dot.

Variables stored on an object this way are called *attributes*, and functions defined inside a class are called *methods*.

## Methods

A method is written like a normal function, indented inside the class, with `self` as its first parameter.
Through `self`, a method can read whatever data the object is carrying:

```python
{% include python/class_methods_demo/main.py %}
```
```text
{% include python/class_methods_demo/screen_output.log %}
```

`tank.describe()` and `tank.weight_on_earth()` both operate on `tank` without being told which part to use, because `self` already refers to it.
This is the difference between a class and a plain dictionary: the mass and the code that uses the mass live in the same place.

## Methods That Modify the Object

A method can also change the object's data by assigning to an attribute through `self`:

```python
{% include python/class_modify_state/main.py %}
```
```text
{% include python/class_modify_state/screen_output.log %}
```

Because `burn_fuel` is the only intended way to reduce the mass, it can also enforce a rule about what changes are valid.
Here it rejects a burn larger than the part's own mass and leaves the object unchanged, which is harder to guarantee when the data sits loose in a dictionary that any code can write to.

## Each Object Holds Its Own Data

Every object created from a class gets its own independent copy of the attributes assigned in `__init__`:

```python
{% include python/class_independent/main.py %}
```
```text
{% include python/class_independent/screen_output.log %}
```

`tank1` and `tank2` were created from the same class and share the same methods, but changing one has no effect on the other.

{% capture notice-text %}
## Example: Rocket Thrust-to-Weight
### Question
{:.no_toc}
A rocket lifts off only if its thrust exceeds its weight, which is measured by the thrust-to-weight ratio:

$$ TWR = \frac{T}{m g} $$

Write a `Rocket` class that stores a name, thrust, and mass, and can report its thrust-to-weight ratio and whether it lifts off.
Use it to compare a heavy lift vehicle (7,600,000 N thrust, 550,000 kg) against an underpowered test article (40,000 N thrust, 9,000 kg).

### Solution
{:.no_toc}
The class stores the three values in `__init__`, and each method computes what it needs from `self`.
`report` calls `thrust_to_weight` and `can_lift_off` on the same object, so the calculation is written once and reused.

```python
{% include python/class_example/main.py %}
```
```text
{% include python/class_example/screen_output.log %}
```

Adding another vehicle takes one more line, and the logic for evaluating it is already written.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## When to Use a Class

A class is worth defining when data and behavior belong together, and especially when you have many things of the same kind.
For a single group of labeled values that no code needs to act on, a dictionary is simpler and perfectly appropriate.
Once you find yourself writing functions that all take the same dictionary as their first argument, that's a sign the data and those functions want to be a class.

## Reading Questions

1. What does a class provide that a dictionary does not?
1. When does the `__init__` method run?
1. What does `self` refer to inside a method, and who supplies its value?
1. What is the difference between an attribute and a method?
1. If two objects are created from the same class, does changing an attribute on one affect the other?
1. What naming convention does Python use for class names, and how does it differ from the convention for variables?
1. Describe a situation where a dictionary would be a better choice than a class.
