---
title: Error Handling
---

So far, when something has gone wrong in a script, MATLAB has stopped and printed an error.
That default behavior is often exactly what you want while developing a script, but sometimes you want more control: a script that checks its own inputs and fails with a clear message, or one that keeps going after something unexpected happens instead of crashing outright.
This page covers throwing and catching errors, issuing warnings, checking for `NaN` and `Inf`, and configuring MATLAB to pause automatically when any of these happen.

The MATLAB Help Center has a guide on [Errors and Warnings](https://www.mathworks.com/help/matlab/errors-and-warnings.html).

## Throwing Errors

The `error` function stops execution immediately and displays a message.
Its syntax works like `fprintf`, accepting a format string with values substituted in:

```matlab
error('Altitude cannot be negative, got %d ft.', altitude)
```

If this line runs, the script stops right there. Nothing after it executes, unless the error is caught (see below).
Errors can also be given an *identifier*, a short `component:mnemonic` label that comes before the message, which makes a specific error easier to catch or look up later:

```matlab
error('InvalidInput:altitude', 'Altitude cannot be negative, got %d ft.', altitude)
```

The MATLAB Help Center has documentation on
[error](https://www.mathworks.com/help/matlab/ref/error.html).

## Catching Errors

A `try`-`catch` block lets a script recover from an error instead of stopping:

```matlab
try
    statements
catch ME
    recovery statements
end
```

MATLAB runs `statements`. If one of them throws an error, execution jumps immediately to `catch`, and `ME` is set to an object describing what happened.
`ME.message` is the error message, and `ME.identifier` is its identifier (empty if the error didn't set one).
If nothing in `statements` throws an error, the `catch` block is skipped entirely.

{% capture notice-text %}
### Example: Guarding Against a Bad Mass Reading
#### Question
{:.no_toc}
A script computes a rocket's thrust-to-weight ratio from its thrust and mass.
If a sensor glitch reports a mass of zero, dividing by its weight (which would also be zero) produces `Inf` instead of a useful number, silently propagating a bad value through the rest of the script.

Write a MATLAB script that checks for a non-positive mass before computing anything, and reports a clear error message instead of letting `Inf` slip through.

#### Solution
{:.no_toc}

```matlab
{% include matlab/error_twr_guard.m %}
```
```matlab
{% include matlab/error_twr_guard.diary %}
```

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Warnings

The `warning` function prints a message but, unlike `error`, does not stop execution.
Use it when something looks wrong but the script can reasonably continue, often by falling back to a default value:

```matlab
{% include matlab/error_warning.m %}
```
```matlab
{% include matlab/error_warning.diary %}
```

By default, a warning also prints which line triggered it. `warning('off', 'backtrace')` turns that off, leaving just the message.
Warnings can be disabled entirely with `warning('off', 'all')` and re-enabled with `warning('on', 'all')`, though it's usually better to fix what's causing the warning than to silence it.

The MATLAB Help Center has documentation on
[warning](https://www.mathworks.com/help/matlab/ref/warning.html).

## NaN and Inf

Some operations don't have a defined numeric result.
Dividing zero by zero produces `NaN` (Not a Number), and dividing a nonzero number by zero produces `Inf` or `-Inf`.
Neither of these throws an error or a warning on its own, which means they can silently work their way through the rest of a calculation unless you check for them.
The `isnan` and `isinf` functions test for exactly this:

```matlab
{% include matlab/error_naninf.m %}
```
```matlab
{% include matlab/error_naninf.diary %}
```

The MATLAB Help Center has documentation on
[isnan](https://www.mathworks.com/help/matlab/ref/double.isnan.html) and
[isinf](https://www.mathworks.com/help/matlab/ref/double.isinf.html).

## Breakpoints and Pausing on Errors

A breakpoint pauses execution at a specific line, so you can inspect variables in the Workspace before continuing.
To set one, click the gray area to the left of the line number in the Editor; a red dot appears, and running the script will pause right before that line runs.
Click the red dot again to clear it.

Instead of picking a specific line, you can also tell MATLAB to pause automatically whenever an error, a warning, or a `NaN`/`Inf` occurs anywhere in your code.
In the Editor, open the **Debugger** panel (**Editor** tab &rarr; **Analyze** section &rarr; **Debugger**), and under **Breakpoints** choose **Pause on Errors**, **Pause on Warnings**, or **Pause on NaN or Inf**.
The same options are available from the Command Window with `dbstop if error`, `dbstop if warning`, and `dbstop if naninf`, respectively.
Use `dbclear all` to turn all of these back off.

Pausing on errors is especially useful for a bug that's otherwise hard to reproduce: rather than guessing where things went wrong from the error message alone, MATLAB stops mid-script with every variable exactly as it was at the moment of the error.

The MATLAB Help Center has documentation on
[dbstop](https://www.mathworks.com/help/matlab/ref/dbstop.html).

## Reading Questions

1. What is the difference in behavior between `error` and `warning`?
1. What does `ME.message` contain inside a `catch` block? What about `ME.identifier`?
1. If nothing inside a `try` block throws an error, does the `catch` block run?
1. What value does `0/0` produce in MATLAB? What about `1/0`?
1. Which functions check whether a value is `NaN` or `Inf`?
1. How do you set a breakpoint at a specific line in the MATLAB Editor?
1. How would you configure MATLAB to automatically pause whenever a warning occurs, without setting a breakpoint at a specific line?
