---
title: Polynomials
---

MATLAB contains a variety of functions that help with polynomials.
This includes evaluating polynomials, finding their roots, and doing some basic arithmetic.
Using these functions will accelerate your work and make your scripts easier to understand.

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

## Roots of Polynomials

## Polynomial Fitting

## Reading Questions