---
title: Plotting
---

In engineering, we visualize the relationship between variables to understand their behavior and to communicate results with our peers.
MATLAB includes several useful tools for creating plots such as line graphs, contour plots, and 3D surfaces.
Knowing how to present your findings is just as valuable as generating them, and plots are one way to present your data.

Visit [Create 2-D Line Plot](https://www.mathworks.com/help/matlab/creating_plots/using-high-level-plotting-functions.html) for the MATLAB Help Center's documentation on creating line plots.

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_robot_traj/Figure_1.png" alt="Robot trajectory" caption="A robot's trajectory with obstacle avoidance." %}

## Basic Plotting

To begin plotting in MATLAB, start with the `plot(x, y)` command, which creates a two-dimensional line graph of data. Here, `x` and `y` are arrays of the same length that represent paired data points—such as time and displacement, or pressure and temperature. MATLAB automatically scales the axes to fit your data, but you can manually adjust them using `xlim` and `ylim` if needed. After generating a plot, it’s a good habit to label the axes using `xlabel('Time (s)')` and `ylabel('Position (m)')`, and to give your graph a clear title using `title('Position Over Time')`. These enhancements make your plot easier to interpret for both yourself and your classmates.

The built-in function `plot` creates line plots and takes two inputs: an array of x values and an array of y values.
These arrays must be the same length, so there is one y value for each x value.
For example:

```matlab
{% include matlab/plot_basic.m %}
```

Creates a new window containing this plot:

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_basic/Figure_1.png" alt="Basic example plot" caption="Example of basic plotting." %}

While the above plot shows y vs x in a plot, it is missing axis labels.
To add labels to the axes, use the `xlabel` and `ylabel` commands.
The `title` command will add a title to the top of the plot.
Lastly, you can add gridlines to the plot using `grid('on')`. 
For example:

```matlab
{% include matlab/plot_basic_labeled.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_basic_labeled/Figure_1.png" alt="Basic example plot with labels" caption="Example of basic plotting, with labels." %}


The MATLAB Help Center has documentation of the [plot](https://www.mathworks.com/help/matlab/ref/plot.html) command.

## Customization

## Setting Axes

## Saving Plots

## Subplots

## Special Plot Types

## Reading Questions


