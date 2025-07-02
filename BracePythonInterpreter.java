import java.util.*;
import java.util.regex.*;
import java.io.*;
import java.nio.file.*;

public class BracePythonInterpreter {
    private Map<String, Object> variables = new HashMap<>();
    private List<String> tokens = new ArrayList<>();
    private int currentToken = 0;
    
    public static void main(String[] args) {
        System.err.println("DEBUG: main called");
        BracePythonInterpreter interpreter = new BracePythonInterpreter();
        
        if (args.length > 0) {
            // Read from file
            try {
                String code = new String(Files.readAllBytes(Paths.get(args[0])));
                interpreter.interpret(code);
            } catch (IOException e) {
                System.err.println("Error reading file: " + e.getMessage());
            }
        } else {
            // Interactive mode
            interpreter.runInteractive();
        }
    }
    
    public void runInteractive() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("BracePython Interpreter v1.0");
        System.out.println("Type 'exit' to quit");
        
        while (true) {
            System.out.print(">>> ");
            String input = scanner.nextLine().trim();
            
            if (input.equalsIgnoreCase("exit")) {
                break;
            }
            
            if (!input.isEmpty()) {
                try {
                    interpret(input);
                } catch (Exception e) {
                    System.err.println("Error: " + e.getMessage());
                }
            }
        }
        
        scanner.close();
    }
    
    public void interpret(String code) {
        System.err.println("DEBUG: interpret called");
        tokenize(code);
        try {
            java.nio.file.Files.write(java.nio.file.Paths.get("tokens.txt"), ("TOKENS: " + tokens).getBytes());
        } catch (Exception ex) {}
        System.out.println("TOKENS written to tokens.txt");
        System.out.flush();
        currentToken = 0;
        try {
            while (currentToken < tokens.size()) {
                executeStatement();
            }
        } catch (Exception e) {
            System.err.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }
    
    private void tokenize(String code) {
        tokens.clear();
        
        // Remove comments and blank lines
        StringBuilder filtered = new StringBuilder();
        for (String line : code.split("\\r?\\n")) {
            String trimmed = line.trim();
            if (trimmed.isEmpty() || (trimmed.length() > 0 && trimmed.charAt(0) == '#')) continue;
            filtered.append(trimmed).append("\n");
        }
        code = filtered.toString();
        
        // Simple regex patterns for tokens
        String[] patterns = {
            "\\b(if|else|while|print|def|return)\\b",  // Keywords
            "\\b\\d+(\\.\\d+)?\\b",                   // Numbers
            "\\b[a-zA-Z_][a-zA-Z0-9_]*\\b",          // Identifiers
            "[+\\-*/=<>!&|(){};,\\[\\]]",            // Operators and punctuation
            "\"[^\"]*\"",                             // Strings
            "'.*?'"                                   // Single quoted strings
        };
        
        String combinedPattern = String.join("|", patterns);
        Pattern pattern = Pattern.compile(combinedPattern);
        Matcher matcher = pattern.matcher(code);
        
        while (matcher.find()) {
            String token = matcher.group();
            if (!token.trim().isEmpty()) {
                tokens.add(token);
            }
        }
        // Debug: print all tokens
        System.out.println("TOKENS: " + tokens);
    }
    
    private void executeStatement() {
        if (currentToken >= tokens.size()) return;
        
        String token = tokens.get(currentToken);
        
        switch (token) {
            case "print":
                executePrint();
                break;
            case "if":
                executeIf();
                break;
            case "while":
                executeWhile();
                break;
            case "def":
                executeFunction();
                break;
            default:
                executeAssignment();
                break;
        }
    }
    
    private void executePrint() {
        currentToken++; // Skip 'print'
        expect("(");
        currentToken++;
        
        Object value = evaluateExpression();
        System.out.println(value);
        
        expect(")");
        currentToken++;
        expect(";");
        currentToken++;
    }
    
    private void executeIf() {
        currentToken++; // Skip 'if'
        expect("(");
        currentToken++;
        
        boolean condition = evaluateBooleanExpression();
        
        expect(")");
        currentToken++;
        expect("{");
        currentToken++;
        
        if (condition) {
            // Execute if block
            while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
                executeStatement();
            }
        } else {
            // Skip if block
            while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
                currentToken++;
            }
        }
        
        expect("}");
        currentToken++;
        
        // Handle else
        if (currentToken < tokens.size() && tokens.get(currentToken).equals("else")) {
            currentToken++;
            expect("{");
            currentToken++;
            
            if (!condition) {
                while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
                    executeStatement();
                }
            } else {
                while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
                    currentToken++;
                }
            }
            
            expect("}");
            currentToken++;
        }
    }
    
    private void executeWhile() {
        int whileStart = currentToken;
        currentToken++; // Skip 'while'
        expect("(");
        currentToken++;
        
        while (evaluateBooleanExpression()) {
            expect(")");
            currentToken++;
            expect("{");
            currentToken++;
            
            int blockStart = currentToken;
            while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
                executeStatement();
            }
            
            expect("}");
            currentToken++;
            
            // Reset for next iteration
            currentToken = whileStart + 2; // After 'while' and '('
        }
        
        // Skip the condition and block
        expect(")");
        currentToken++;
        expect("{");
        currentToken++;
        while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
            currentToken++;
        }
        expect("}");
        currentToken++;
    }
    
    private void executeFunction() {
        currentToken++; // Skip 'def'
        String funcName = tokens.get(currentToken);
        currentToken++;
        
        expect("(");
        currentToken++;
        
        List<String> params = new ArrayList<>();
        if (!tokens.get(currentToken).equals(")")) {
            while (currentToken < tokens.size()) {
                params.add(tokens.get(currentToken));
                currentToken++;
                if (tokens.get(currentToken).equals(")")) break;
                expect(",");
                currentToken++;
            }
        }
        
        expect(")");
        currentToken++;
        expect("{");
        currentToken++;
        
        // Store function definition (simplified)
        variables.put(funcName, "FUNCTION:" + String.join(",", params));
        
        // Skip function body for now
        while (currentToken < tokens.size() && !tokens.get(currentToken).equals("}")) {
            currentToken++;
        }
        expect("}");
        currentToken++;
    }
    
    private void executeAssignment() {
        String varName = tokens.get(currentToken);
        currentToken++;
        
        expect("=");
        currentToken++;
        
        Object value = evaluateExpression();
        variables.put(varName, value);
        
        if (currentToken < tokens.size() && tokens.get(currentToken).equals(";")) {
            currentToken++;
        }
    }
    
    private Object evaluateExpression() {
        Object left = evaluateTerm();
        
        while (currentToken < tokens.size() && 
               (tokens.get(currentToken).equals("+") || tokens.get(currentToken).equals("-"))) {
            String op = tokens.get(currentToken);
            currentToken++;
            Object right = evaluateTerm();
            
            if (op.equals("+")) {
                left = add(left, right);
            } else {
                left = subtract(left, right);
            }
        }
        
        return left;
    }
    
    private Object evaluateTerm() {
        Object left = evaluateFactor();
        
        while (currentToken < tokens.size() && 
               (tokens.get(currentToken).equals("*") || tokens.get(currentToken).equals("/"))) {
            String op = tokens.get(currentToken);
            currentToken++;
            Object right = evaluateFactor();
            
            if (op.equals("*")) {
                left = multiply(left, right);
            } else {
                left = divide(left, right);
            }
        }
        
        return left;
    }
    
    private Object evaluateFactor() {
        String token = tokens.get(currentToken);
        currentToken++;
        
        if (token.matches("\\d+(\\.\\d+)?")) {
            if (token.contains(".")) {
                return Double.parseDouble(token);
            } else {
                return Integer.parseInt(token);
            }
        } else if (token.startsWith("\"") || token.startsWith("'")) {
            return token.substring(1, token.length() - 1);
        } else {
            return variables.getOrDefault(token, 0);
        }
    }
    
    private boolean evaluateBooleanExpression() {
        Object left = evaluateExpression();
        
        if (currentToken < tokens.size() && 
            (tokens.get(currentToken).equals("==") || tokens.get(currentToken).equals("!=") ||
             tokens.get(currentToken).equals("<") || tokens.get(currentToken).equals(">") ||
             tokens.get(currentToken).equals("<=") || tokens.get(currentToken).equals(">="))) {
            
            String op = tokens.get(currentToken);
            currentToken++;
            Object right = evaluateExpression();
            
            switch (op) {
                case "==": return Objects.equals(left, right);
                case "!=": return !Objects.equals(left, right);
                case "<": return compare(left, right) < 0;
                case ">": return compare(left, right) > 0;
                case "<=": return compare(left, right) <= 0;
                case ">=": return compare(left, right) >= 0;
            }
        }
        
        return !Objects.equals(left, 0) && !Objects.equals(left, false);
    }
    
    private Object add(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) {
            if (a instanceof Double || b instanceof Double) {
                return ((Number) a).doubleValue() + ((Number) b).doubleValue();
            } else {
                return ((Number) a).intValue() + ((Number) b).intValue();
            }
        }
        return a.toString() + b.toString();
    }
    
    private Object subtract(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) {
            if (a instanceof Double || b instanceof Double) {
                return ((Number) a).doubleValue() - ((Number) b).doubleValue();
            } else {
                return ((Number) a).intValue() - ((Number) b).intValue();
            }
        }
        throw new RuntimeException("Cannot subtract non-numbers");
    }
    
    private Object multiply(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) {
            if (a instanceof Double || b instanceof Double) {
                return ((Number) a).doubleValue() * ((Number) b).doubleValue();
            } else {
                return ((Number) a).intValue() * ((Number) b).intValue();
            }
        }
        throw new RuntimeException("Cannot multiply non-numbers");
    }
    
    private Object divide(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) {
            if (a instanceof Double || b instanceof Double) {
                return ((Number) a).doubleValue() / ((Number) b).doubleValue();
            } else {
                return ((Number) a).intValue() / ((Number) b).intValue();
            }
        }
        throw new RuntimeException("Cannot divide non-numbers");
    }
    
    private int compare(Object a, Object b) {
        if (a instanceof Number && b instanceof Number) {
            double aVal = ((Number) a).doubleValue();
            double bVal = ((Number) b).doubleValue();
            return Double.compare(aVal, bVal);
        }
        return a.toString().compareTo(b.toString());
    }
    
    private void expect(String expected) {
        if (currentToken >= tokens.size() || !tokens.get(currentToken).equals(expected)) {
            throw new RuntimeException("Expected '" + expected + "' but found '" + 
                                     (currentToken < tokens.size() ? tokens.get(currentToken) : "EOF") + "'");
        }
    }
} 