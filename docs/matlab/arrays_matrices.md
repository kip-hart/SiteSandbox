---
title: Arrays and Matrices
---

In engineering, we often collect and analyze data in bulk—multiple sensor readings, loads across structural elements, or temperatures over time.  
In MATLAB, **arrays and matrices are the foundational tools** for storing and manipulating grouped data efficiently.

The MATLAB documentation on [array basics](https://www.mathworks.com/help/matlab/numeric-types.html) offers more in-depth information, but this page provides a structured starting point.

## Arrays in MATLAB

A one-dimensional array stores a list of values of the same type—such as measured wind speeds at different times:

```matlab
wind_speed = [3.2, 4.8, 5.5, 4.2, 6.1];  % in m/s
```

Each value is indexed starting at 1, and you can access or modify values using parentheses:

```matlab
second_reading = wind_speed(2);     % Retrieves 4.8
wind_speed(4) = 4.5;                % Update the 4th reading
```

Arrays can be used directly in calculations or statistical functions:

```matlab
avg_speed = mean(wind_speed);       % Calculates the average wind speed
```

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

## Example: Wind Turbine Efficiency

### Question
Given torque (Nm) and power output (W) data for a small wind turbine, calculate the rotational speed (in rad/s) for each time step using the formula:

$$P = \tau \cdot \omega \quad \Rightarrow \quad \omega = \frac{P}{\tau}$$

Where:
- \( P \) is power in watts  
- \( \tau \) is torque in newton-meters  
- \( \omega \) is rotational speed in rad/s

### Solution

You can calculate the rotational speed by performing element-wise division of the power and torque values:

```matlab
% Torque (Nm) and Power (W) data
performance = [
    4.1,   75;
    4.3,   82;
    4.0,   78;
    4.5,   89;
    4.2,   85
];

% Extract the torque and power columns
torque = performance(:,1);
power = performance(:,2);

% Calculate rotational speed (rad/s) for each measurement
omega = power ./ torque;
```

Running this code produces:

```matlab
omega =

   18.2927
   19.0698
   19.5000
   19.7778
   20.2381
```

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
