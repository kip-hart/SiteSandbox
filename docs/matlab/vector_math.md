---
title: Vector Math
---

Beyond basic [array arithmetic]({{ site.baseurl }}{% link matlab/arrays_matrices.md %}#array-arithmetic), MATLAB has several functions built specifically for arrays and vectors, such as averaging a set of sensor readings, finding the magnitude of a force vector, or computing the work done by a force over a displacement.

## Functions on a Single Array

The following functions operate on a single array:

| Function | Description                       | MATLAB Help Center                                                     |
| -------- | ---------------------------------- | ------------------------------------------------------------------------ |
| flip     | Reverse the elements in an array  | [flip](https://www.mathworks.com/help/matlab/ref/flip.html)            |
| length   | Length of largest array dimension | [length](https://www.mathworks.com/help/matlab/ref/double.length.html) |
| max      | Largest value in array            | [max](https://www.mathworks.com/help/matlab/ref/double.max.html)       |
| mean     | Mean or average value in array    | [mean](https://www.mathworks.com/help/matlab/ref/double.mean.html)     |
| median   | Median value of an array          | [median](https://www.mathworks.com/help/matlab/ref/double.median.html) |
| min      | Minimum value of an array         | [min](https://www.mathworks.com/help/matlab/ref/double.min.html)       |
| norm     | Vector norm (magnitude) of array  | [norm](https://www.mathworks.com/help/matlab/ref/norm.html)            |
| prod     | Product of all values in array    | [prod](https://www.mathworks.com/help/matlab/ref/double.prod.html)     |
| sort     | Sort array in ascending order     | [sort](https://www.mathworks.com/help/matlab/ref/double.sort.html)     |
| std      | Standard deviation of array       | [std](https://www.mathworks.com/help/matlab/ref/double.std.html)       |
| sum      | Total of all values in array      | [sum](https://www.mathworks.com/help/matlab/ref/double.sum.html)       |

For a vector, `norm` computes the magnitude, $\sqrt{x^2 + y^2 + z^2 + ...}$, which you need any time you care about the size of a force, velocity, or displacement rather than its individual components.

```matlab
{% include matlab/vector_math_basic.m %}
```
```matlab
{% include matlab/vector_math_basic.diary %}
```

## Functions on Multiple Arrays

These functions operate on two arrays at once:

| Function   | Description                  | MATLAB Help Center                                            |
| ---------- | ----------------------------- | --------------------------------------------------------------- |
| dot(a,b)   | Dot product of two vectors   | [dot](https://www.mathworks.com/help/matlab/ref/dot.html)     |
| cross(a,b) | Cross product of two vectors | [cross](https://www.mathworks.com/help/matlab/ref/cross.html) |

The dot product of two vectors of the same length returns a single number, and is used throughout engineering to compute things like the work done by a force.
The cross product is only defined for vectors of length 3; it returns a new vector perpendicular to both inputs, and is used to compute things like torque.

{% capture notice-text %}
### Example: Torque and Work
#### Question
{:.no_toc}
A technician tightens a bolt using a wrench, then pushes a cart down a hallway.

For the wrench, the lever arm from the bolt to the technician's hand is `r = [0.15, 0, 0]` m, and the applied force is `F = [0, 40, 0]` N.
Find the resulting torque vector.

For the cart, the applied force is `force = [120, -40, 0]` N, and the cart moves along `displacement = [5, 2, 0]` m.
Find the work done on the cart.

#### Solution
{:.no_toc}
Torque is the cross product of the lever arm and the applied force, while work is the dot product of the force and the displacement.

```matlab
{% include matlab/vector_math_wrench.m %}
```
```matlab
{% include matlab/vector_math_wrench.diary %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. What does `norm` compute for a vector, and what physical quantities is that useful for?
1. What is the difference between what `dot` returns and what `cross` returns?
1. If you take the dot product of a force vector and a displacement vector, what physical quantity do you get?
1. If you take the cross product of a lever arm vector and a force vector, what physical quantity do you get?
1. Does `dot` work on vectors of any length, or only vectors of length 3? What about `cross`?

## Practice Problem: Rotor Blade Load Survey

A helicopter's main rotor blades don't all carry exactly the same load.
Small differences in manufacturing, wear, and adjustment mean each blade's lift force is a little different, and technicians track that spread as part of routine maintenance.

In this practice problem, you'll write a MATLAB script that summarizes a set of blade load readings, then uses the dot product to find the power delivered by the rotor during a climb.

### Your Task

Write a script named **`rotor_loads.m`** that starts from the given blade load readings:

```matlab
blade_loads = [4820, 5100, 4950, 5030]; % lbf, one reading per blade
```

Compute:

1. `mean_load` - the mean of `blade_loads`
2. `load_spread` - the difference between the highest and lowest blade loads
3. `load_std` - the standard deviation of `blade_loads`

Next, given the helicopter's climb velocity and the rotor's thrust vector:

```matlab
v = [0, 0, 8]; % m/s, climb velocity
F = [150, -80, 45000]; % N, rotor thrust vector
```

4. `climb_power` - the power, in watts, delivered by the thrust vector along the climb direction (the dot product of `F` and `v`)

Your variable names for the four answers above must match exactly (`mean_load`, `load_spread`, `load_std`, `climb_power`) so that the checker below can find them.

### Checking Your Work

Download [check_rotor_loads.m]({{ site.baseurl }}/assets/practice/matlab/check_rotor_loads.m) and save it in the *same folder* as your `rotor_loads.m` script.
Make sure that folder is your Current Folder in MATLAB, then run:

```matlab
>> check_rotor_loads
```

The checker runs your script and reports whether each of the four values is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
