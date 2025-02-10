---
title: Run an m-file
permalink: /matlab/sandbox/run/
matlab_run_01: sandbox_script
---

This page imports and runs an m-file.


This is the input:
```matlab
{% include_relative {{ page.matlab_run_01 }}.m %}
```

This page is located at `{{ page.path }}`.

This is the output
```text
{% include_relative ../tmp/matlab/{{ page.matlab_run_01 }}.diary %}
```
