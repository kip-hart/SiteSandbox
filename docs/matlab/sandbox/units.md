---
title: Units Example
matlab_run_01: matlab/units_example
---

Here's an example of how to use the units function.


{% capture notice-text %}
#### Example: Mixed Units
##### Question
If a conical space capsule has a diameter of 5.1 meters, a height
of 129 in, and weighs 30,000 lbm, what is its density?
Express your answer in kg/m^3.

##### Solution
This problem requires first converting the givens into a single
unit system. Either will work, so lets use metric. Next, we need
to calculate the volume of the capsule. Finally, we divide the
mass by volume to get the density. The volume of a cone is given by:

$$ V = \frac{1}{3} \pi r^2 h $$

In MATLAB, this looks like:
```matlab
{% include {{ page.matlab_run_01 }}.m %}
```

where the [`units()`]({{ site.baseurl }}{% link matlab/examples/units.md %}) function
generates a structure containing unit conversion factors.

The result of running the script is:
```text
{% include {{ page.matlab_run_01 }}.diary %}
```

This function is useful for containing unit conversion factors.
In practice, you can write scripts and functions that implement
equations that do not specify units (e.g. $F=m a$). You apply units
to the inputs, the equations create an output, then you divide by
the units you want your answer to be in.
{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>