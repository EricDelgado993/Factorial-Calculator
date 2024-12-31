# ARM Program Basic: Factorial Calculation

## Overview
This project is an ARM assembly program designed to calculate and display the factorial of integers up to a user-specified number. The program includes input validation, arithmetic operations, and loop controls, demonstrating foundational ARM Assembly concepts such as:
- Output handling
- Input validation
- Comparisons
- Arithmetic operations
- Loop constructs

Additionally, the program showcases debugging and proper code documentation using the GNU Debugger (GDB).

## Features

### 1. Input Validation
- Prompts the user to enter a number between **1 and 12**.
- Rejects invalid inputs (e.g., values outside the range or non-integer inputs) and terminates the program with an error message.

### 2. Factorial Calculation
- Computes the factorial (`n!`) for all integers from **1** to the user-provided number.
- Outputs each number and its factorial in a tabular format.

### 3. User-Friendly Output
- Displays clear prompts and results, ensuring a smooth user experience.
- Handles invalid inputs gracefully with descriptive error messages.

### 4. ARM Assembly Concepts
- Demonstrates:
  - Basic arithmetic operations (`mul`, `add`, `sub`).
  - Loop control using `cmp`, `bne`, and branching instructions.
  - Input handling via `scanf` and output using `printf`.
  - Data section for string storage and memory management.

### 5. Debugging Support
- Includes comments for GDB commands to assemble, link, run, and debug the program.

## Example Output
```plaintext
This program will print the factorial of the integers from 1 to a
number you enter.
Please enter an integer number from 1 to 12.

You entered 4.

Following is the number and the product of the integers 1 to n

Number           n!
1                1
2                2
3                6
4                24
