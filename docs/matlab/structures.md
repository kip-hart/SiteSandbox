---
title: Structures
---

In MATLAB, you can define almost any number of variables in the workspace.
This makes it very practical in engineering, where we design and analyze complex systems across mutliple disciplines.
For example, the tires on a car have geometric properties like diameter and width, the rubber they are made from has certain material properties like elasticity, those properties depend on the outside air temperature, and so on.
There are properties for the motor, the cabin, the frame, and the cargo. 
Mentally, we organize all these variables by which part of the car they describe.
**Structures in MATLAB allow us to organize variables in our workspace** in a way that matches our mental model of the system.

The MATLAB online manual details how to create and use structures on their [struct](https://www.mathworks.com/help/matlab/ref/struct.html) page.

## Creating Structures

Structures are creating using the period, `.`, in MATLAB.
Following the example above, `tire.diameter = 21;` would create a structure named `tire` that has a _field_ named `diameter` with _value_ set to 21.
To add more data about the tire, we repeat this pattern with new fields and values:

```matlab
{% include matlab/structure_tire.m %}
```

When we print the `tire` variable to the Command Window, we see all the variables contained within `tire`.
The workspace can contain multiple structures, which keeps our work organized.

```matlab
{% include matlab/structure_tire.diary %}
```

Note that the units for tire width are SI and the rim diameter are English.
Conversion to one system will be necessary to work with these numbers.
Structures can also help us keep track of unit conversion factors:

```matlab
{% include matlab/units_mini.m %}
```

## Accessing Fields

The value associated with a field can be accessed and used just like a variable.
For example:

```matlab
rim_area = pi * (tire.rim_diameter / 2)^2;
```

In the previous section, we defined variables related to a tire with mixed SI and English units.
We also defined conversion factors for length units.
These can be combined to create values in a single unit system.

{% capture notice-text %}
### Example: Tire Diameter
#### Question
{:.no_toc}
A tire has a width of 255 mm, an aspect ratio of 0.45, and a rim diameter of 21 inch.
Given the definitions below for the tire height and overall diameter,
write a MATLAB script that calculates the overall diameter in inches.

$$AR = \frac{h}{w}$$

$$d_{total} = d_{rim} + h$$

#### Solution
{:.no_toc}

To find the overall diameter of the tire, we will need to calculate the height of tire in the same units as the rim diameter.
The aspect ratio has no units, so ultimately the tire width and rim diameter need to be the same units.
We have the necessary unit conversion factors in a script named `units_mini.m`.

These conversion factors put `tire.width` and `tire.rim_diameter` into units of feet.
The equations for tire height and overall diameter are implemented free of conversion factors.
The final step is to convert the answer into inches.

```matlab
{% include matlab/structure_tire_calcs.m %}
```

Running this script produces the answer:

```matlab
{% include matlab/structure_tire_calcs.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

Note that **multiplying** by the conversion factor puts the value **into** feet, while **dividing** by the conversion factor converts the value **out of** feet.

## Updating Structures and Fields

The fields in a structure can be updated at any time.
Using the previous example, we can define `tire.total_diameter` after calculating its value.
Its important to remember that if any of the values used to calculate the tire diameter are updated,
the in `tire.total_diameter` will not be updated automatically.
You will need to recalculate it after those changes.
To make that update automatic requires [Classes](https://www.mathworks.com/help/matlab/object-oriented-programming.html).

## Nested Structures

So far we have seen the properties of a tire defined in a structure.
We can go a step further and contain all the properties of the car, breaking it down by subsystem:

```matlab
{% include matlab/structure_car.m %}
```

## Reading Questions

1. How do structures improve organization in MATLAB?
1. How do you create a new structure and add fields to it?
1. After defining a structure, how can you display its fields and values?
1. How do you reference values in a structure within a MATLAB expression?
1. How does storing unit conversion factors in a structure help solve problems with SI and English units?
1. Why does updating a base field (`tire.width`) not automatically refresh a dependent value (`tire.total_diameter`)?
1. What is the benefit of nesting structures?
