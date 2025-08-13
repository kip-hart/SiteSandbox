---
title: User-Defined Functions
---

User-defined functions in C++ let engineers encapsulate a set of instructions into a reusable block.
This promotes modularity, reduces code repetition, and improve readability.
Engineers can break down complex problems into smaller, manageable units with functions.

```cpp
{% include cpp/functions_fibonacci/fib_main.cpp %}
```

## Function Anatomy and Prototypes

A function prototype states the return type, the function name, and the types of its parameters, ending with a semicolon.
For example, `int fibonacci(int);` tells the compiler that calls to `fibonacci` will supply
one `int` and will return an `int`.
The prototype appears near the top of the file, before `int main(void)`, so any calls inside `main` are type-checked.
The function definition repeats the same signature but adds the body between braces.
The parameter names in the definition become local variables bound to the argument values at the call site.
Order then becomes flexible: as long as the prototype is visible, the definition itself can come later in the file.

{% capture notice-text %}
## Example: Normal Stress
### Question
{:.no_toc}
The normal stress in a member under axial load is given by:

$$ \sigma = \frac{F}{A}$$

where $F$ is the applied load and $A$ is the cross-sectional area.
Write a function named `normal_stress` that computes $\sigma$, then call that function within `main` to calculate the normal stress (in psi) on a member with a cross-sectional area of 20 in<sup>2</sup> under a load of 500 lb<sub>f</sub>.

### Solution
{:.no_toc}

The following cpp file includes a `normal_stress` function that is called by `main` to find the stress.

```cpp
{% include cpp/functions_stress/stress_main.cpp %}
```

This is the result from compiling and running it:

```text
{% include cpp/functions_stress/screen_output.log %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>


## Calling, Arguments, and Return Values

Function calls must match the prototype in number and type of arguments.
If a function returns a value, the `return` statement both ends the function and provides the value to the caller.
Its expression must be compatible with the function's declared return type.
For functions that perform an action but produce no value, the return type is `void`, and the function may simply reach the closing brace or execute a bare `return;`.

## Style Considerations

Clear names make it easier to understand what the function does.
Keep functions focused on a single task.
If a function starts to grow long, or handle unrelated tasks, split it into separate functions.
Place prototypes together near the top of the file to give the compiler and the reader quick access to available operations.
Finally, compile and test functions incrementally.
Verify the function's behavior with simple, known inputs before rely on it in a larger computation.

## Reading Questions

1. What are two benefits of user-defined functions in C++?
1. How does a function prototype help the compiler?
1. What are the key components of a function prototype?
1. Why is it important to place the prototype before `int main(void)`?
1. How does the return statement work in a function?
1. What are two style guidelines to follow when writing functions?
