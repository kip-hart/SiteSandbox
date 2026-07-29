---
title: Conditionals
---

Whether or not a block of code is executed in MATLAB can be controlled using `if` statements.
Coupled with `elseif` and `else`, you can write code that is executed depending on whether a logical expression is true.
For example, water boils into steam *if* the temperature is greater than the boiling point.

The MATLAB Help Center has a guide on [Conditional Statements](https://www.mathworks.com/help/matlab/matlab_prog/conditional-statements.html).

## Syntax

Conditional statements in MATLAB follow this general structure:

```matlab
if condition1
    statements1
elseif condition2
    statements2
else
    statements3
end
```

Each condition is evaluated in order.
If `condition1` is true, `statements1` are executed and the rest are skipped.
If `condition1` is false but `condition2` is true, `statements2` are executed.
If none of the conditions are true, the `else` block is executed.
The `elseif` and `else` blocks are both optional.

## Logical Expressions

Conditions are typically logical expressions involving relational operators (`<`, `>`, `==`, `~=`, etc.) or logical operators (`&&`, `||`, `~`).
MATLAB treats a condition as true if it is nonempty and all elements are nonzero.

```matlab
{% include matlab/conditionals_disp.m %}
```
```matlab
{% include matlab/conditionals_disp.diary %}
```

{% capture notice-text %}
## Example: Material Selection
### Question
{:.no_toc}
An engineer is selecting a material for a structural component.
The material must have a yield strength above 250 MPa and a density below 8000 kg/m<sup>3</sup>.
Write a MATLAB script to check if a material with yield strength 300 MPa and density 7800 kg/m<sup>3</sup> meets these criteria.

### Solution
{:.no_toc}

To evaluate the fitness of the material, we use `if` statements to check the criteria.

```matlab
{% include matlab/conditionals_materials.m %}
```
```matlab
{% include matlab/conditionals_materials.diary %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>


## Compound Conditions
Multiple conditions can be combined using logical operators.

* `&&` is the logical AND (short-circuit)
* `||` is the logical OR (short-circuit)
* `~` is the logical NOT

Short-circuit operators stop evaluating as soon as the result is known, improving performance and avoiding errors.

## Nested If Statements

You can nest `if` statements inside other `if` blocks, to handle more complex logic.
Each nested `if` must have its own `end`.

```matlab
{% include matlab/conditionals_nested.m %}
```
```matlab
{% include matlab/conditionals_nested.diary %}
```

## A Few Tips

Writing `else if` as two words, rather than the single keyword `elseif`, is a common syntax error - MATLAB will treat it as a new, separate `if` statement that needs its own `end`, rather than a continuation of the outer one.
Prefer the short-circuit operators, `&&` and `||`, over `&` and `|` for compound conditions, since they stop evaluating as soon as the result is known.
Finally, if a nested `if` statement starts to grow several levels deep, it is often clearer to pull that logic out into its own [function]({{ site.baseurl }}{% link matlab/user_functions.md %}) rather than keep nesting.

## Reading Questions

1. What is the purpose of an `if` statement in MATLAB?
1. What happens if multiple conditions in an `if-elseif-else` block are all true?
1. What is the difference between `&` and `&&` in MATLAB?
1. How would you write a conditional statement that checks if the value `x` is between 5 and 10, inclusive?

## Practice Problem: Fuel Reserve Status

Pilots plan fuel around more than just "will I make it there." Regulations require a minimum reserve in case of a diversion or delay, and how much time that reserve represents changes as fuel burns down.

In this practice problem, you'll write a MATLAB script that classifies a fuel reserve as Normal, Caution, or Reserve based on how much flight time it represents.

### Your Task

Write a script named **`fuel_reserve.m`** that starts from the given fuel state:

```matlab
fuel_lb = 180; % lb, fuel remaining
burn_rate = 140; % lb/hr
```

Compute:

1. `endurance_hr` - the remaining flight time, in hours (`fuel_lb` divided by `burn_rate`)
2. `status` - a string classifying `endurance_hr` using an `if`-`elseif`-`else` statement:
   * `'Normal'` if `endurance_hr` is 1.5 or more
   * `'Caution'` if `endurance_hr` is at least 0.75 but less than 1.5
   * `'Reserve'` if `endurance_hr` is less than 0.75

Your variable names for the two answers above must match exactly (`endurance_hr`, `status`) so that the checker below can find them.

### Checking Your Work

Download [check_fuel_reserve.m]({{ site.baseurl }}/assets/practice/matlab/check_fuel_reserve.m) and save it in the *same folder* as your `fuel_reserve.m` script.
Make sure that folder is your Current Folder in MATLAB, then run:

```matlab
>> check_fuel_reserve
```

The checker runs your script and reports whether each of the two values is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
