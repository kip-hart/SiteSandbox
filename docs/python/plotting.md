---
title: Plotting with Matplotlib
---

Matplotlib is a third-party library for creating plots, including line graphs, scatter plots, and many other chart types.
It's almost always used together with [NumPy Arrays]({{ site.baseurl }}{% link python/numpy.md %}), since the values being plotted are usually the result of a numeric computation.

The [Using Libraries]({{ site.baseurl }}{% link python/libraries.md %}) page covers importing a library in general; the plotting functions used in this course all come from `matplotlib.pyplot`, almost always imported under the alias `plt`.

The Matplotlib documentation has a [Quick start guide](https://matplotlib.org/stable/users/explain/quick_start.html).

## Basic Line Plot

A minimal plot starts a new figure, plots `y` against `x`, and displays it:

```python
{% include python/plot_basic/main.py %}
```

{% include figure popup=true image_path="/assets/images/figures/python/plot_basic/Figure_1.png" alt="Sine wave plot" caption="Example of a basic line plot." %}

`plt.figure()` starts a new, blank figure; without it, a second `plt.plot()` call later in the same script would draw on top of the first figure instead of starting a new one.
`plt.xlabel`, `plt.ylabel`, and `plt.title` label the plot, and `plt.grid(True)` adds gridlines.
`plt.show()` displays the figure in a window.

## Multiple Series and Legends

Calling `plt.plot()` more than once before `plt.show()` draws multiple lines on the same axes.
A `label` passed to each call, combined with `plt.legend()`, identifies which line is which:

```python
{% include python/plot_legend/main.py %}
```

{% include figure popup=true image_path="/assets/images/figures/python/plot_legend/Figure_1.png" alt="Measured versus predicted altitude plot" caption="Example of multiple series with a legend." %}

The third argument to `plt.plot()`, such as `"b-"` or `"r--"`, is a format string that sets the line's color and style in one short code: `b` and `r` for blue and red, `-` for a solid line and `--` for dashed.

## Scatter Plots

`plt.scatter()` plots individual points rather than a connected line, which is useful for marking specific values on top of a line plot:

```python
{% include python/plot_scatter/main.py %}
```

{% include figure popup=true image_path="/assets/images/figures/python/plot_scatter/Figure_1.png" alt="Altitude profile with a peak point marked" caption="Example of a scatter point marking a value on a line plot." %}

`np.argmax(altitude)` finds the index of the largest value in `altitude`, which is then used to pull the matching `t` and `altitude` values for the scatter point.

## Bar Charts

`plt.bar()` plots a value per category, rather than a value per point along a continuous axis, which suits data like a list of part masses better than a line plot:

```python
{% include python/plot_bar/main.py %}
```

{% include figure popup=true image_path="/assets/images/figures/python/plot_bar/Figure_1.png" alt="Bar chart of part masses" caption="Example of a bar chart." %}

The first argument to `plt.bar()` is the list of category labels, and the second is the list of values, one per category.

## Histograms

`plt.hist()` shows how a set of numeric values is distributed, by grouping them into bins and plotting the count in each bin:

```python
{% include python/plot_hist/main.py %}
```

{% include figure popup=true image_path="/assets/images/figures/python/plot_hist/Figure_1.png" alt="Histogram of simulated gravity readings" caption="Example of a histogram." %}

`bins=20` splits the data's range into 20 equal-width intervals; increasing the number of bins shows finer detail in the distribution's shape, at the cost of a noisier-looking chart.

## Saving a Figure

`plt.savefig()` writes the current figure to an image file instead of (or in addition to) displaying it in a window:

```python
plt.plot(x, y)
plt.savefig("my_plot.png")
```

PNG is the most common format for saving a plot; matplotlib also supports PDF and other formats based on the file extension given.

The Matplotlib documentation has reference pages for
[plot](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.plot.html),
[scatter](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.scatter.html),
[bar](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.bar.html),
[hist](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.hist.html), and
[savefig](https://matplotlib.org/stable/api/_as_gen/matplotlib.pyplot.savefig.html).

## Reading Questions

1. What does `plt.figure()` do, and what happens if you plot twice without calling it a second time?
1. How do you add a legend to a plot with multiple lines?
1. What does the format string `"r--"` specify about a line?
1. What is the difference between `plt.plot()` and `plt.scatter()`?
1. When would a bar chart be a better choice than a line plot?
1. What does increasing the number of bins in `plt.hist()` do to the resulting chart?
1. How would you save the current figure to a file named `results.png`?
