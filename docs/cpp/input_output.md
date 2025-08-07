---
title: Basic Input/Output
---

C++ uses streams for reading from and writing to various sources including the console.
The most common streams for console I/O are `cin` for input and `cout` for output.

## Include iostream

All input and output stream objects are defined in the `iostream` header file.
To use `cin` and `cout`, add the following directive to the top of your program:

```cpp
#include <iostream>
```

To format numeric output, such as controlling the number of decimal places, you can also
include the `iomanip` header:

```cpp
#include <iomanip>
```

This gives access to manipulators like `setprecision`,
which controlls how many digits appear after the decimal point.
You can then qualify the stream objects with the `std` namespace.

Visit [\<iostream\>](https://cplusplus.com/reference/iostream/) and [\<iomanip\>](https://cplusplus.com/reference/iomanip/) to learn more about these libraries.

## Output with cout

The `cout` object represents the standard output stream.
Data is sent to `cout` using the insertion operator, `<<`.
You can chain multiple insertion operations to build complex output:

```cpp
int age = 21;
cout << "Age: " << age << "\n";
```

By default, insert does not add a newline character at the end.
You can use `\n` or the manipulator `endl` to terminate the line and flush the stream.

To specify the precision of the output value, use `setprecision`.
For example:

```cpp
{% include cpp/setprecision/print_pi.cpp %}
```
Prints this line:

```text
{% include cpp/setprecision/screen_output.log %}
```

## Input with cin

The `cin` object represents the standard input stream.
Data is read from `cin` using the extraction operator, `>>`.
The `cin` object skips leading whitespace when reading into a variable:

```cpp
int number;
cout << "Enter a number: ";
cin >> number;
```

Extraction stops at the first whitespace that cannot be part of the target type.
You can chain extractions just like insertions.


{% capture notice-text %}
## Example: Echo Program
### Question
{:.no_toc}

Write a C++ source file that prompts the user to enter their name, then says hello to them using their name.

### Solution
{:.no_toc}

To prompt the user for their name, we first `cout` a prompt.
Next, we `cin` their name and save it to a `string` variable.
Finally, we `cout` the words hello and their name.

```cpp
// echo.cpp

#include <iostream>
using namespace std;

int main() {
    cout << "Enter your name: ";
    string name;
    cin >> name;
    cout << "Hello, " << name << "!" << endl;
    return 0;
}
```

Compiling and running this in the terminal, for example:

```
> g++ echo.cpp -o echo
> ./echo
Enter your name: Kip
Hello, Kip!
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Reading Questions

1. Which header file is required to use `cin` and `cout`?
1. Which namespace is required to use `cin` instead of `std::cin`?
1. What do the insertion and extraction operators do?
1. What is the difference between `\n` and `endl`?
1. Write a line that prints "The value of x is: " and the value of `x`.
1. What would the echo program do if the input was `Dr. Hart`?
1. Which header must be included to use `setprecision`?
