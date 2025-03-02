---
title: Make a plot
matlab_run_01: matlab/sandbox_plot
---

This page imports and runs an m-file that makes a plot.


This is the input:
```matlab
{% include {{ page.matlab_run_01 }}.m %}
```

This page is located at `{{ page.path }}`.

This is the text output
```text
{% include {{ page.matlab_run_01 }}.diary %}
```

This is the image output:
{% include figure popup=true image_path="/assets/images/figures/matlab/sandbox_plot/Figure_1.png" alt="Example figure" caption="This is an example of using figures." %}

image link: `{{ site.url }}{{ site.baseurl }}/assets/images/figures/matlab/sandbox_plot/Figure_1.png`.

