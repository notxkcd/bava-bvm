# This uses braces instead of indentation

x = 10;
y = 5;

print("Hello from BracePython!");

if (x > y) {
    print("x is greater than y");
} else {
    print("y is greater than or equal to x");
}

z = x + y * 2;
print(z);

counter = 0;
while (counter < 3) {
    print("Counter: " + counter);
    counter = counter + 1;
}

name = "World";
message = "Hello " + name + "!";
print(message);

# Function definition (simplified)
def greet(name) {
    print("Hello " + name);
}

# Test arithmetic
a = 15;
b = 3;
print("Addition: " + (a + b));
print("Subtraction: " + (a - b));
print("Multiplication: " + (a * b));
print("Division: " + (a / b)); 