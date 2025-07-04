---
title: Plotting
---

In engineering, we visualize the relationship between variables to understand their behavior and to communicate results with our peers.
MATLAB includes several useful tools for creating plots such as line graphs, contour plots, and 3D surfaces.
Knowing how to present your findings is just as valuable as generating them, and plots are one way to present your data.

Visit [Create 2-D Line Plot](https://www.mathworks.com/help/matlab/creating_plots/using-high-level-plotting-functions.html) for the MATLAB Help Center's documentation on creating line plots.

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_robot_traj/Figure_1.png" alt="Robot trajectory" caption="A robot's trajectory with obstacle avoidance." %}

## Basic Plotting

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

## Plotting Multiple Lines

If you want to plot multiple lines on the same plot, you need to use the `hold` command.
For example:

```matlab
{% include matlab/plot_hold.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_hold/Figure_1.png" alt="Basic example plot with two lines" caption="Example of basic plotting, with two lines." %}

If you do not use `hold on`, MATLAB will plot the first line, erase it, and then plot the second line.
The `hold on` command tells MATLAB not to erase the existing plots.
The [hold](https://www.mathworks.com/help/matlab/ref/hold.html) page in the MATLAB Help Center provides more documentation.

Also included in the example above is the `legend` command.
This adds a legend to the plot and provides context for the lines on the plot.
MATLAB attempts to find the best location for the legend, but sometimes it covers up an important feature.
To specify a corner, call the function like `legend(label1, label2, ..., 'Location', 'northwest')`.
The [legend](https://www.mathworks.com/help/matlab/ref/legend.html) page in the MATLAB Help Center provides more documentation.

## Customization

MATLAB contains default colors for plots, but you can customize the appearance of each line on the plot.
The six primary options you can change for a plotted line are:

1. Line color
1. Line type
1. Line width
1. Marker color
1. Marker type
1. Marker size

The line color options are:

| Symbol | Color Name  |
|--------|-------------|
| `'r'`  | Red         |
| `'g'`  | Green       |
| `'b'`  | Blue        |
| `'k'`  | Black       |
| `'m'`  | Magenta     |
| `'c'`  | Cyan        |
| `'y'`  | Yellow      |

You can also use RGB triplets or hexidecimal codes to specify colors.

The line type options are:

|  Symbol  | Description    |
|----------|----------------|
|  `'-'`   | Solid line     |
|  `'--'`  | Dashed line    |
|  `':'`   | Dotted line    |
|  `'-.'`  | Dash-dot line  |
| `'none'` | No line        |

The line width is specified with a number, like `plot(x, y, 'LineWidth', 5)`.
Putting all these together, to create a green dashed line of width 10, we would write `plot(x, y, 'g--', 'LineWidth', 10)`.
We can also specify color and line type separately like this: `plot(x, y, 'Color', 'green', 'LineStyle', '--', 'LineWidth', 10)`.

Just like `x` and `y`, the color, linestyle, and line width can also be variables.
For example, if you have a script that generates many plots you can save the plot colors to variables.
You can also make the line width dependent on variables - so a plot of tire tracks would have thicker lines for car tires and thinner lines for bicycle tracks.
{: .notice}

The color, type, and size of the markers are set in a similar way to the line properties.
For the marker color, use the `MarkerFaceColor` option.
For example, a plot with cyan markers would look like: `plot(x, y, 'MarkerFaceColor', 'cyan')`.
Just like the line color, you can also use RGB or hexidecimal colors for the markers.

The marker type option, `Marker`, can be one of the following:

| Marker       | Description                  |
|--------------|------------------------------|
| `"o"`        | Circle                       |
| `"+"`        | Plus sign                    |
| `"*"`        | Asterisk                     |
| `"."`        | Point                        |
| `"x"`        | Cross                        |
| `"_"`        | Horizontal line              |
| `"|"`        | Vertical line                |
| `"square"`   | Square                       |
| `"diamond"`  | Diamond                      |
| `"^"`        | Upward-pointing triangle     |
| `"v"`        | Downward-pointing triangle   |
| `">"`        | Right-pointing triangle      |
| `"<"`        | Left-pointing triangle       |
| `"pentagram"`| Pentagram                    |
| `"hexagram"` | Hexagram                     |
| `"none"`     | No markers                   |

Lastly, the marker size can be specified with `MarkerSize`.
This option works like `LineWidth`, where you give a number for the size of the marker.
There is no conversion from the units of `x` and `y` to the size of the marker.
Primarily, the size is set by guessing a value, checking if it is too big or small, and adjusting.
Putting it all together:

```matlab
{% include matlab/plot_customized.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_customized/Figure_1.png" alt="Customized plot" caption="Example of plot customization." %}

When choosing colors for plots, there are two things to keep in mind.
First, choose colors that will not fade or look similar if the plot is printed on a black and white printer.
Two colors with the same brightness will be indistinguishable in black and white.
The second thing to keep in mind is that 1 in 20 people are colorblind in some way.
The default MATLAB color palette avoids color confusion.
If you use custom colors, you can check if they would be confused by using online tools such as
[Coloring for Colorblindness](https://davidmathlogic.com/colorblind).
{: .notice}

The [Specify Line and Marker Appearance in Plots](https://www.mathworks.com/help/matlab/creating_plots/specify-line-and-marker-appearance-in-plots.html) in the MATLAB Help Center also covers all the plot style options.

## Setting Axes

When you call `plot(x,y)`, MATLAB automatically scales the axes of the plot to contain all the (x,y) coordinates.
It will also sometimes add some buffer around those limits so the tick marks on the axes are reasonable.
You can control the ranges on the x and y axes, the tick marks, and the labels for those tick marks to improve the plot.

With the previous examples plotting sine and cosine, for example, we should put the x-ticks at fractions of $pi$, rather than at whole numbers of radians.
The script below directly controls both axes of the plot:

```matlab
{% include matlab/plot_axis_controls.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_axis_controls/Figure_1.png" alt="Plot with defined axes" caption="Example plot with defined x and y axes." %}

There is no need to set `yticklabels` in the example above.
Only use `xticklabels` and `yticklabels` if the standard output is not what you want.
The most common use for these are when `x` is a list of dates or times, and you want the tick labels to be formatted as such.
{: .notice}

The MATLAB Help Center has documentation on 
[xlim](https://www.mathworks.com/help/matlab/ref/xlim.html), 
[ylim](https://www.mathworks.com/help/matlab/ref/ylim.html), 
[xticks](https://www.mathworks.com/help/matlab/ref/xticks.html), 
[yticks](https://www.mathworks.com/help/matlab/ref/yticks.html), 
[xticklabels](https://www.mathworks.com/help/matlab/ref/xticklabels.html), and 
[yticklabels](https://www.mathworks.com/help/matlab/ref/yticklabels.html).

## Saving Plots

Once you have formatted the lines, labels, and axes of your plot, you will often want to save that plot as a file.
You can click File > Save or the Save icon in the window, then navigate to where you want to save it, give it a name,
and click save.
For one-off plots this is perfectly fine.
If you want to avoid all of that button clicking and tell MATLAB directly where to save the file,
there is the `saveas` command.
The two required inputes are the figure handle and the filename.
For most applications, the figure handle is the current figure or `gcf` which stands for **g**et **c**urrent **f**igure.
The filename is the name of the image file you want to create.
For example:

```matlab
plot(x, y)
saveas(gcf, 'my_plot.png')
```

Plots are most commonly saved as PNG files.
The JPEG format is also available, but these look worse on screen than PNGs.
You can also save plots as PDFs, which have the best quality but are sometimes harder to use.
In general, saving figures as PNGs is the best option most of the time.

The MATLAB Help Center has documentation on 
[saveas](https://www.mathworks.com/help/matlab/ref/saveas.html).

## Subplots

Figures can contain multiple plots within the same window, known as subplots.
These can be useful for inspecting data that share the same x or y axes, but not both.
First use the `tiledlayout` function to define how many rows and columns of plots there are.
For 3 rows and 2 columns, use `tiledlayout(3,2)`.
To select a subplot (or tile), use the `nexttile` command.
Tiles fill along the rows left-to-right, then top-to-bottom.

When you create a figure this way, in general zooming in on one plot does not affect the axes of the others.
If you want to keep the axes synced, use the `linkaxes` command like `linkaxes([ax1, ax2], 'x')` to link the x axes for example.
This is useful when inspecting multiple signals that vary with time.
If you zoom in to a narrower range in time, you would want all of the other plots to zoom to the same range.
For example:

```matlab
{% include matlab/plot_subplots.m %}
```

{% include figure popup=true image_path="/assets/images/figures/matlab/plot_subplots/Figure_1.png" alt="Figure with subplots" caption="Example figure with subplots." %}

The MATLAB Help Center has documentation on 
[tiledlayout](https://www.mathworks.com/help/matlab/ref/tiledlayout.html), 
[nexttile](https://www.mathworks.com/help/matlab/ref/nexttile.html), and 
[linkaxes](https://www.mathworks.com/help/matlab/ref/linkaxes.html).


## Special Plot Types

### Logarithmic Plots

Logarithmic plots are used when data values span several orders of magnitude.
MATLAB includes three primary functions for logarithmic visualization.
The `semilogx` function applies a logarithmic scale to the x-axis, while `semilogy` applies it to the y-axis.
For plots requiring logarithmic scaling on both axes, use the `loglog` function.
These plots are particularly useful in the frequency domain, such as in acoustics, radio transmission, and control theory.

The MATLAB Help Center has documentation on 
[semilogx](https://www.mathworks.com/help/matlab/ref/semilogx.html), 
[semilogy](https://www.mathworks.com/help/matlab/ref/semilogy.html), and 
[loglog](https://www.mathworks.com/help/matlab/ref/loglog.html).

### Fill

The `fill` function generates filled polygons by specifying vectors of x and y coordinates.
For example, if `x` and `y` are the vertices of a polygon, then `fill(x,y,'r')` will plot that polygon in red.
The `fill` function can also accept RGB and hexidecimal, like `plot`.
You can also assign a unique color to each vertex and MATLAB will blend the colors and create an ombre effect.
Another input to `fill` is `FaceAlpha`, which allows you to set the transparency of the filled polygon.
The `fill` command is often used to specify keep-in or keep-out regions and to emphasize specific regions of a plot.

The MATLAB Help Center has documentation on 
[fill](https://www.mathworks.com/help/matlab/ref/fill.html).


### Bar Chart

Bar charts can be used to represent data with discrete `x` values.
For example, if you have machines in a factory and want to plot the total downtime of each machine, 
that could be represented with a bar chart.
With bar charts, it is especially important to use the `xticklabels` function to label the bars.

The MATLAB Help Center has documentation on 
[bar](https://www.mathworks.com/help/matlab/ref/bar.html).


### Histogram

Histograms display the distribution of numerical data by dividing it into discrete intervals or "bins."
These are especially useful for visualizing probabilistic quantities and statistical data.
To create a histogram in MATLAB, use the `histogram` function.
For example, `histogram(x)` will plot a histogram of the values of `x`.
To specify the number of bins for the histogram, use `histogram(x, n)`.
You can also specify the edges of the histogram bins using `histogram(x, edges)`.

While it may seem like `histogram(x, n)` or `histogram(x, edges)` require extra effort,
they can significantly influence conclusions drawn from the histogram if the number of samples in `x` is low.
With small samples, take care in setting up the bins of the histogram to avoid misinterpretation of the data.
{: .notice}

The MATLAB Help Center has documentation on 
[histogram](https://www.mathworks.com/help/matlab/ref/matlab.graphics.chart.primitive.histogram.html).


### Contour Plots

Contour plots are like terrain height maps, but for any 3D surface.
When height is a function of x and y, a contour plot shows curves of constant height.
This is especially useful for plotting functions of two variables.
The `contour` function is used like `contour(x, y, z)`, where `x` is a vector of length `m`,
`y` is a vector of length `n`, and `z` is a matrix of size `m` x `n`.
The `contourf` function works the same way as `contour`, but it fills between the contour levels.

While contour plots are good for showing the general behavior of a function of two variables, they can be
difficult for reading specific values.
Imagine, for instance, if you received a PNG file with a `contourf` plot in it and you had to determine the z value for a specific (x,y) pair.
You would have to grab the color at those coordinates and compare it to the colorbar - a very inaccurate process.
Alternatively, the same data can be presented with `plot`, where you plot z vs x at multiple values of y ($z=f(x,y_{const.})$).

The MATLAB Help Center has documentation on 
[contour](https://www.mathworks.com/help/matlab/ref/contour.html) and 
[contourf](https://www.mathworks.com/help/matlab/ref/contourf.html).


### Plotting on Maps

MATLAB includes several functions designed for visualizing data in geographical contexts.
The `geoplot` and `geoscatter` functions allow you to plot latitude and longitude coordinates on maps.
You can choose the map style/data using the `geobasemap` function.
These functions are very useful for plotting trajectories/ground tracks relative to features on Earth.

The MATLAB Help Center has documentation on 
[geoplot](https://www.mathworks.com/help/matlab/ref/geoplot.html),  
[geoscatter](https://www.mathworks.com/help/matlab/ref/geoscatter.html), and
[geobasemap](https://www.mathworks.com/help/matlab/ref/geobasemap.html).


### Vector Fields

Vector fields, such as the magnetic field surrounding a magnet, can be plotted in MATLAB with the `quiver` function.
The general inputs to quiver are `quiver(x, y, u, v)`, where `x` and `y` are arrays of the (x, y) coordinates of the *tails* of the vectors, `u` is the x-component, and `v` is the y-component.
The magnitudes of the plotted vectors are scaled, to an appropriate size for the plot.
Quiver plots can be useful for visualizing vector fields, aerodynamic flows, trajectories, and control signals. 

The MATLAB Help Center has documentation on 
[quiver](https://www.mathworks.com/help/matlab/ref/quiver.html).

## Reading Questions

1. Which two inputs are required by the `plot` function?
1. What are 3 ways to customize the output of the `plot` function?
1. Which command allows you to plot more than one line in a figure?
1. How do you add labels to the axes of a figure?
1. How do you add a legend to a plot and specify its location?
1. How would you plot a dotted magenta line with square markers?
1. What two factors should you consider when picking colors for plots?
1. How would you save the current figure to the file "results.png"?
1. How would you create a figure with a row of 4 subplots with linked y axes?
