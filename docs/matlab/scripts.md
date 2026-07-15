---
title: User Scripts
---

A MATLAB script is a text file with the extension `.m` containing a sequence of MATLAB commands.
Scripts can be run from the Command Window, executing the entire sequence in a single step.
Scripts can also contain comments, which is text that MATLAB ignores during execution.
Comments are an excellent way to organize the script, leave notes about the sources of data or formulas, and include metadata about the script.

While scripts themselves are simple plain text files, MATLAB can create PDF files with formatted text, the code, and the outputs of the script.
This process is called publishing the script, and can be useful for completing homework assignments.
MATLAB live scripts work like published scripts, but have the benefit of showing the results instantly - live.

{% capture notice-text %}
## Example: Center of Mass
### Question
{:.no_toc}
The Boeing 737 airliner is made of several components: the empty weight, the crew and equipment, the passengers, the cargo, and the fuel.

1. Given the weights and locations (measured from the nose) of these components, where is the center of mass of the aircraft?
2. When the aircraft runs out of fuel, where will the center of mass be?
3. If the aircraft needs to be ferried to another airport, with no passengers or cargo, where is the center of mass?

| Component             | Mass (kg) | Distance from nose (m)    |
|-----------------------|-----------|---------------------------|
| Empty Weight          | 41,000    | 16.7                      |
| Crew and Equipment    | 340       | 5                         |
| Passengers            | 15,000    | 17.5                      |
| Cargo                 | 1000      | 18.0                      |
| Fuel                  | 20,000    | 13.5                      |

Calculate the answers to these questions using a MATLAB script.
Recall that the center of mass is mass-weighted average distance:

$$ \bar{x} = \frac{\sum_i m_i x_i}{\sum_i m_i} $$


### Solution
{:.no_toc}
In a MATLAB script, the data in the table above are organized into sections with comments.
The three center of mass values are then calculated using the equation above.
The script `center_of_mass_737.m` contains:

```matlab
{% include matlab/center_of_mass_737.m %}
```

Running it in the Command Window produces:

```matlab
>> center_of_mass_737
{% include matlab/center_of_mass_737.diary %}
```

Note that the answers to questions 2 and 3 depend on the `mass_total` and `weighted_sum` variables defined as part of question 1.
This saves time, but if there was an error in the solution to question 1 then it would propagate to 2 and 3.
In this case, however, it is clear that the code is answering the question.
With question 2, for example, the fuel mass contributions are subtracted from the total mass and weighted sum,
which is clearer than if we repeated the sum but without the fuel terms.
{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## Diary
MATLAB includes a built-in function named `diary` that will record your commands from the Command Window. 
If you prefer to work and develop in the Command Window, you can start with `diary on` or `diary <filename>`,
type your commands into the Command Window, then save your work to a file with `diary off`.
For example:

```matlab
>> diary my_commands.diary
>> x = 3;
>> y = x^2

y =

     9

>> z = 2 + y;
>> z = 2 - y;
```

will write to a diary file named `my_commands.diary` that contains:

```matlab
x = 3;
y = x^2

y =

     9

z = 2 + y;
z = 2 - y;
```
This file contains everything, including the printed output from lines missing a `;` at the end.
It also includes mistakes, old versions of commands, etc.
Nonetheless, you can copy paste lines from the diary into a script.

Personally, I start with a script and never use `diary`.
That being said, it is a tool and if you find it helpful please use it.
The MATLAB documentation has more information about [diary](https://www.mathworks.com/help/matlab/ref/diary.html).

## Comments
Comments are text in the script that MATLAB does not interpret as a command.
Everything after the `%` symbol is not interpreted.
This can be at the beginning of the line or in the middle.
For example:

```matlab
% Parachute parameters
chute_mass = 2;  % lbm
chute_area = 32; % m^2, from Table 6 in Chapter 3
```

To create a comment that spans multiple lines, you can either start each line with the `%` symbol or
start the block comment with `%{` and end it with `%}`.
For example:

```matlab
%{

The beam cross section geometry is defined as:

          B ------- D
        / |       / |
       /  |      /  |
      /   |     /   |
     /    |    /    |
    /     |   /     |
   /      |  /      |
  /       | /       |
A ------- C ------- E

%}

len_AC = 12;
len_CE = 15;
len_CB = 10;
```
In this script, the block comments contain a rough sketch of the geometry and provide context for the variable definitions.

Commenting your code is the best habit you can develop while learning to program.
It gives you the opportunity to document what you're doing, why it is being done this way, and where your numbers came from.
You can also use comments like hashtags, then find all instances of that word in your file.
For example:

```matlab
width = 3; %TODO check this value, it was a wild guess
```

In MATLAB you can search for all instances of `%TODO`, which makes a to-do list.
Another common keyword is `%FIXME`, for code you know needs to be fixed but you have not had the time.

Beyond plain `.m` scripts, MATLAB also supports [Publishing Scripts]({{ site.baseurl }}{% link matlab/publishing.md %}) to a formatted PDF and [Live Scripts]({{ site.baseurl }}{% link matlab/live_scripts.md %}) that recalculate results as you type.
Neither is part of this course's lecture schedule, but both pages are there if you want to go further on your own.

## Scripts Within Scripts

Since you can call scripts from the Command Window, and scripts contain commands, it is possible to call a script from within another script.
For example, if I have an engine and want to analyze it to determine its efficiency, I could write a script called `engine_1.m` that contains:

```matlab
% Engine Parameters
T_cold = 300; % Kelvin
T_hot  = 800; % Kelvin

% Efficiency Analysis
analyze_engine;
```
The `analyze_engine.m` script would assume that `T_cold` and `T_hot` are already defined.
It would contain the formula for Carnot efficiency:

```matlab
eff_carnot = (T_hot - T_cold) / T_hot
```

Then if I have a second engine, I could copy/paste `engine_1.m` to `engine_2.m`, update `T_cold` and `T_hot`, then call the same `analyze_engine` script.
This guarantees that I'm using the exact same equation to analyze both engines.
If I want to expand the analysis to include other metrics, I only have to make the changes to the `analyze_engine.m` file.
This enables code reuse and reduces code duplication, which is much easier to maintain.

Another example of reusing code like this would be to run separate analyzes on the same set of inputs.
For example, the design variables of a spacecraft may all be contained in a script called `spacecraft_design.m`.
A stress engineer would run that script to populate the givens for a stress analysis, a thermal engineer would run it to populate the givens for a thermal analysis,
and so on.
Each member of the team can run their own separate analyzes, then when they discuss the results they are all talking about the same design.

While scripting is a necessary aspect of programming in MATLAB, it does have a couple drawbacks.
They are mainly two assumptions: 1) that variables will be named exactly as you expect and 2) that scripts will not redefine any of your variables.
In the case of `analyze_engine.m`, if you use `T_H` instead of `T_hot` then MATLAB will error out.
It will not look for similarly named variables, so if you write `analyze_engine.m` assuming one naming convention and `engine_1.m` assuming another there will be errors.
The second assumption is that the script you call does not redefine or overwrite values in variables you have defined.
For example, if `analyze_engine.m` ended with the line `T_hot=1000;` then any code after `analyze_engine` will use a value of 1000 for `T_hot` instead of 800.
This would be difficult to spot if both scripts defined many variables with similar names.
To keep variable definitions contained and isolated from each other, it is better to write [User Functions]({{ site.baseurl }}{% link matlab/user_functions.md %}).

## Reading Questions

1. What is a MATLAB script?
1. How do you run a MATLAB script from the Command Window?
1. Why are comments useful in MATLAB scripts?
1. What kinds of information are included in comments?
1. Describe two ways to create comments in MATLAB.
1. How can you publish a script to a PDF?
1. Which built-in MATLAB function records activity from the Command Window?
1. What are some advantages to calling scripts from within other scripts?
1. What disadvantages are there to calling scripts within scripts?

## Practice Problem: SLS Liftoff

Not every rocket that reaches the pad actually leaves the ground.
For a rocket to lift off, its engines must produce more thrust than the rocket weighs, otherwise gravity wins and it just sits there.
Engineers describe this margin with the **thrust-to-weight ratio (TWR)**: the engine thrust divided by the rocket's weight.
A TWR greater than 1 means the rocket can lift off; the larger the TWR, the faster it accelerates off the pad.

In this practice problem, you'll write a MATLAB script that calculates the liftoff performance of NASA's Space Launch System (SLS), the rocket behind the Artemis Moon missions.
At liftoff, the SLS's four core engines and two solid rocket boosters produce a combined thrust of 39,100,000 N, and the fully-fueled rocket has a mass of 2,600,000 kg.

### Your Task

Write a script named **`sls_liftoff.m`** that computes the following, using $g = 9.81$ m/s<sup>2</sup> for gravity:

1. `W` - the rocket's weight, in newtons ($W = mg$)
2. `TWR` - the thrust-to-weight ratio (thrust divided by weight)
3. `F_net` - the net upward force at liftoff, in newtons (thrust minus weight)
4. `a` - the rocket's acceleration at liftoff, in m/s<sup>2</sup>, using Newton's second law ($F_{net} = ma$)

Use variables for the given thrust and mass too, rather than typing the numbers directly into each formula. This keeps your script readable and reusable, the same way the center of mass example above does.
Your variable names for the four answers above must match exactly (`W`, `TWR`, `F_net`, `a`) so that the checker below can find them.

### Checking Your Work

Download [check_sls_liftoff.m]({{ site.baseurl }}/assets/practice/matlab/check_sls_liftoff.m) and save it in the *same folder* as your `sls_liftoff.m` script.
Make sure that folder is your Current Folder in MATLAB, then run:

```matlab
>> check_sls_liftoff
```

The checker runs your script and reports whether each of the four values is correct.
This is practice, not a graded assignment. If something doesn't pass, use the feedback to find and fix the issue, then run the checker again.
{: .notice}
