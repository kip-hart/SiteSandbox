---
title: For Loops
---

In Python we often need to repeat the same calculation multiple times.
A few variable values may change, but the same general flow of computing is performed each time.
Rather than copying the code multiple times in a script, we can use a *for loop* to contain the code that is repeated.

The Python documentation has a guide on [for Statements](https://docs.python.org/3/tutorial/controlflow.html#for-statements).

## Syntax

For loops are created in Python using this syntax:

```python
for <iterator> in <sequence>:
    code to execute multiple times ...
```

After the `for` keyword is the name of a variable that changes value on each pass of the loop.
It is assigned to each value in the sequence on the right side of `in`, one at a time, in order.
As with `if` statements, the code inside a for loop is marked by indentation rather than an `end` keyword, and the colon `:` at the end of the `for` line is required.
For example, this for loop prints the powers of two up to 1024:

```python
{% include python/for_loop_powers/main.py %}
```
```text
{% include python/for_loop_powers/screen_output.log %}
```

`range(11)` produces the sequence of whole numbers from 0 up to (but not including) 11, so the loop above runs with `p` equal to each value from 0 through 10.

## Looping Over a List

One of the most common uses of for loops in Python is to perform a series of calculations for each element in a list.
Unlike MATLAB, plain Python does not have built-in vectorized math, so looping over a list is the normal way to process it - not something to avoid.
(Once you've learned about NumPy arrays, later in the course, some of these calculations can be vectorized similarly to MATLAB. See [NumPy Arrays]({{ site.baseurl }}{% link python/numpy.md %}).)

```python
{% include python/for_loop_sqrt/main.py %}
```
```text
{% include python/for_loop_sqrt/screen_output.log %}
```

Here, `value` takes on each number in `measurements` in turn, and `math.sqrt(value)` is computed and printed on every pass.
Lists are covered in more detail on the [Lists & Tuples]({{ site.baseurl }}{% link python/lists_tuples.md %}) page; for now, a list is just a sequence of values written between square brackets and separated by commas.

{% capture notice-text %}
### Example: Rocket Engine with Inexact Performance
#### Question
{:.no_toc}
Often in the design phase of engineering, the exact values we need for an analysis are not immediately available.
My work depends on another person's results, their work depends on a third person's results, and that third person's work depends on my results.
To break the cycle, we need to be able to handle estimated ranges for values rather than the exact value.

Consider, for example, the design of an interplanetary rocket that will send a satellite from Earth to Mars.
We need to determine the fraction of the rocket's mass that will be fuel for the burn - its propellant mass fraction $\zeta$ - using the rocket equation:

$$ \Delta v = I_{sp} g_0 \log\left(\frac{m_0}{m_f}\right) $$

The propellant mass fraction is defined as $\zeta = 1 - m_f/m_0$.
We are given that the $\Delta v$ for the burn is 12 km/s and Earth's surface gravity is $g_0$=9.81 m/s<sup>2</sup>.
The specific impulse, $I_{sp}$, is somewhere between 380 and 450 s.
The design of the rocket is not mature enough for a precise value of $I_{sp}$, but we still need to produce values.
Determine the minimum and maximum propellant mass fraction for the rocket.

#### Solution
{:.no_toc}
To solve this problem, we isolate the mass fraction term in the rocket equation then calculate the propellant mass fraction.
We do this for the lower and upper bounds on the specific impulse, keeping a running minimum and maximum as the loop goes.
Rearranging the rocket equation:

$$ \frac{m_0}{m_f} = e^\frac{\Delta v}{I_{sp} g_0} $$

We then plug that fraction into the propellant mass fraction formula, and repeat the process for the lower and upper bounds on specific impulse.

```python
{% include python/for_loop_rocket/main.py %}
```
```text
{% include python/for_loop_rocket/screen_output.log %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Nested For Loops

A *nested* for loop is when a for loop is contained within another for loop.
This structure is useful when iterating over multiple dimensions of data, or performing operations with multiple levels of repetition.
For example, you could use a for loop to propagate the trajectory of an airplane, then nest that within another for loop where you vary the wind speed, the number of passengers, the air temperature, etc.

Python can nest for loops to any depth, however the compute time will grow rapidly as more loops are added.
In the example above, if I have 1,000 timesteps and 30 wind speeds, then Python will perform the inner loop calculations 30,000 times.
If there are 15 different cases of passenger count, I could loop over that as well, which would bring the number of inner loop calculations to 450,000.
This increase in the number of calculations is the *curse of dimensionality* and drives the need to make calculations as fast as possible.
Each nested for loop needs its own consistent indentation, one level deeper than the loop it's nested inside.

## Reading Questions

1. How does Python determine how many times to execute the code in a for loop?
1. What are the components of the syntax of a for loop?
1. What values does `range(5)` produce, and how many times would a for loop over it execute?
1. How does Python know where the body of a for loop ends, since it doesn't use an `end` keyword?
1. Can a for loop be executed within another for loop?
