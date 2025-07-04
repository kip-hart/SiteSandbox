---
title: Polynomials
---

MATLAB contains a variety of functions that help with polynomials.
This includes evaluating polynomials, finding their roots, and doing some basic arithmetic.
Using these functions will accelerate your work and make your scripts easier to understand.

The MATLAB Help Center includes guides for these functions on their
[Polynomials](https://www.mathworks.com/help/matlab/polynomials.html) page.

$$ f(x) = \sum_{i=1}^n p_i x^{n-i} = p_1 x^{n-1} + p_2 x^{n-2} + \dots $$

## Creating Polynomials

The equation above is the general form of a polynomial.
It is a series of powers of $x$, each with their own coefficient.
For example, the polynomial $y = 3 x^2 - 10 x + 1$ has coefficients $[3, -10, 1]$.
When extracting the coefficients into a list like this,
it is import to first put the terms in order so the power on $x$ is decreasing.
If you have a polynomial with missing powers, like $y = 3 x^4 - 10 x + 1$,
you need to put zeros in places where the powers are missing.

$$ 3 x^4 - 10 x + 1 \Rightarrow 3 x^4 + 0 x^3 + 0 x^2 - 10x + 1 \Rightarrow [3, 0, 0, -10, 1] $$

Creating the above polynomial in MATLAB is a matter of defining an array that contains the
coefficients.

```matlab
% 3x^4 - 10x + 1
p = [3, 0, 0, -10, 1];
```

Practically, MATLAB does not treat this array differently from others.
What matters is how we use this array in polynomial-specific functions.

## Evaluating Polynomials

To evaluate the value of a polynomial at a value of $x$, use the `polyval` function.
The syntax is `y = polyval(p, x)`, where `p` is the array of coefficients and `x` is the input.

{% capture notice-text %}
## Example: Pumpkin Cannon
### Question
{:.no_toc}
At the *Punkin Chunkin* annual event, a compressed air cannon accelerates a pumpkin to a speed of 100 mph. 
Assuming the barrel is angled 45 degrees relative to the ground and the pumpkin has an altitude of 15 ft when it leaves the cannon,
how high (in feet) does the pumpkin get 2 seconds after leaving the cannon?

```matlab
%% Units
% English
U.S = 1;
U.MIN = 60*U.S;
U.HR = 60*U.MIN;

U.FT = 1;
U.MILE = 5280*U.FT;

U.RAD = 1;
U.DEG = pi*U.RAD/180;

%% Givens
speed = 100*U.MILE/U.HR;
theta = 45*U.DEG;
h_0 = 15*U.FT;
dt = 2*U.S;

%% Constants
g = 32.2*U.FT/U.S^2;
```

### Solution
{:.no_toc}
You can find the height of the pumpkin at 2 seconds using the formula:

$$ h(t) = -\frac{1}{2} g t^2 + v_0 t + h_0 $$

The speed in this equation is only the vertical component,
so we use the barrel angle to determine how fast the pumpkin is traveling in the vertical direction.
These are combined in a script that looks like:

```matlab
{% include matlab/poly_pumpkin_cannon.m %}
```

Which produces this result:

```matlab
{% include matlab/poly_pumpkin_cannon.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

MATLAB can also accept arrays for the variable `x`, in addition to single values.
In the example above, `dt` could be a range of times and we could later
plot the trajectory like `plot(dt, polyval(p, dt))`.
If we do not know the time of flight initially, we could set `dt` to be a range then *mask* values where the height is negative.
For example:

```matlab
{% include matlab/poly_pumpkin_cannon_plot.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/poly_pumpkin_cannon_plot/Figure_1.png" alt="Pumpkin trajectory" caption="Plot of pumpkin trajectory, evaluated with polyval." %}

Here, we reasonably assume it will take no more than 100 seconds for the pumpkin to reach the ground.
The `polyval` function will evaluate the polynomial `p` as if there was no ground and the pumpkin kept falling.
Masking on heights above ground level avoids plotting those values.

The MATLAB Help Center has documentation on 
[polyval](https://www.mathworks.com/help/matlab/ref/polyval.html).

## Roots of Polynomials

## Polynomial Arithmetic

## Polynomial Calculus

## Polynomial Fitting

## Reading Questions