---
title: File Input/Output
---

Reading and writing files lets a script work with data that already exists, or that needs to persist after the script finishes.
This page covers writing a text file, reading one back in several ways, and parsing its contents into usable values.

The Python documentation has a guide on [Reading and Writing Files](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files).

## Writing a Text File

The built-in `open()` function opens a file, and `with` closes it automatically once the indented block finishes, even if an error happens inside it.
Always prefer `with` over calling a file's `.close()` method manually:

```python
{% include python/file_write/main.py %}
```
```text
{% include python/file_write/screen_output.log %}
```

The second argument to `open()`, `"w"`, means write mode.
It creates the file if it doesn't exist, and overwrites it completely if it does.

### Writing Several Lines at Once

`.writelines()` writes a list of strings in one call, instead of one `.write()` call per line:

```python
{% include python/file_writelines/main.py %}
```
```text
{% include python/file_writelines/screen_output.log %}
```

Unlike `print()`, `.writelines()` does not add a newline between entries. Each string in the list needs its own trailing `\n`, as shown above.

## Reading a File

### Reading the Entire File at Once

Opening a file with `"r"` (read mode) and calling `.read()` returns its entire contents as a single string:

```python
{% include python/file_read_all/main.py %}
```
```text
{% include python/file_read_all/screen_output.log %}
```

### Reading Line by Line

For a large file, reading it all at once can use a lot of memory.
Looping over the open file object directly reads it one line at a time instead:

```python
{% include python/file_read_lines/main.py %}
```
```text
{% include python/file_read_lines/screen_output.log %}
```

`repr(line)` is used here only to make the trailing `\n` at the end of each line visible.
A plain `print(line)` would also work, just with an extra blank line between each one.

## Parsing Fields with strip() and split()

Each line read from a file keeps its trailing newline, and a line of comma-separated data still needs to be broken into individual fields.
`.strip()` removes the newline, and `.split(",")` breaks the result into a list of fields:

```python
{% include python/file_parse_fields/main.py %}
```
```text
{% include python/file_parse_fields/screen_output.log %}
```

{% capture notice-text %}
## Example: Building a List of Flight Records
### Question
{:.no_toc}
Given a CSV file with a header row (`name,altitude_km,duration_min`) followed by one flight per line, write a function that reads the file and returns a list of rows, where each row is a list `[name, altitude_km, duration_min]` with the numeric fields converted to `float`.

### Solution
{:.no_toc}
The function reads the header separately with `.readline()`, then loops over the remaining lines, splitting and converting each one before appending it to the result.

```python
{% include python/file_records/main.py %}
```
```text
{% include python/file_records/screen_output.log %}
```

Once you've learned about dictionaries, on the [Dictionaries]({{ site.baseurl }}{% link python/dictionaries.md %}) page, this same pattern can build a list of dictionaries instead of a list of lists, letting you access `flights[0]["name"]` by field name instead of position.

{% endcapture %}
<div class="notice--info">{{ notice-text | markdownify }}</div>

## The csv Module

Manual `.strip().split(",")` parsing works for simple files, but breaks down on edge cases like a field that itself contains a comma inside quotes.
The standard library's `csv` module handles those cases, and `csv.DictReader` reads each row directly into a dict keyed by the header:

```python
{% include python/file_csv_module/main.py %}
```
```text
{% include python/file_csv_module/screen_output.log %}
```

Each `row` behaves like a dictionary, so `row["name"]` reads that field by name.
See the [Dictionaries]({{ site.baseurl }}{% link python/dictionaries.md %}) page for more on working with dicts.

## Appending to a File

Opening a file with `"a"` (append mode) adds to the end of an existing file instead of overwriting it:

```python
{% include python/file_append/main.py %}
```
```text
{% include python/file_append/screen_output.log %}
```

## File Modes

| Mode | Meaning |
|------|---------|
| `"r"` | Read (the default), raises an error if the file doesn't exist |
| `"w"` | Write (overwrites the file if it exists, creates it if not) |
| `"a"` | Append (adds to the end, creates the file if not) |
| `"r+"` | Read and write, without truncating |

## Checking Whether a File Exists

`os.path.exists()` checks whether a file (or folder) exists, without opening it:

```python
{% include python/file_exists/main.py %}
```
```text
{% include python/file_exists/screen_output.log %}
```

This is useful for deciding whether to read an existing file or create a new one, before ever calling `open()`.

## Handling a Missing File

Trying to open a file that doesn't exist in read mode raises a `FileNotFoundError`.
Wrapping the `open()` call in a `try`-`except` block lets a script handle that case instead of crashing:

```python
{% include python/file_missing/main.py %}
```
```text
{% include python/file_missing/screen_output.log %}
```

## Reading Questions

1. What is the purpose of the `with` statement when working with files?
1. What is the difference between `"w"` mode and `"a"` mode?
1. What does `.read()` return when called on an open file?
1. Why is looping over an open file object line by line sometimes preferable to `.read()`?
1. What do `.strip()` and `.split(",")` do to a line of CSV data, and in what order would you typically apply them?
1. What is the difference between `print()` and `.writelines()` when it comes to adding newlines?
1. What does `csv.DictReader` return for each row, and how do you access a specific field from it?
1. How would you check whether a file exists without opening it?
1. What error does Python raise if you try to open a file that doesn't exist in read mode, and how would you handle it?
