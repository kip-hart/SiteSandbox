---
title: Make a plot
matlab_run_01: matlab/sandbox_plot
---

This page imports and runs an m-file.


This is the input:
```matlab
{% include {{ page.matlab_run_01 }}.m %}
```

This page is located at `{{ page.path }}`.

This is the text output
```text
{% include {{ page.matlab_run_01 }}.diary %}
```

This is the image output
![alt]({{ site.url }}{{ site.baseurl }}/assets/images/figures/sandbox_plot/Figure_1.png)

