---
title: Arrays and Matrices
---

While structures allow us to organize data with fields associated to values, we often need to organize data in arrays.
Arrays can be lists, lists of lists, lists of lists of lists, and so on.
Lists of lists are often referred to as matrices.
Non-matrix data would include data tables, such as recording pressure and temperature at different times.
In MATLAB, **arrays and matrices store ordered data** which is especially useful for computing matrix/vector operations and for storing measured data.

Visit [Matrices & Arrays](https://www.mathworks.com/help/matlab/learn_matlab/matrices-and-arrays.html) in the MATLAB Help Center for their documentation.

## Arrays in MATLAB
To create an array in MATLAB, enclose the elements of the array with square brackets, `[]`, and separate the elements with commas, `,`.
The commas are optional, you can just leave spaces between them and MATLAB will interpret that as separate elements, however the commas improve readability.
See the examples below for how to create arrays.
Can you tell how many elements there are in `formulas` when there are no commas?

```matlab
speed_measurements = [1338 1657 1892 1771 1601 1548];
speed_measurements = [1338, 1657, 1892, 1771, 1601, 1548];

formulas = [m*x + b e - m * c^2 rho * R * T];
formulas = [m*x + b, e - m * c^2, rho * R * T]; 
```

The [Constructing a Matrix of Data](https://www.mathworks.com/help/matlab/math/creating-and-concatenating-matrices.html#OverviewCreatingAndConcatenatingExample-1) section of the MATLAB Help Center
also describes creating arrays.

### Accessing Array Elements
When an array is defined in the workspace, you can access individual values in the array using the parentheses, `()`.
The *index* of the first element in the array is 1, the second is 2, and so on.
You can access the *last* element of an array using the index `end`, no matter how long it is.
The second to last element is `end-1`, third to last is `end-2`, and so on.
For example:

```matlab
speed_measurements = [1338, 1657, 1892, 1771, 1601, 1548];
first_speed = speed_measurements(1)
second_speed = speed_measurements(2)
last_speed = speed_measurements(6)
last_speed = speed_measurements(end)
second_to_last = speed_measurements(end-1)
```

As seen in this example, the special `end` index is not necessary if you know how many elements are in the list.
If you are writing code that needs to work on lists with different lengths, then using `end` makes your intention clearer.

You can also index into an array with an *array of indices*.
These indices must be whole numbers, but can include the `end` index.
To specify a range of indices, use the `:` operator like `<start>:<stop>`.
If you want to increment in larger steps, you can use `<start>:<step>:<stop>`.
For example:

```matlab
speed_measurements = [1338, 1657, 1892, 1771, 1601, 1548];
first_and_last = speed_measurements([1, end])
first_two = speed_measurements([1, 2])
first_two = speed_measurements(1:2)
three_onward = speed_measurements(3:end)
odd_indices = speed_measurements(1:2:end)
```

You can also access array elements with a *logical mask*.
This is an array of 0s and 1s that has the same length as the array you are indexing.
They can be valuable when you want to isolate a specific part of an array or filter out irrelevant data.
For example, if you conduct a test and start the data recorder for several seconds before the test begins, you would want to *mask* those recordings out of your analysis.
Continuing with the `speed_measurements` example:

```matlab
speed_measurements = [1338, 1657, 1892, 1771, 1601, 1548];
peak_mask = speed_measurements > 1650
peak_measurements = speed_measurements(peak_mask)
```

The [Array Indexing](https://www.mathworks.com/help/matlab/learn_matlab/array-indexing.html) page in the MATLAB Help Center also describes indexing into arrays.

### Extending Arrays

To add a value onto the end of an existing array, there are four options:

```matlab
speed_measurements = [1338, 1657, 1892, 1771, 1601, 1548];
speed_measurements(7) = 1438
speed_measurements(end+1) = 1412
speed_measurements = [speed_measurements 1400]
speed_measurements(12) = 20
```

The first specifies the index of where to place the new entry.
It assumes the length of the array and goes 1 further than the length.
The second makes it clear that the new element is going directly after the end of the array.
The third uses array building, where we create a new array that has the elements of the old followed by a new element, then assign that array to the same variable name.
This method also works to append multiple values to the end of the array, and for adding values to the beginning like `[1400 speed_measurements]`.
In the last method, the value is added to an index far off the end of the array.
MATLAB *pads* the array with 0s between the end of the original array and the new index.

### Column Vectors
The arrays above are technically *row vectors* in that they are a single row with $n$ columns.
MATLAB can also store data in *column vectors* using `;` to separate the rows instead of `,` separating the columns.
For example:

```matlab
row_vec = [1, 2, 3]
col_vec = [1; 2; 3]
```

### Array Arithmetic
Basic arithmetic operations can be performed on arrays.
Add and subtract are accomplished with `+` and `-`.
Multiplication and division are accomplished with `.*` and `./`.
Those `.` are important because they indicate that `*` and `/` should be done elementwise - multiply the first element of the array on the left with the first element of the array on the right, and the same for the second elements, and so on.
With vectors there is the dot product, cross product, and matrix/vector multiplication, so to be specific about multiplying elementwise we use `.*`.
Exponents follow the same pattern with `.^`.
For example:

```matlab
% E_total = 1/2*m*v^2 + m*g*h
masses  = [100, 150, 60]; % slug
speeds  = [ 40,  23, 90]; % ft/s
heights = [  0,  20, 50]; % ft
g = 32.2; % ft/s^2

E_kinetic = 0.5 * masses .* speeds.^2
E_potential = masses * g .* heights
E_total = E_kinetic + E_potential
```

MATLAB has *vectorized* these operations, meaning that adding two lists of 10,000 numbers takes the same amount of time to compute as adding two numbers.
This is tremendously powerful and enables personal computers to solve relatively complex numerical models in a reasonable amount of time.

### Vector Math

MATLAB has several functions that operate specifically on arrays or vectors.
The following functions operate on a single array:

| Function | Description                       | MATLAB Help Center                                                     |
| -------- | --------------------------------- | ---------------------------------------------------------------------- |
| flip     | Reverse the elements in an array  | [flip](https://www.mathworks.com/help/matlab/ref/flip.html)            |
| length   | Length of largest array dimension | [length](https://www.mathworks.com/help/matlab/ref/double.length.html) |
| max      | Largest value in array            | [max](https://www.mathworks.com/help/matlab/ref/double.max.html)       |
| mean     | Mean or average value in array    | [mean](https://www.mathworks.com/help/matlab/ref/double.mean.html)     |
| median   | Median value of an array          | [median](https://www.mathworks.com/help/matlab/ref/double.median.html) |
| min      | Minimum value of an array         | [min](https://www.mathworks.com/help/matlab/ref/double.min.html)       |
| norm     | Vector norm of array              | [norm](https://www.mathworks.com/help/matlab/ref/norm.html)            |
| prod     | Product of all values in array    | [prod](https://www.mathworks.com/help/matlab/ref/double.prod.html)     |
| sort     | Sort array in ascending order     | [sort](https://www.mathworks.com/help/matlab/ref/double.sort.html)     |
| std      | Standard deviation of array       | [std](https://www.mathworks.com/help/matlab/ref/double.std.html)       |
| sum      | Total of all values in array      | [sum](https://www.mathworks.com/help/matlab/ref/double.sum.html)       |

These function operate on multiple arrays:

| Function   | Description                  | MATLAB Help Center                                            |
| ---------- | ---------------------------- | ------------------------------------------------------------- |
| dot(a,b)   | Dot product of two vectors   | [dot](https://www.mathworks.com/help/matlab/ref/dot.html)     |
| cross(a,b) | Cross product of two vectors | [cross](https://www.mathworks.com/help/matlab/ref/cross.html) |


## Matrices in MATLAB

A matrix is a two-dimensional array consisting of rows and columns. Suppose we collect torque and power output from a small wind turbine over several time intervals:

```matlab
% Columns: [Torque (Nm), Power (W)]
performance = [
    4.1,   75;
    4.3,   82;
    4.0,   78;
    4.5,   89;
    4.2,   85
];
```

Each row represents a time snapshot, and each column corresponds to a different measurement.

You can access parts of a matrix like this:

```matlab
third_power_output = performance(3,2);  % Retrieves 78 W from the third row, second column
all_torque = performance(:,1);         % Retrieves the entire torque column as a vector
```

Matrix operations—such as transposition, multiplication, or solving equations—are central to many engineering problems.

## Operating on Whole Arrays and Matrices

MATLAB makes it simple to perform operations on entire arrays or columns in a matrix without handling items one at a time. For example, to convert all power outputs from watts to kilowatts, you can write:

```matlab
power_kW = performance(:,2) / 1000;  % Divides every element in the second column by 1000
```

This approach lets you perform calculations on all elements in a single step.

{% capture notice-text %}
## Example: Wind Turbine Efficiency
### Question
{:.no_toc}
Given torque (Nm) and power output (W) data for a small wind turbine, calculate the rotational speed (in rad/s) for each time step using the formula:

$$P = \tau \cdot \omega \quad $$

Where:
- ( $P$ ) is power in watts  
- ( $\tau$ ) is torque in newton-meters  
- ( $\omega$ ) is rotational speed in rad/s

The table data is the same as above:

```matlab
% Torque (Nm) and Power (W) data
performance = [
    4.1,   75;
    4.3,   82;
    4.0,   78;
    4.5,   89;
    4.2,   85
];
```

### Solution
{:.no_toc}
You can calculate the rotational speed by performing element-wise division of the power and torque values:

```matlab
{% include matlab/arrays_torque.m %}
```

Running this code produces:

```matlab
{% include matlab/arrays_torque.diary %}
```

{% endcapture %}

<div class="notice--info">{{ notice-text | markdownify }}</div>

## Creating Arrays with a Known Size

When you already know the size of the data you need, MATLAB allows you to create an array filled with zeros. This is useful when you plan to fill in data later:

```matlab
n = 1000;
rpm_data = zeros(n,1);   % Creates a 1000x1 column vector initialized with zeros
```

This method helps MATLAB prepare space for your data efficiently.

## Reading Questions

1. What is the difference between a one-dimensional array and a matrix in MATLAB?
2. How do you access the second element of an array?
3. What command retrieves an entire column from a matrix?
4. How can you perform a calculation on all elements of an array or matrix at once?
5. What does the `./` operator do in a MATLAB expression?
6. How does creating an array using `zeros(n,1)` help when you know the required size of the array?
