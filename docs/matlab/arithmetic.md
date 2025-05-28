---
title: Arithmetic in MATLAB
---

Arithmetic operations are the foundation of mathematics. They include:

* Addition
* Subtraction
* Multiplication
* Division
* Exponentiation

When a mathematical expression contains more than one arithmetic operation,
the order of operations is used to determine which are performed first.
This page reviews both the arithmetic operations and the order in which they are performed.

## Addition and Subtraction

The two most fundamental arithmetic operations are addition and subtraction.
To add two numbers in MATLAB, put the `+` sign between them.
Space between the numbers and the `+` sign is optional; add as much or as little as you need for visual clarity.

{% capture notice-text %}
### Example: Altitude Above Sea Level
#### Question
{:.no_toc}
A plane is flying 7,500 ft above Deep Creek Lake, where the terrain is elevated 2,461 ft above sea level.
Using MATLAB, what is the plane's altitude above sea level?


#### Solution
{:.no_toc}

To find the altitude above sea level, we add the height from sea level to Deep Creek Lake to the height
from the lake to the plane.
In MATLAB, this looks like:

```matlab
{% include {{ matlab/arithmetic_add_altitude.m }}.m %}
{% include {{ matlab/arithmetic_add_altitude.m.diary }}.m %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Multiplication and Division

## Exponentiation

## Order of Operations

PEMDAS