---
title: While Loops
---

A [for loop]({{ site.baseurl }}{% link python/for_loops.md %}) is the right tool when you know in advance how many times to repeat something.
Often, though, you want to repeat something until a condition changes, without knowing ahead of time how many passes that will take.
A *while loop* repeats a block of code for as long as a condition remains true, checking that condition before every pass.

The Python documentation has a guide on [while Statements](https://docs.python.org/3/reference/compound_stmts.html#the-while-statement).

## Syntax

While loops are created in Python using this syntax:

```python
while condition:
    code to execute repeatedly ...
```

Before each pass through the loop, Python evaluates `condition`.
If it is true, the code inside the loop runs once, then Python checks the condition again.
As soon as the condition is false, the loop ends and execution continues with whatever comes after it.
If the condition is false the very first time it's checked, the code inside the loop never runs at all.
As with `if` statements and `for` loops, the loop body is marked by indentation, and the colon `:` at the end of the `while` line is required.

For example, this loop prints the powers of two that are less than 100:

```python
{% include python/while_loop_powers/main.py %}
```
```text
{% include python/while_loop_powers/screen_output.log %}
```

Notice that a for loop would be awkward here - we'd need to already know that 2<sup>6</sup>=64 is the last power of two under 100 before writing `for p in range(7):`.
With a while loop, we just state the condition we care about (`value < 100`) and let Python handle the rest.

## For Loops vs. While Loops

Both loops repeat code, but they answer different questions:

* Use a **for loop** when you know the number of iterations ahead of time, such as looping over every element of a list.
* Use a **while loop** when you're repeating something until a condition is met, and you don't know in advance how many passes that will take.

{% capture notice-text %}
### Example: ISS Reboost Interval
#### Question
{:.no_toc}
The International Space Station's orbit slowly decays due to drag from the thin upper atmosphere, so it must be periodically reboosted to a higher altitude.
Suppose the station orbits at 420 km and loses 2 km of altitude per week to drag.
Mission control wants to schedule a reboost before the altitude drops to 400 km.

Write a Python script that determines how many full weeks the station can go before it must be reboosted, and what its altitude will be at that point.

#### Solution
{:.no_toc}

We don't know the number of weeks in advance - that's exactly what we're solving for - so a while loop is the right tool.
The loop keeps subtracting the weekly altitude loss as long as the altitude is still above the reboost threshold, counting how many weeks that takes.

```python
{% include python/while_loop_iss/main.py %}
```
```text
{% include python/while_loop_iss/screen_output.log %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Avoiding Infinite Loops

A while loop only stops when its condition becomes false.
If nothing inside the loop ever changes the variables the condition depends on, the condition stays true forever and the loop never ends.
This is called an *infinite loop*, and it's one of the most common bugs when first learning while loops.

In the ISS example above, `altitude` decreases by `decay_per_week` on every pass, eventually making `altitude > reboost_threshold` false.
If that update line were accidentally left out, the condition would never change and Python would loop forever.

If you accidentally run an infinite loop in Python, press `Ctrl+C` in the VS Code terminal to stop execution.
Before running a while loop for the first time, double check that something inside the loop moves the condition toward being false.
{: .notice--warning}

## Reading Questions

1. What is the main difference between a for loop and a while loop?
1. When does Python check a while loop's condition - before each pass, after each pass, or both?
1. What happens if a while loop's condition is false the first time it is checked?
1. What causes an infinite loop, and how do you stop one that is already running?
1. Would a for loop or a while loop be better suited to summing numbers typed in by a user until they type 0? Why?
