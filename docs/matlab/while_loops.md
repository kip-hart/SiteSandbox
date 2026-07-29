---
title: While Loops
---

A [for loop]({{ site.baseurl }}{% link matlab/for_loops.md %}) is the right tool when you know in advance how many times to repeat something.
Often, though, you want to repeat something until a condition changes, without knowing ahead of time how many passes that will take.
A *while loop* repeats a block of code for as long as a condition remains true, checking that condition before every pass.

The MATLAB Help Center has documentation on
[while](https://www.mathworks.com/help/matlab/ref/while.html).

## Syntax

While loops are created in MATLAB using this syntax:

```matlab
while condition
    code to execute repeatedly ...
end
```

Before each pass through the loop, MATLAB evaluates `condition`.
If it is true, the code inside the loop runs once, then MATLAB checks the condition again.
As soon as the condition is false, the loop ends and execution continues after the `end` keyword.
If the condition is false the very first time it's checked, the code inside the loop never runs at all.

For example, this loop prints the powers of two that are less than 100:

```matlab
{% include matlab/while_loop_powers.m %}
```

```matlab
{% include matlab/while_loop_powers.diary %}
```

Notice that a for loop would be awkward here. We'd need to already know that 2<sup>6</sup>=64 is the last power of two under 100 before writing `for p = 0:6`.
With a while loop, we just state the condition we care about (`value < 100`) and let MATLAB handle the rest.

## For Loops vs. While Loops

Both loops repeat code, but they answer different questions:

* Use a **for loop** when you know the number of iterations ahead of time, such as looping over every element of an array.
* Use a **while loop** when you're repeating something until a condition is met, and you don't know in advance how many passes that will take.

{% capture notice-text %}
### Example: ISS Reboost Interval
#### Question
{:.no_toc}
The International Space Station's orbit slowly decays due to drag from the thin upper atmosphere, so it must be periodically reboosted to a higher altitude.
Suppose the station orbits at 420 km and loses 2 km of altitude per week to drag.
Mission control wants to schedule a reboost before the altitude drops to 400 km.

Write a MATLAB script that determines how many full weeks the station can go before it must be reboosted, and what its altitude will be at that point.

#### Solution
{:.no_toc}

We don't know the number of weeks in advance. That's exactly what we're solving for, so a while loop is the right tool.
The loop keeps subtracting the weekly altitude loss as long as the altitude is still above the reboost threshold, counting how many weeks that takes.

```matlab
{% include matlab/while_loop_iss.m %}
```

```matlab
{% include matlab/while_loop_iss.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Avoiding Infinite Loops

A while loop only stops when its condition becomes false.
If nothing inside the loop ever changes the variables the condition depends on, the condition stays true forever and the loop never ends.
This is called an *infinite loop*, and it's one of the most common bugs when first learning while loops.

In the ISS example above, `altitude` decreases by `decay_per_week` on every pass - eventually making `altitude > reboost_threshold` false.
If that update line were accidentally left out, the condition would never change and MATLAB would loop forever.

If you accidentally run an infinite loop in MATLAB, press `Ctrl+C` in the Command Window to stop execution.
Before running a while loop for the first time, double check that something inside the loop moves the condition toward being false.
{: .notice--warning}

## Reading Questions

1. What is the main difference between a for loop and a while loop?
1. When does MATLAB check a while loop's condition - before each pass, after each pass, or both?
1. What happens if a while loop's condition is false the first time it is checked?
1. What causes an infinite loop, and how do you stop one that is already running?
1. Would a for loop or a while loop be better suited to summing numbers typed in by a user until they type 0? Why?

## Practice Problem: Engine Spool-Up Time

Before a jet engine can produce useful thrust, its core has to spool up from a standstill to idle speed.
How long that takes isn't known ahead of time. It depends on how fast the core accelerates, which makes this a natural fit for a while loop.

In this practice problem, you'll write a MATLAB script that finds how long a jet engine takes to reach idle.

### Your Task

Write a script named **`engine_spoolup.m`** that starts from the given starting conditions:

```matlab
n2 = 0; % percent, core speed at the start
spool_rate = 3.2; % percent per second
idle_threshold = 56; % percent
```

Using a while loop that increases `n2` by `spool_rate` on each pass, compute:

1. `seconds` - the number of seconds it takes for `n2` to reach or exceed `idle_threshold`
2. `n2_final` - the value of `n2` once the loop stops

Your variable names for the two answers above must match exactly (`seconds`, `n2_final`) so that the checker below can find them.

### Checking Your Work

Download [check_engine_spoolup.m]({{ site.baseurl }}/assets/practice/matlab/check_engine_spoolup.m) and save it in the *same folder* as your `engine_spoolup.m` script.
Make sure that folder is your Current Folder in MATLAB, then run:

```matlab
>> check_engine_spoolup
```

The checker runs your script and reports whether each of the two values is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
