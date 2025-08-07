---
title: Arrays
---

## Static Arrays

A static array in C++ is a collection of elements of the same type,
stored contiguously in memory.
Its size is fixed at compile time and cannot change during program execution.
Its memory is allocated on the stack, which can lead to efficient access but limited flexibility.
Static arrays are ideal for small data sets, where the maximum number of elements is known in advance.
For example, a 3D position vector is known to have 3 elements and will not change in size during execution.

### Declaring and Initializing

To declare a static array, specify the element type, the array name, and its size in square brackets.
For example:

```cpp
int numbers[5];
```

You can initialize the elements at the point of declaration:

```cpp
int primes[5] = {2, 3, 5, 7, 11};
```

If fewer initializers are provided than the array size, the remaining elements are value-initialized to zero.

### Accessing Elements

Use the array subscript operator to access elements.
Valid indices start at zero and run up to size-minus-one.
Accessing values outside this range leads to undefined behavior.

The syntax for accessing elements of an array is `numbers[2]`, which will
retrieve the third element of `numbers`.
To write to an element, the syntax is `numbers[2] = 10;`. 

### Memory Layout

Elements of a static array occupy consecutive memory addresses.
This contiguous storage allows pointer arithmetic and efficient iteration over elements.
For example, consider this static array:

```cpp
int values[5] = {10, 731, 92, 38, 4128};
```

Values of type `int` are stored in 4-byte blocks of memory, consisting of 32 bits total.
If we assume `values` starts at memory address 0x100, and that our computer architecture puts the most-significant bytes first (big-endian), then the computer's memory will look like this:


```
|----------|-------------------------------|
|          |          Bit Number           |
|  Address | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 |
|----------|---|---|---|---|---|---|---|---|
|    0x100 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x101 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x102 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x103 | 0 | 0 | 0 | 0 | 1 | 0 | 1 | 0 |
|----------|-------------------------------|
|    0x104 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x105 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x106 | 0 | 0 | 0 | 0 | 0 | 0 | 1 | 0 |
|    0x107 | 1 | 1 | 0 | 1 | 1 | 0 | 1 | 1 |
|----------|-------------------------------|
|    0x108 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x109 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x10A | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x10B | 0 | 1 | 0 | 1 | 1 | 1 | 0 | 0 |
|----------|-------------------------------|
|    0x10C | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x10D | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x10E | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x10F | 0 | 0 | 1 | 0 | 0 | 1 | 1 | 0 |
|----------|-------------------------------|
|    0x110 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x111 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|    0x112 | 0 | 0 | 0 | 1 | 0 | 0 | 0 | 0 |
|    0x113 | 0 | 0 | 1 | 0 | 0 | 0 | 0 | 0 |
|----------|-------------------------------|
```

You can check that each of the five binary numbers are equal to the decimal integers in the C++ code.
The variable `values` stores the first memory address of the array.
If we want the third element of `values`, we access it with `values[2]`.
This takes the `values` memory address, adds 2 times the number addresses per `int` to that address, then retrieves that value.
There are 4 addresses per `int`, so in this case we add 8 to the address `0x100` to get `0x108`.

Memory addresses are represented in hexidecimal, base 16.
After address 109 comes 10A, followed by 10B, 10C, 10D, 10E, then 10F.
After 10F, we put a 1 in the 16's place and roll over the 1's place with 110.
{: .notice}

### Pros and Cons

Static arrays have their advantages and disadvantages, compared to other ways of storing sequential data in memory.

* Advantages
    - __Performance__: Fast access due to contiguous memory
    - __Memory Management__: No heap allocation overhead
    - __Use Cases__: Small fixed-size collections
* Disadvantages
    - __Performance__: Fixed size at compile time
    - __Memory Management__: Risk of stack overflow for large arrays
    - __Use Cases__: Not suitable for dynamic data


## Reading Questions

1. Write the declaration for a static array of eight `float` values named `measurements`.
1. If I declare a static array like `double x[802105];`, how many contiguous bytes of memory will be allocated for `x`?
1. How would you access the third value of a static array named `data`?
1. Does C++ raise an error if you index beyond the end of an array?
1. Can you get the last value of an array using `end` in C++?
1. Can you `cin` the size of a static array?
