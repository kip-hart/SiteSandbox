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
width = 3; %TODO this value is a wild guess, need to check if it has changed
```
In MATLAB you can search for all instances of `%TODO`, which makes a to-do list.
Another common keyword is `%FIXME`, for code you know needs to be fixed but you have not had the time.

## Publishing
MATLAB scripts are written in plain text `.m` files, which can be difficult to read and
do not contain any of the results from running the script.
Publishing the script converts the plain text to rich text PDFs that are easy to read and contain the results.
With the Boeing 737 example, The comments certainly clarify what the script is doing,
but it would be easier to read as a PDF.
A PDF is also easier to share with someone who does not have MATLAB installed, or does not have time to rerun your script if
it contains slow operations.

To convert a script into a PDF (or other formats), use the `publish` command. For example:

```matlab
publish('center_of_mass_737.m', 'pdf');
```

The PDF produced by this command is [center_of_mass_737.pdf]({{ site.baseurl }}/assets/published/center_of_mass_737.pdf).

<object data="{{ site.baseurl }}/assets/published/center_of_mass_737.pdf" type="application/pdf" width="100%" height="150px">
    <p>Unable to display PDF. <a href="{{ site.baseurl }}/assets/published/center_of_mass_737.pdf">Download it here</a>.</p>
</object>

MATLAB provides more details on the publishing process on their [publish](https://www.mathworks.com/help/matlab/ref/publish.html) page.
For more information on formatting text in the comments, visit [Publishing Markup](https://www.mathworks.com/help/matlab/matlab_prog/marking-up-matlab-comments-for-publishing.html).

## Live Scripts

Live scripts in MATLAB are similar to published scripts, with the primary difference being the results are recalculated live.
This is an interactive experience, where you can adjust the inputs to the script and see the effects on outputs in real time.
More details about live scripts are on the [Create Live Scripts in the Live Editor](https://www.mathworks.com/help/matlab/matlab_prog/create-live-scripts.html) page.

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
The second assumption is that the script you call does not redefine or overwrite values in variables you have defined.
For example, if `analyze_engine.m` ended with the line `T_hot=1000;` then any code after the `analyze_engine` line will use a value of 1000 for `T_hot` instead of 800.
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
