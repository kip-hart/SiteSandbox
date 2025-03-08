---
title: Hello World
permalink: /cpp/hello_world
src: hello_world/
src_01: hello_world.cpp
---

This page imports and runs a C++ file.


This is the input:
```cpp
{% include {{ site.cpp_dir }}{{ page.src }}{{ page.src_01 }} %}
```

This page is located at `{{ page.path }}`.

This is the output
```text
{% include {{ site.cpp_dir }}{{ page.src }}screen_output.log %}
```