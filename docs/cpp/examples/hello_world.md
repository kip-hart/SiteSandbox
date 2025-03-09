---
title: Hello World
src: hello_world/
src_01: hello_world.cpp
---

```cpp
{% include {{ site.cpp_dir }}{{ page.src }}{{ page.src_01 }} %}
```

The output from compiling this file and running its executable is:
```text
{% include {{ site.cpp_dir }}{{ page.src }}screen_output.log %}
```