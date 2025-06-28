## Building a Compiler for Your Language Targeting the JVM

If you want to build a compiler for your own language that targets the JVM, you’ll need to generate Java bytecode (`.class` files) as output. Here’s a concise roadmap and tool overview:

### **Key Steps**

- **Learn the JVM Specification:**
Understanding the JVM bytecode format and class file structure is essential. The official [JVM specification](https://docs.oracle.com/javase/specs/jvms/se17/html/index.html) is the primary resource.
- **Choose a Bytecode Generation Library:**
Instead of generating raw bytecode yourself, use a library to simplify `.class` file creation. Popular Java libraries include:
    - **ASM:** Widely used, efficient, and well-documented for creating and manipulating bytecode.
    - **BCEL (Byte Code Engineering Library):** Older but still used for bytecode generation and analysis.
    - **Javassist:** Good for high-level manipulation of bytecode.
    - **Krakatau, cglib, or gnu.bytecode:** Other options, though ASM is generally recommended.
- **Study Existing JVM-targeting Languages:**
Reviewing the source code of simple, open-source languages that compile to JVM bytecode (e.g., [Kotlin](https://github.com/JetBrains/kotlin), [Clojure](https://github.com/clojure/clojure), [Jython](https://github.com/jython/jython)) can provide practical insights.
- **Compiler Construction:**
You’ll need to implement:
    - A **lexer** and **parser** for your language (using tools like ANTLR, JavaCC, or hand-written).
    - An **AST (Abstract Syntax Tree)**.
    - A **code generation phase** that emits JVM bytecode using your chosen library.


### **Recommended Approach**

> “There are many Java libraries to read, write and change .class files like jclasslib, bcel, gnu bytecode, etc. Which one would you suggest?”
> **ASM** is generally the most recommended for new projects due to its performance and active maintenance.

### **Example Resource**

- [JVM Compiler Construction with Scala and BCEL, Part 1](https://tomlee.co/2007/11/jvm-compiler-construction-with-scala-and-bcel-part-1/) – A tutorial showing how to build a basic compiler targeting the JVM using BCEL.


### **Summary Table**

| Step                | Tool/Resource                      |
| :--                 | :--                                |
| Learn JVM spec      | JVM Specification                  |
| Parse your language | ANTLR, JavaCC, or custom parser    |
| Generate bytecode   | ASM (recommended), BCEL, Javassist |
| Study examples      | Open-source JVM languages          |

### **In Short**

- Use ASM (or BCEL) to generate JVM bytecode.
- Study the JVM spec and existing compilers for guidance.
- Implement a parser and AST for your language, then emit bytecode.

If you want a starting point, begin by writing a simple parser and then use ASM to generate `.class` files corresponding to your language constructs.


### Useful Links

1. https://tomlee.co/2007/11/jvm-compiler-construction-with-scala-and-bcel-part-1/
2. https://javacc.github.io/javacc/
3. https://cs.lmu.edu/~ray/notes/javacc/
4. https://javacc.github.io/javacc/tutorials/examples.html
5. https://www.cs.purdue.edu/homes/hosking/javacc/doc/
6. https://www.cin.ufpe.br/~in1007/transparencias/MaterialApoio/javacc-tutorial.pdf
7. https://www.gnu.org/software/kawa/gnu.bytecode/
8. https://web.archive.org/web/20120207040236/http://asm.ow2.org/
9. https://commons.apache.org/proper/commons-bcel/

### Jasmine 

1. https://www.ibr.cs.tu-bs.de/projects/jasmin/tutorial.html
2. https://web.mit.edu/javadev/packages/jasmin/doc/
3. https://jasmin.sourceforge.net/
### Jflex
1. https://jflex.de/
2. http://www2.cs.tum.edu/projects/cup/

### CUP
1. https://www.cs.princeton.edu/~appel/modern/java/CUP/manual.html
2. https://sites.cc.gatech.edu/gvu/people/Faculty/hudson/java_cup/manual.v0.9d.html

### CUP 2
1. https://www2.in.tum.de/~petter/cup2/
