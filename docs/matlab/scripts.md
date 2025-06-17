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
### Example: Center of Mass
#### Question
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


#### Solution
{:.no_toc}
In a MATLAB script, the data in the table above are organized into sections with comments.
The three center of mass values are then calculated using the equation above.
The script `center_of_mass_737.m` contains:

```matlab
{% include matlab/center_of_mass_737.m %}
``

Running it in the Console Window produces:

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

## Comments

## Publishing

## Live Scripts

## Scripts Within Scripts

## Reading Questions
