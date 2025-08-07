---
title: Conditionals
---

Conditionals are at the heart of any decision-making logic in C++.
They let your program choose between different courses of action based on runtime data.
In engineering contexts, conditionals map directly to control logic.
If the temperature in the room is too hot, turn on the air conditioning.
If the rocket is above the atmosphere, jettison the payload fairing.
Understanding the syntax and fundamental behavior of conditionals will ensure your code is
correct, efficient, and maintainable.

```cpp
if (altitude_km > 100){
    cout << "We made it to space!" << endl;
}
```

## If Statements

The simplest form of conditional is the `if` statement.
You write `if (condition)` followed by a block of code in braces `{}` that executes only when
the expression `condition` evaluates to true.
In C++, any nonzero value converts to true and zero converts to false.
For example, writing:  
```cpp
if (battery_level <= 15) {
    cout << "Warning, low battery." << endl;
}
```
prints a message only when `battery_level` is 15 or lower.
Always use braces, even for a single statement, to avoid errors when you later add more lines of code.

## If-Else Statements

To split logic into two paths, use `if...else`.
The `if` block runs when the condition is true.
The `else` block runs when it is false.
For example:
```cpp
if (T_gold_degF > 1948) {
    cout << "Gold is liquid." << endl;
} else {
    cout << "Gold is solid." << endl;
}
```

This guarantees that exactly one of the two messages will be printed.
Nesting `if...else` structures can simulate more complex decisions,
but deep nesting can reduce readability if you are not careful.

## Else If

When you need more than two branches,
chain additional tests with `else if`.
The conditions are evaluated in order, and the first true test executes its block
which skips the rest.
For example:
```cpp
if (T_gold_degF > 5137) {
    cout << "Gold is gaseous." << endl;
} else if (T_gold_degF > 1948) {
    cout << "Gold is liquid." << endl;
} else {
    cout << "Gold is solid." << endl;
}
```
Here the program checks if the temperature `T_gold_degF` is greater than 5137.
If it is, it will print the gaseous statement.
If it is not, then it executes the next `if...else` statement, which checks if it is liquid or solid.
In essence, we have nested an `if..else` statement within the first `else`.


## Switch-Case Statements

For discrete values such as integers, the `switch` statement offers a cleaner layout.
You write `switch(expression)` and follow it with `case` labels.
Each `case` ends with a `break` to prevent fall-through:

```cpp
switch (option) {
    case 1:
        cout << "Start\n";
        break;
    case 2:
        cout << "Pause\n";
        break;
    default:
        cout << "Invalid option\n";
}
```

If no `case` label matches the value of `expression`, control transfers to the `default` block.
The `default` case is optional, but highly recommended since it lets you handled unexpected or out-of-range values.

If you omit `break` intentionally, two ore more cases can share a block of code.
This "fall-through" behavior can be useful when multiple values require the same action,
but always comment such omissions clearly to avoid confusion.

Under the hood, many compilers implement `switch` as a jump table when the case values are dense.
This delivers constant-time dispatch, rather than linear search of chained `if..else if` tests.
To keep your code maintainable, group related cases together, use `enum class` for type safety,
and always include a `default` branch.

## Reading Questions

1. When does C++ execute the code inside an `if` statement?
1. Is the code contained by parentheses, square braces, or curly braces?
1. In an `if...else if...else` statement, does the code in the `else` block run if the `else if` condition is true?
1. Which keyword do the code blocks in a `switch...case` statement usually end with?
1. If I had to check whether the value of a variable is equal every integer from 0 to 1023, would the program be faster if it was implemented as an `if...else if...else` statement or a `switch...case` statement?
