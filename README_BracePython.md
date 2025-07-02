# BracePython Interpreter

A tiny Python-like interpreter written in Java that uses braces `{}` instead of indentation for code blocks.

## Features

- **Variables**: Simple variable assignment and usage
- **Print statements**: `print("Hello World");`
- **Conditionals**: `if (condition) { ... } else { ... }`
- **Loops**: `while (condition) { ... }`
- **Functions**: Basic function definition (simplified)
- **Arithmetic**: `+`, `-`, `*`, `/` operations
- **Comparisons**: `==`, `!=`, `<`, `>`, `<=`, `>=`
- **Strings**: Double and single quoted strings
- **Numbers**: Integers and floating-point numbers

## Syntax

### Variables
```python
x = 10;
name = "John";
```

### Print Statements
```python
print("Hello World");
print(x);
```

### Conditionals
```python
if (x > 5) {
    print("x is greater than 5");
} else {
    print("x is 5 or less");
}
```

### Loops
```python
counter = 0;
while (counter < 5) {
    print("Counter: " + counter);
    counter = counter + 1;
}
```

### Functions
```python
def greet(name) {
    print("Hello " + name);
}
```

### Arithmetic
```python
a = 10;
b = 3;
result = a + b * 2;  # Follows operator precedence
```

## Usage

### Compile the Interpreter
```bash
javac BracePythonInterpreter.java
```

### Run in Interactive Mode
```bash
java BracePythonInterpreter
```

### Run a File
```bash
java BracePythonInterpreter test_brace_python.py
```

## Example Session

```
BracePython Interpreter v1.0
Type 'exit' to quit
>>> x = 10;
>>> y = 5;
>>> if (x > y) { print("x is greater"); } else { print("y is greater"); }
x is greater
>>> counter = 0;
>>> while (counter < 3) { print("Count: " + counter); counter = counter + 1; }
Count: 0
Count: 1
Count: 2
>>> exit
```

## Limitations

This is a simplified interpreter with the following limitations:

- No function calls (only definitions)
- No lists or dictionaries
- No import statements
- No classes or objects
- Limited error handling
- No support for complex expressions in conditions
- No support for nested functions

## How It Works

1. **Tokenization**: The code is broken down into tokens using regex patterns
2. **Parsing**: Tokens are parsed into statements and expressions
3. **Execution**: Each statement is executed in sequence
4. **Variable Storage**: Variables are stored in a HashMap
5. **Expression Evaluation**: Uses recursive descent parsing for expressions

## Architecture

- **Lexer**: Simple regex-based tokenizer
- **Parser**: Recursive descent parser
- **Interpreter**: Direct execution of parsed statements
- **Symbol Table**: HashMap for variable storage

This interpreter demonstrates basic concepts of language implementation including lexical analysis, parsing, and interpretation. 