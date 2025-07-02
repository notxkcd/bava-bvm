// Save as TaskManager.java

import java.util.*;
import java.util.concurrent.*;
import java.util.function.*;
import java.nio.file.*;
import java.io.IOException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class TaskManager {

    public static void main(String[] args) throws Exception {
        TaskManagerApp app = new TaskManagerApp();
        app.run();
    }
}

// --- Modern Features Used Here ---
final class TaskManagerApp {
    private final List<Task> tasks = new ArrayList<>();
    private final Scanner scanner = new Scanner(System.in);
    private final ExecutorService executor = Executors.newSingleThreadExecutor();
    private final Gson gson = new GsonBuilder().setPrettyPrinting().create();

    public void run() throws Exception {
        printWelcome();
        while (true) {
            showMenu();
            String input = scanner.nextLine().trim();
            switch (input) {
                case "1" -> addTask();
                case "2" -> listTasks();
                case "3" -> exportTasksToJson();
                case "4" -> {
                    shutdown();
                    return;
                }
                default -> System.out.println("❌ Invalid option");
            }
        }
    }

    private void printWelcome() {
        String banner = """
                ╔══════════════════════════════╗
                ║     MODERN JAVA TASK APP     ║
                ╚══════════════════════════════╝
                """;
        System.out.println(banner);
    }

    private void showMenu() {
        System.out.println("""
                Choose:
                1. ➕ Add Task
                2. 📋 List Tasks
                3. 💾 Export Tasks to JSON
                4. ❌ Exit
                > """);
    }

    private void addTask() {
        System.out.print("Enter title: ");
        String title = scanner.nextLine();

        System.out.print("Enter priority (LOW, MEDIUM, HIGH): ");
        String priorityInput = scanner.nextLine().toUpperCase();
        TaskPriority priority = switch (priorityInput) {
            case "LOW" -> TaskPriority.LOW;
            case "MEDIUM" -> TaskPriority.MEDIUM;
            case "HIGH" -> TaskPriority.HIGH;
            default -> {
                System.out.println("Invalid priority. Defaulting to MEDIUM.");
                yield TaskPriority.MEDIUM;
            }
        };

        tasks.add(new Task(UUID.randomUUID().toString(), title, priority, new Date()));
        System.out.println("✅ Task added.");
    }

    private void listTasks() {
        if (tasks.isEmpty()) {
            System.out.println("No tasks found.");
            return;
        }

        tasks.stream()
             .sorted(Comparator.comparing(Task::priority).reversed())
             .forEach(System.out::println);
    }

    private void exportTasksToJson() {
        Runnable task = () -> {
            try {
                String json = gson.toJson(tasks);
                Path path = Paths.get("tasks.json");
                Files.writeString(path, json);
                System.out.println("✅ Tasks exported to tasks.json");
            } catch (IOException e) {
                System.err.println("❌ Failed to export: " + e.getMessage());
            }
        };
        executor.submit(task);
    }

    private void shutdown() {
        executor.shutdown();
        System.out.println("👋 Goodbye!");
    }
}

// --- Record & Enum (Modern Java Features) ---
record Task(String id, String title, TaskPriority priority, Date createdAt) {}

enum TaskPriority {
    LOW, MEDIUM, HIGH;
}
