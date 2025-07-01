---
title: Native Functions
---

In MATLAB, **native** or **built-in** functions are pre-defined, highly-optimized methods to perform specific operations.
For example, `x^0.5` follows the operations to raise any number to another number, while `sqrt(x)` is optimized for specifically finding the square root of a number.
Operations more complex than basic arithmetic are accomplished using functions.
Most native functions in MATLAB are *vectorized*, meaning it takes virtually the same amount of time to compute `sqrt` of a single number and of a list of numbers.
MATLAB provides an array of built-in functions, and in X we explore writing our own custom functions.

For a quick reference of commonly used native functions, visit [Basic Functions Reference](https://www.mathworks.com/content/dam/mathworks/fact-sheet/matlab-basic-functions-reference.pdf) in the MATLAB Help Center.

## Invoking Native Functions

```matlab
% 1. Square root
x = 81;
y1 = sqrt(x)

% 2. Greater of two numbers
a = 30;
b = 10;
y2 = max(a, b)

% 3. Print text to screen
answer = 42;
disp(['The answer is :' str(answer)])

% 4. Using functions in-line
y4 = a*sin(b) + a*cos(b)
```

To use/invoke a native function, type its name followed by its inputs in parentheses `()`.
The inputs are separated by commas `,` if there are multiple.
The output of the function can be used in-line or saved to a variable.
If a function has multiple outputs, they are contained in square brackets `[]` like this:
`[out1, out2] = func(x)`.

## Common Native Functions in Engineering

### Basic Functions

| Function | Description | Example | Result |
|---|---|---|---|
| `abs(x)` | Computes the absolute value of `x`. | `abs(-5)` | `5` |
| `sqrt(x)` | Computes the square root of `x`. | `sqrt(49)` | `7` |
| `cbrt(x)` | Computes the cube root of `x`. | `cbrt(27)` | `3` |
| `exp(x)` | Computes $e^x$, where $e$ is Euler's number. | `exp(1)` | `2.7183` (approx) |
| `log(x)` | Computes the natural logarithm (base $e$) of `x`. | `log(exp(2))` | `2` |
| `log10(x)` | Computes the base 10 logarithm of `x`. | `log10(100)` | `2` |
| `ceil(x)` | Rounds `x` to the nearest integer towards positive infinity. | `ceil(3.1)` | `4` |
| `floor(x)` | Rounds `x` to the nearest integer towards negative infinity. | `floor(3.9)` | `3` |
| `round(x)` | Rounds `x` to the nearest integer. Halfway cases are rounded away from zero. | `round(3.5)` | `4` |
| `mod(x, y)` | Computes the remainder after division of `x` by `y`. | `mod(10, 3)` | `1` |
| `max(x, y)` | Returns the larger of `x` and `y`. | `max(7, 12)` | `12` |
| `min(x, y)` | Returns the smaller of `x` and `y`. | `min(7, 12)` | `7` |

### Trigonometric Functions

| Function | Description | Example | Result |
|---|---|---|---|
| `sin(x)` | Computes the sine of `x` (radians). | `sin(pi/2)` | `1` |
| `cos(x)` | Computes the cosine of `x` (radians). | `cos(0)` | `1` |
| `tan(x)` | Computes the tangent of `x` (radians). | `tan(pi/4)` | `1` |
| `sind(x)` | Computes the sine of `x` (degrees). | `sind(90)` | `1` |
| `cosd(x)` | Computes the cosine of `x` (degrees). | `cosd(0)` | `1` |
| `tand(x)` | Computes the tangent of `x` (degrees). | `tand(45)` | `1` |

### Probability and Statistics

| Function | Description | Example | Example Output (may vary) |
|---|---|---|---|
| `rand` | Generates a single uniformly distributed random number between 0 and 1. | `random_val = rand;` | `0.7513` (e.g.) |
| `randi(imax)` | Generates a single uniformly distributed random integer between 1 and `imax`. | `random_int = randi(100);` | `42` (e.g., between 1 and 100) |
| `randn` | Generates a single normally distributed random number with mean 0 and variance 1. | `normal_random_val = randn;` | `0.5377` (e.g.) |




{% capture notice-text %}
## Example: Satellite Aerodynamics
#### Question
{:.no_toc}

A satellite grazing the "top" of the atmosphere will still experience aerodynamic drag.
The force of drag on the satellite is calculated from:

$$ D = \frac{1}{2} \rho V^2 C_D S_{ref}$$

where $\rho$ is the density of the air, $V$ is the wind-relative speed of the satellite,
$C_D$ is the drag coefficient, and $S_{ref}$ is the reference area.
The density of the atmosphere is significantly reduced compared to sea level.
We can assume the atmospheric air density drops exponentially with altitude:

$$\rho = \rho_0 e^{-h/H}$$

To calculate the density, assume $\rho_0$ = 4.615e-9 kg/m<sup>3</sup>, $H$ = 54 km, and $h$ = 400 km. The wind-relative speed of the satellite is the difference between the inertial speed of the satellite and the inertial speed of the air. Assume the inertial speed of the satellite is 7 km/s and the speed of the air is given by:

$$V_{air} = \omega R_e \cos{\lambda}$$

where $\omega$ = 7.2921e-5 rad/s, the radius of the earth $R_e$ = 6371 km, and the latitude $\lambda$ = 38.98 degrees. The drag coefficient on the satellite will be assumed to follow the hyperthermal limit to Maxwellian hypersonic rarefied aerodynamics:

$$C_D = 2 (2 - \sigma_N) \sin^3\theta + 2 \sigma_T \sin\theta \cos^2\theta$$

where $\sigma_N$ = $\sigma_T$ = 1, and $\theta$ = 65 degrees.
Finally, the reference area for the satellite is the area of its solar arrays and given to be 20 m<sup>2</sup>.

Find the drag force on the satellite, in Newtons, using a MATLAB script and built-in functions.

#### Solution
{:.no_toc}

To find the drag force, we plug all the givens into the equations for intermediate variables then plug intermediate variables into the drag equation.
The script below starts by defining unit conversion factors to keep everything in MKS, then organizes the givens.

```matlab
{% include matlab/satellite_drag.m %}
```

Notice how the units are part of the variable assignments for the givens - not in comments.
This keeps the calculations code clean and reusable.
If I need to do this calculation again with $h$ given in meters, I only have to change the line defining `h` (not the lines that use `h`).
The result from running this script is:

```matlab
{% include matlab/satellite_drag.diary %}
```

The semi-colons were intentionally left off the calculation lines to help debug your code if the final answer is different.

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. What are the advantages to using MATLAB built-in functions?
1. How do you invoke a MATLAB function that takes two input values?
1. What does `max(-10, 3)` return? What about `min(-10, 3)`?
1. What does `max(abs(-10), abs(3))` return? What about `abs(max(-10, 3))`?
1. How are `round`, `ceil`, and `floor` different?
1. What units does MATLAB assume for the input to `sin` and `cos`?
1. What units does MATLAB produce results for using `asind`?
1. How do you get Euler's number using MATLAB built-in functions?
