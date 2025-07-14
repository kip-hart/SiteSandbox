---
title: Complex Numbers
---

Complex numbers extend the real number system by introducing an imaginary component.
This component multiplies the imaginary number $i=\sqrt{-1}$, which is sometimes called $j$.
MATLAB natively supports complex numbers, and has several features that facilitate working with them.
Though complex numbers do not "exist" in the real world, they are tremendously useful in engineering design and analysis. They make it easier to understand circuits with alternating current, control systems, and vibrations.

$$ z = a + b i $$

The complex number $z$ has real component $a$ and imaginary component $b$.
The MATLAB Help Center has a guide on [Complex Numbers](https://www.mathworks.com/help/matlab/complex-numbers.html)

## Creating Complex Numbers

MATLAB has two methods for creating complex numbers.
You can either type it the way it is written,
or construct it with the `complex` function.
For example:

```matlab
{% include matlab/complex_examples_disp.m %}
```
```matlab
{% include matlab/complex_examples_disp.diary %}
```

You can also create arrays of complex numbers.
For instance:

```matlab
z = [1+2i, 3-4i; -5i, 6];  
```

Once a complex number has been defined, you can access its
real and imaginary components using the `real` and `imag` functions.

Both `i` and `j` are available for the imaginary number.
Sometimes `i` is used to index into an array, like the $i$-th term,
which would overwrite the built-in definition of $\sqrt{-1}$.
Best practice is to avoid short variable names,
so `a(idx)` is preferred over `a(i)` because its clearer
what the variable is used for and avoids overwriting the imaginary number.

The MATLAB Help Center has documentation on 
[complex](https://www.mathworks.com/help/matlab/ref/complex.html), 
[real](https://www.mathworks.com/help/matlab/ref/real.html), and
[imag](https://www.mathworks.com/help/matlab/ref/imag.html).

## Basic Arithmetic

Just like real numbers, we can do basic arithmetic with complex numbers.
This includes addition, subtraction, multiplication, division, and exponentiation.
Using the complex numbers from the previous section:

```matlab
{% include matlab/complex_arithmetic.m %}
```
```matlab
{% include matlab/complex_arithmetic.diary %}
```

Addition and subtraction are done separately on the real and imaginary components of
the complex numbers.
The product follows the FOIL rule of first-outside-inside-last.
Internal to MATLAB, the quotient is found by taking the complex conjugate of the denominator.
This inverts the denominator, so essentially:

$$ \frac{z_1}{z_2} \RightArrow z_1 z_2^{-1} \RightArrow z_1 \bar{z_2} \frac{1}{|z_2|^2} $$

Finally, exponentiation is repeated multiplication.

## Polar Form

Complex numbers can be expressed in polar coordinates (radius and angle) in addition to
the Cartesian (real and imaginary) coordinates.
This makes use of the identity:

$$ r e^{i\theta} = r \cos(\theta) + r \sin(\theta) i $$

To access the complex magnitude $r$, use the `abs` function.
The angle can be accessed using the `angle` function.
The result from `angle` is always expressed in radians.
For example:

```matlab
{% include matlab/complex_polar.m %}
```
```matlab
{% include matlab/complex_polar.diary %}
```

The MATLAB Help Center has documentation on 
[abs](https://www.mathworks.com/help/matlab/ref/double.abs.html) and
[angle](https://www.mathworks.com/help/matlab/ref/angle.html).

## Conjugation and Symmetry

The complex conjugate of a number $z = a + bi $ is defined as:

$$ \bar{z} = a - bi $$

In MATLAB, you compute the conjugate using the `conj` function:

```matlab
zc = conj(z);
```

Conjugation reflects points across the real axis in the complex plane.
We often see conjugate pairs as the complex roots to the quadratic formula,
like $r = a \pm b i$.
For any general polynomial, if it has a complex root then the conjugate is also a root.
This symmetry across the real axis underlies many algorithms in signal processing and control systems.
It guarantees that real-world responses remain real, cancelling out imaginary components.

## Example: AC Circuit Impedance

## Reading Questions
