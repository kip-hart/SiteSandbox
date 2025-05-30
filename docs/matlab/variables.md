---
title: Variables in MATLAB
---

A **variable** in MATLAB is a name associated with space in the computer's memory
that holds a value you can use or modify.
For example:

```matlab
x = 3
```

stores the value 3 in memory associated with the name `x`.
You can use this name in calculations and MATLAB will find the value associated with `x`.

## Defining and Using Variables
You define variables with the equals sign, `=`, like in the example above.
For example:

```matlab
base = 3
height = 10
area = base * height
```

**Notice**
The equals sign, `=`, is an operator in MATLAB that assigns the value on the right side to the variable name on the left.
It does not work like equality in mathematics, where you can have expressions on the left and right side of the equals sign.
To use the example above, `area = base * height` is valid MATLAB because the variable name `area` on the left is assigned to the product `base * height`.
If you flip the equation and type `base * height = area` in MATLAB, you will get an error because that does not follow the syntax of variable name on the left and value on the right.
{: .notice--warning}

MATLAB is flexible with what it considers valid names for variables.
In general, variable names that follow these rules are allowed:

1. Starts with a letter
2. Contains only lower case letters, upper case letters, numbers, and underscores
3. Length is less than `namelengthmax` characters long*

*As of R2025a, this limit is 2048 characters.

The [Variable Names](https://www.mathworks.com/help/matlab/matlab_prog/variable-names.html) page in the MATLAB documentation
provides more details and examples of valid variable names.

There are a few conventions or styles for naming variables in engineering.
None are better or worse than the others, and none are followed consistently.
Below are some examples of different variable naming styles used to express tangential velocity, $v = \omega r$.

```matlab
v = w * r
v = omega * r
vel_tangential = ang_rate * radius
vTangential = angRate * radius
vel_ft_per_sec = omega_rad_per_sec * radius_ft
```

The last form may be tempting to use since you can check the units,
however you can have issues when you reuse code in a different unit system.
The other forms are not locked into feet and rad/s, so they are more reusable.

## Displaying Variables

To display the value of a variable, you can type the name in the Command Window and press Enter.
For example:

```matlab
>> area
```

will print the value of `area` in the Command Window.
It prints this value because there is no semicolon,`;`, at the end of the line.
If you do not want MATLAB to display values, end the line with a semicolon.

You can also see all variable values at a glance in the Workspace pane.

## Clearing Variables

Clearing a variable will delete it from the workspace.
Fundamentally, the computer is forgetting the association between the variable name and the addresses in memory that contained its value.
This is useful if you are solving several problems and want to make sure the values from the previous problem do not accidentally carry over into the next problem.
To clear a specific variable, like `area`:

```matlab
>> clear area
```

To clear all variables in the workspace:

```matlab
>> clear
```

## Reading Questions

1. What is a variable in MATLAB?
2. How does the `=` operator in MATLAB differ from the equals sign, =, in mathematics?
3. Why is `area = base * height` valid syntax but `base * height = area` is not?
3. Which of these variable names are valid?
    1. `double_speed`  
    2. `2xSpeed`  
    3. `_2xSpeed`  
    4. `v_2x`  
    5. `v_200%`  
4. What are the pro's and con's of putting units in variable names?
5. What are two ways to check the value of a variable?
6. What does adding `;` to the end of a line do?
7. How do you clear a specific variable value?
