---
title: Random Numbers
---

In engineering, we often work with uncertain quantities.
What will the wind speed be on the day of the rocket launch?
Where are the obstacles my robot needs to avoid?
How do I handle the % error from the results of my experiment?

Random (and pseudorandom) numbers can be created and used in MATLAB when working with uncertain quantities.

## Pseudorandom Numbers

Modern computers are machines, fundamentally, that cannot create *mathematically* random numbers.
Quantum computers are the exception, containing qubits that exhibit wave-particle duality.
For our purposes, a "classical" modern computer produces the same results every time a code is run because the source code and the inputs remain the same.

MATLAB can generate *pseudorandom* numbers that meet our needs, as engineers, for random numbers without fitting the mathematical definition of a random number.
It follows the [Mersenne Twister](https://blogs.mathworks.com/cleve/2015/04/17/random-number-generator-mersenne-twister/#4785d541-7c1d-4a09-be7d-067b628acf19) algorithm to generate draws of a random number distribution, in a repeatable way.
The first draw is always the same, the second is always the same, and so on.
To generate a different list of draws, the twister algorithm can be initialized with a different *seed* value.

The fact that a pseudorandom number generator outputs the same set of draws each time the MATLAB script runs is an overall benefit in engineering.
If you are designing an aircraft, for example, and it loses control on the first draw of the random winds profile, then you want that draw to remain the same while you try to improve the design.
If the draws changed every time, you would lose the ability to troubleshoot the design in that wind condition.

## MATLAB Functions

### Initializing

To initialize the random number generator (RNG) within MATLAB, use the `rng` function.
Its syntax is `rng(seed)`, where `seed` is a nonnegative integer.
You can also use `rng("default")` to use MATLAB's default seed.
Without any input, `rng` will print out the current RNG settings.

```matlab
{% include matlab/random_init.m %}
```

```matlab
{% include matlab/random_init.diary %}
```

The MATLAB Help Center has documentation on 
[rng](https://www.mathworks.com/help/matlab/ref/rng.html).

### Uniform Distributions

To draw numbers from a uniform distribution in MATLAB, use the `rand` function.
This will always draw numbers from 0 to 1, so to go from $a$ to $b$ you can scale and shift the outputs:

$$ U[a, b] = a + (b - a) \cdot U[0, 1] $$

The syntax for `rand` is `rand(m, n)`, which creates a matrix with `m` rows and `n` columns of random numbers from 0 to 1.
There is a shortcut, `rand(n)`, which generates an square matrix with `n` rows and columns.
This can be confusing for new users, who may expect `rand(n)` to generate row vector with `n` elements.
Examples of drawing from a uniform distribution are:

```matlab
{% include matlab/random_uniform.m %}
```

```matlab
{% include matlab/random_uniform.diary %}
```

The above example draws uniform random *floating point* numbers, but sometimes we need to draw random *integers*.
To do that, we use the `randi` function.
Its syntax is `randi(imax, m, n)`, where `imax` is the maximum integer.
The minimum integer is always 1.
For example:

```matlab
{% include matlab/random_integers.m %}
```

```matlab
{% include matlab/random_integers.diary %}
```

The MATLAB Help Center has documentation on 
[rand](https://www.mathworks.com/help/matlab/ref/double.rand.html) and
[randi](https://www.mathworks.com/help/matlab/ref/double.randi.html).

### Normal Distributions

To generate draws from the standard normal distribution (mean of 0 and standard deviation of 1), use the `randn` function.
Its syntax is `randn(m, n)`, where `m` is the number of rows and `n` is the number of columns in the output.
Since these are draws from the standard normal, you need to scale and offset the values for a specific mean and standard deviation:

$$ N[\mu, \sigma] = \mu + \sigma \cdot N[0, 1] $$

For example:

```matlab
{% include matlab/random_normal.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/random_normal/Figure_1.png" alt="Wind draws" caption="Histogram of normally distributed wind draws." %}

The MATLAB Help Center has documentation on  
[randn](https://www.mathworks.com/help/matlab/ref/double.randn.html).

### Custom Distributions

### Statistics

## Engineering Applications

## Examples

## Reading Questions
