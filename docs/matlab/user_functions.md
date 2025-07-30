---
title: User Functions
---

MATLAB allows users to define their own functions, in addition to built-in functions.
This improves code organization, reduces repetition, and improves readability.
User-defined functions can be stored in separate files and called from scripts or other functions.
They are essential for building scalable and maintainable engineering code.

The MATLAB Help Center includes a guide to [Create Functions in Files](https://www.mathworks.com/help/matlab/matlab_prog/create-functions-in-files.html).

## Purpose of Functions

Functions are reusable blocks of code that accept inputs, perform operations, and return outputs.
They are especially useful when a calculation needs to be performed multiple times with different inputs.
They can also abstract the details of a complex operation into a simpler interface.
For example, when you call `sin(x)` you are not particularly interested in the algorithm used to compute the sine of an angle; you just want the answer.

## Syntax
User-defined functions in MATLAB follow this general syntax:

```matlab
function [out1, out2, ...] = function_name(in1, inp2, ...)
    % Code to compute outputs
end
```

The function must be saved in a file with the same name as the function.
In this example, it would be saved in `function_name.m`.
The body of the function contains the calculations.
Comments can be added using `%` to describe the purpose of each step.

{% capture notice-text %}
## Example: Stress on a Beam
### Question
{:.no_toc}
A force of 5000 N is applied to a beam with a cross-sectional area of 0.002 m<sup>2</sup>.
Given the formula for axial stress:

$$ \sigma = \frac{F}{A} $$

write a MATLAB function that calculates stress for any $F$ and $A$, then use it to find the stress for the givens above.
Express your answer in MPa.

### Solution
{:.no_toc}

Here the stress equation is implemented in a function.
It takes two inputs, `force` and `area`, and computes the pressure.
Here's the function:

```matlab
{% include matlab/pressure.m %}
```

Using this function in a script:

```matlab
{% include matlab/functions_pressure.m %}
```

```matlab
{% include matlab/functions_pressure.diary %}
```

Notice the variable names are slightly different.
Within the function, the first input is assigned to the variable `force` and
the second input is assigned to the variable `area`.
In the script that calls `pressure`, the variable `F` is the first input and `A` is the second.
The value of `F` in the script is assigned to `force` within the function,
and the same for area.

Also notice that `./` is used instead of `/`.
The question asked to find the value of $\sigma$ for a scalar $F$ and scalar $A$,
however in the future we may have arrays for `force` and `area`.
Using the `./` is not necessary for scalars, but it makes the function capable of handling arrays in the future.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>


## Input and Output Behavior

Functions can accept a variety of data types as inputs.
This includes scalars, vectors, matrices, and structures.
MATLAB does not require you to specify what type each input should be.
All inputs are contained within a set of parentheses that follow the function name.
The outputs are contained within square brackets and come before the function name and assignment operator.

```matlab
function [v, a] = kinematics(s, t)
    v = s ./ t;
    a = diff(v) ./ diff(t);
end
```

## Scope and Variables

Variables defined inside a function are *local* to that function.
They do on affect variables in the calling script unless returned explicitly.
This helps prevent accidental overwriting of data and improves modularity.

## Best Practices

* Use descriptive names for functions
* Use generic names for input and output variables
* Include comments and documentation in functions
* Avoid hardcoding values inside functions
* Keep the scope of each function narrow - one task per function

## Reading Questions

1. What are the benefits to user-defined functions in MATLAB?
1. What must the filename be for a file containing a user-defined function?
1. Describe which variables from a script are and are not available to a function called by that script.
1. How would you define a function that calculates the volume of a cylinder given its radius and height?
1. How can functions improve the readability and maintainability of your code?
