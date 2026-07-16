---
title: Classes
---

A [structure]({{ site.baseurl }}{% link matlab/structures.md %}) groups related data together under one variable, with fields you access using a dot, like `tire.diameter`.
A **class** takes that same idea a step further: it groups data together *and* bundles in the functions that operate on that data, so both travel together as a single unit.

The MATLAB Help Center has a guide on [Object-Oriented Programming](https://www.mathworks.com/help/matlab/object-oriented-programming.html).

## Defining a Class

A class is defined in a file named exactly after the class, using the `classdef` keyword.
For example, a `Rocket` class would be saved in a file named `Rocket.m`, containing:

```matlab
classdef Rocket
    properties
        Name
        Thrust % N
        Mass   % kg
    end

    methods
        function obj = Rocket(name, thrust, mass)
            obj.Name = name;
            obj.Thrust = thrust;
            obj.Mass = mass;
        end

        function twr = thrustToWeight(obj)
            g = 9.81;
            twr = obj.Thrust / (obj.Mass * g);
        end
    end
end
```

The **properties** block lists the data each `Rocket` carries around - similar to fields in a structure.
The **methods** block contains functions associated with the class.
Every method's first input, `obj` by convention, is the object it's being called on.

The method with the same name as the class (`Rocket`, here) is the **constructor** - the function that runs when you create a new `Rocket`, responsible for filling in its properties.

## Creating and Using Objects

An *object* is one specific instance of a class, created by calling the constructor:

```matlab
my_rocket = Rocket('Test Vehicle', 5000000, 400000);
```

This calls the constructor with `name='Test Vehicle'`, `thrust=5000000`, and `mass=400000`, and stores the resulting object in `my_rocket`.
Properties are accessed with dot notation, just like a structure's fields:

```matlab
disp(my_rocket.Name)
```

Methods are also called with dot notation, but with parentheses to invoke them:

```matlab
twr = my_rocket.thrustToWeight();
```

This calls `thrustToWeight` with `obj` automatically set to `my_rocket`, computing a thrust-to-weight ratio of about 1.27 for the values above.

## Why Use a Class?

You can create as many `Rocket` objects as you like from the same class definition, each with its own independent property values:

```matlab
falcon = Rocket('Booster A', 7600000, 549000);
sls = Rocket('Booster B', 39100000, 2600000);
```

Both `falcon` and `sls` have their own `Name`, `Thrust`, and `Mass`, and both can call `thrustToWeight()` - the calculation only has to be written once, inside the class, instead of copied into every script that needs it.
This is the same motivation behind [user functions]({{ site.baseurl }}{% link matlab/user_functions.md %}), extended to keep data and the functions that act on it defined together in one place.

## Reading Questions

1. How is a class similar to a structure? How does it go further?
1. What must the filename of a class definition be?
1. What is a constructor, and when does it run?
1. How do you access a property of an object? How do you call one of its methods?
1. If you create two `Rocket` objects, do they share the same `Thrust` value, or does each have its own?
