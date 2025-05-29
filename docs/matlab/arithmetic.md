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
>> {% include matlab/arithmetic_add_altitude.m %}
{% include matlab/arithmetic_add_altitude.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

Subtraction is carried out with the `-` sign, in the same manner as addition.

{% capture notice-text %}
### Example: Red Hot Steel
#### Question
{:.no_toc}
A steel part is heated up and glowing cherry red, corresponding to a temperature of 1100 K.
Given that 0 degrees Celsius is 273.15 K, what is the part's temperature in Celsius?

#### Solution
{:.no_toc}

To find the temperature in degrees Celsius, we subtract 273.15 from 1100 K.
In MATLAB, this looks like:

```matlab
>> {% include matlab/arithmetic_sub_steel.m %}
{% include matlab/arithmetic_sub_steel.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Multiplication and Division

Multiplication is performed with the `*` sign,
while division is performed with the `/` sign.
The `x` key does not work for multiplication in MATLAB,
and there is no ÷ for division.
Lastly, the `%` symbol has special meaning in MATLAB and does not turn a number into a percent.

{% capture notice-text %}
### Example: Tangential Speed
#### Question
{:.no_toc}
The earth revolves around the sun at a rate of $7.173\times 10^-4$ rad/hr,
with an average radius of $92.96\times 10^6$ miles.
Use MATLAB to find the tangential speed of the earth, in units of mph, given the formula:

$$v = \omega r$$

#### Solution
{:.no_toc}

To find the tangential speed, we plug in values for the rotation rate, $\omega$, and the
radius, $r$.
In MATLAB, this looks like:

```matlab
>> {% include matlab/arithmetic_mult_earth.m %}
{% include matlab/arithmetic_mult_earth.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

{% capture notice-text %}
### Example: Mach Number
#### Question
{:.no_toc}

$$ M = \frac{v}{a} $$

The Mach number is the ratio of an object's speed to the local speed of sound.
When the Apollo capsule returned from the Moon, it was initially traveling 10,973 m/s
in air where the local speed of sound was 289 m/s.
Use MATLAB to calculate the Mach number of the capsule.

#### Solution
{:.no_toc}

To find the Mach number, we plug in values for the speed, $v$, and the
speed of sound, $a$.
In MATLAB, this looks like:

```matlab
>> {% include matlab/arithmetic_div_mach.m %}
{% include matlab/arithmetic_div_mach.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Exponentiation

Exponentiation raises one number to the power of another, and
is performed in MATLAB with the `^` sign.
The number to the left of the `^` is raised to the power of the number on the right.

{% capture notice-text %}
### Example: Volume of a Cube
#### Question
{:.no_toc}

A concrete cube compression test uses a standard cube with side lengths of 15 cm.
Use MATLAB to calculate the volume of the cube, in units of cubic centimeters.

#### Solution
{:.no_toc}

To find the volume, we raise the side length to the power 3.
In MATLAB, this looks like:

```matlab
>> {% include matlab/arithmetic_exp_cube.m %}
{% include matlab/arithmetic_exp_cube.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Order of Operations
MATLAB follows standard PEMDAS for order of operations.
Their [Order of Precedence](https://www.mathworks.com/help/matlab/matlab_prog/operator-precedence.html) goes into
full details including other operators not included in the PEMDAS mnemonic.

**P** Parentheses

**E** Exponentiation

**MD** Multiplication and Division

**AS** Addition and Subtraction

Since parentheses are at the top of the list, lower-precedence operations can be promoted using parentheses.
If an operation does not need to be promoted because the precedence is correct,
using parentheses is unnecessary.

{% capture notice-text %}
### Example: Asset Depreciation
#### Question
{:.no_toc}

You operate a factory containing $250M of equipment that depreciates in value at a rate of 10% per year.
Use MATLAB to calculate the value of that equipment after 5 years of operations, in millions of dollars.
The formula for the future value is:

$$ FV = PV (1-r)^n $$

#### Solution
{:.no_toc}

To find the future value of the equipment, we plug the givens into the above formula.
In MATLAB, this looks like:

```matlab
>> {% include matlab/arithmetic_pemdas_depr.m %}
{% include matlab/arithmetic_pemdas_depr.diary %}
```
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. Which symbol indicates multiplication in MATLAB?
2. How does MATLAB determine order of operations when evaluating expressions?
3. How would you convert 4 feet to meters in MATLAB?
4. How would you convert 80 degrees Fahrenheit to degrees Celsius?
5. What mistakes might occur if parentheses are not included in an arithmetic expression?
6. When are parentheses unnecessary in an arithmetic expression?
