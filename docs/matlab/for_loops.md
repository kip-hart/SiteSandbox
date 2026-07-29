---
title: For Loops
---

In MATLAB we often need to repeat the same calculation multiple times.
A few variable values may change, but the same general flow of computing is performed each time.
Rather than copying the code multiple times in a script, we can use a *for loop* to contain the code that is repeated.

The MATLAB Help Center has documentation on
[for](https://www.mathworks.com/help/matlab/ref/for.html).

## Syntax

For loops are created in MATLAB using this syntax:

```matlab
for <iterator> = <array>
    code to execute multiple times ...
end
```

After the `for` keyword is the name of a variable that changes value on each pass of the loop.
It is assigned to each value in the array on the right side of the assignment operator, `=`.
The code inside the for loop is typically indented to visually indicate that it is contained in that loop.
To end the loop, use the `end` keyword.
For example, this for loop prints the powers of two up to 10:

```matlab
{% include matlab/for_loop_powers.m %}
```

```matlab
{% include matlab/for_loop_powers.diary %}
```

## Looping Over an Array

One of the most common uses of for loops in MATLAB is to perform a series of calculations *for* each element in an array.
This should only be considered as an option if the calculation does not support vectorized inputs.
For example, the following two calculations produce the same result, but the first is vectorized while the second uses a for loop.

```matlab
{% include matlab/for_loop_sqrt.m %}
```

```matlab
{% include matlab/for_loop_sqrt.diary %}
```

Before writing a for loop, stop and check if the same calculation can be done with a loop.

{% capture notice-text %}
### Example: Rocket Engine with Inexact Performance
#### Question
{:.no_toc}
Often in the design phase of engineering, the exact values we need for an analysis are not immediately available.
My work depends on another person's results, their work depends on a third person's results, and that third person's work depends on my results.
To break the cycle, we need to be able to handle estimated ranges for values rather that the exact value. 

Consider, for example, the design of interplanetary rocket that will send a satellite from Earth to Mars.
We need to determine the fraction of the rocket's mass that will be fuel for the burn - it's propellant mass fraction $\zeta$ using the rocket equation:

$$ \Delta v = I_{sp} g_0 \log\left(\frac{m_0}{m_f}\right) $$

The propellant mass fraction is defined as $\zeta = 1 - m_f/m_0$.
We are given that the $\Delta v$ for the burn is 12 km/s and Earth's surface gravity is $g_0$=9.81 m/s<sup>2</sup>.
The specific impulse, $I_{sp}$, is somewhere between 380 and 450 s.
The design of the rocket is not mature enough for a precise value of $I_{sp}$, but we still need to produce values.
Determine the minimum and maximum propellant mass fraction for the rocket.

#### Solution
{:.no_toc}
To solve this problem, we isolate the mass fraction term in the rocket equation then calculate the propellant mass fraction.
We do this for the lower and upper bounds on the specific impulse.
Rearranging the rocket equation:

$$ \frac{m_0}{m_f} = e^\frac{\Delta v}{I_{sp} g_0} $$

We then plug that fraction into the propellant mass fraction formula, and repeat the process for the lower and upper bounds on specific impulse.

```matlab
{% include matlab/for_loop_rocket.m %}
```
```matlab
{% include matlab/for_loop_rocket.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Nested For Loops

A *nested* for loop is when a for loop is contained within another for loop.
This structure is useful when iterating over multiple dimensions of data, or performing operations with multiple levels of repetition.
For example, you could use a for loop to propagate the trajectory of an airplane, then nest that within another for loop where you vary the wind speed, the number of passengers, the air temperature, etc.

MATLAB can nest for loops to any depth, however the compute time will grow rapidly as more loops are added.
In the example above, if I have 1,000 timesteps and 30 wind speeds, then MATLAB will perform the inner loop calculations 30,000 times.
If there are 15 different cases of passenger count, I could loop over that as well, which would bring the number of inner loop calculations to 450,000.
This increase in the number of calculations is the *curse of dimensionality* and drives the need to make calculations as fast as possible.

## Parallelization

MATLAB does allow for accelerated performance with for loops using `parfor` instead of `for`.
This does take time initially to set up the parallel computing pool, but the intent is to parallelize the operations within a for loop.
Consider this as an option only when the execution of a for loop seems slow and could be done in parallel.

The MATLAB Help Center has documentation on
[parfor](https://www.mathworks.com/help/parallel-computing/parfor.html).

## Reading Questions

1. How does MATLAB determine how many times to execute the code in a for loop?
1. What are the components of the syntax of a for loop?
1. Is indenting the code in a for loop required by MATLAB?
1. Are vectorized operations generally slower or faster than for loops?
1. Can a for loop be executed within another for loop?
1. What are two differences between `for` and `parfor` in MATLAB?

## Practice Problem: Compressor Stage Pressure

A jet engine's compressor raises the pressure of incoming air in several stages, with each stage multiplying the pressure by its own stage pressure ratio.
The pressure after each stage depends on the pressure after the stage before it, which makes this a natural fit for a for loop.

In this practice problem, you'll write a MATLAB script that steps through a compressor's stages, tracking the pressure after each one.

### Your Task

Write a script named **`compressor_stages.m`** that starts from the given stage pressure ratios and inlet pressure:

```matlab
stage_ratios = [1.3, 1.28, 1.25, 1.22, 1.20]; % pressure ratio per stage
p_inlet = 14.7; % psi
```

Using a for loop, compute:

1. `stage_pressures` - an array, the same length as `stage_ratios`, where each element is the pressure *after* that stage (the pressure before stage 1 is `p_inlet`, and each stage's output pressure is its input pressure times its own stage ratio)
2. `overall_ratio` - the overall pressure ratio across the whole compressor (the final stage pressure divided by `p_inlet`)

Your variable names for the two answers above must match exactly (`stage_pressures`, `overall_ratio`) so that the checker below can find them.

### Checking Your Work

Download [check_compressor_stages.m]({{ site.baseurl }}/assets/practice/matlab/check_compressor_stages.m) and save it in the *same folder* as your `compressor_stages.m` script.
Make sure that folder is your Current Folder in MATLAB, then run:

```matlab
>> check_compressor_stages
```

The checker runs your script and reports whether each of the two values is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
