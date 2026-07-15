---
title: Switch-Case Statements
---

This page is supplemental material - it isn't part of the course's lecture schedule, but is here for anyone curious to go further with [conditionals]({{ site.baseurl }}{% link matlab/conditionals.md %}).

A `switch` statement is an alternative to `if`-`elseif`-`else` for the specific case of comparing one value against several possible exact matches.
Anything a `switch` statement can do could also be written with `if`-`elseif`, but when you're checking a single variable against a list of specific values, `switch` is often easier to read.

The MATLAB Help Center has documentation on
[switch](https://www.mathworks.com/help/matlab/ref/switch.html).

## Syntax

```matlab
switch expression
    case value1
        statements1
    case value2
        statements2
    otherwise
        statements3
end
```

MATLAB evaluates `expression` once, then compares the result against each `case` value in order.
The statements under the first matching case run, and then MATLAB jumps straight to after the `end` keyword - unlike some other languages, MATLAB does **not** fall through to the next case.
If nothing matches, the `otherwise` block runs; like `else`, it's optional.

For example:

```matlab
{% include matlab/switch_case_basics.m %}
```

```matlab
{% include matlab/switch_case_basics.diary %}
```

## Matching Multiple Values in One Case

A single `case` can match more than one value by listing them in curly braces, `{}`.
This is a place where `switch` is noticeably more compact than the equivalent `if`-`elseif`.

{% capture notice-text %}
### Example: Propulsion Type Lookup
#### Question
{:.no_toc}
A database stores each rocket engine's propulsion type as a numeric code: `1` for solid, `2` or `3` for the two liquid-engine variants in use, and `4` for electric.
Write a MATLAB script that converts an engine's code into a readable propulsion type.

#### Solution
{:.no_toc}
Because codes `2` and `3` should both map to `'Liquid'`, we can group them into a single `case` instead of writing two separate cases with identical statements:

```matlab
{% include matlab/switch_case_engine.m %}
```

```matlab
{% include matlab/switch_case_engine.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Strings and Switch

`switch` also works on strings, comparing `expression` against each `case` value with the same rules as [`strcmp`](https://www.mathworks.com/help/matlab/ref/strcmp.html).
This comes up often when a variable represents a named mode or state rather than a number, for example:

```matlab
switch flight_phase
    case 'ascent'
        disp('Throttle for max Q')
    case 'coast'
        disp('Engines off')
    case 'descent'
        disp('Prepare for landing')
end
```

## Reading Questions

1. When is a `switch` statement a better choice than `if`-`elseif`?
1. Does MATLAB's `switch` statement fall through to the next case after a match, like some other languages?
1. How would you write a single `case` that matches either the value `5` or the value `10`?
1. What does the `otherwise` block do, and is it required?
1. Can a `switch` statement compare strings as well as numbers?
