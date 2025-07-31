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

## Best Practices

* Avoid syntax errors using `elseif` instead of `else if`
* Use short-circuit operators (`&&` and `||`) for improved performance with compound conditions
* Avoid deeply nested logic when possible. If needed, convert code blocks into dedicated functions with their own `if` statements

## Reading Questions

1. What is the purpose of an `if` statement in MATLAB?
1. What happens if multiple conditions in an `if-elseif-else` block are all true?
1. What is the difference between `&` and `&&` in MATLAB?
1. How would you write a conditional statement that checks if the value `x` is between 5 and 10, inclusive?
