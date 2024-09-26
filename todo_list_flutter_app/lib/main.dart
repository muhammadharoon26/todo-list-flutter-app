import 'dart:io';

void main() {
  List<String> tasks = [];
  
  while (true) {
    printMenu();
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        addTask(tasks);
        break;
      case '2':
        viewTasks(tasks);
        break;
      case '3':
        removeTask(tasks);
        break;
      case '4':
        print('Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
    
    print('\n');
  }
}

void printMenu() {
  print('1. Add a task');
  print('2. View tasks');
  print('3. Remove a task');
  print('4. Exit');
  print('Choose an option: ');
}

void addTask(List<String> tasks) {
  print('Enter the task: ');
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    tasks.add(task);
    print('Task added.');
  } else {
    print('Invalid task. Please try again.');
  }
}

void viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks in the list.');
  } else {
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void removeTask(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks to remove.');
    return;
  }
  
  viewTasks(tasks);
  print('Enter the number of the task to remove: ');
  String? input = stdin.readLineSync();
  
  if (input != null) {
    try {
      int index = int.parse(input) - 1;
      if (index >= 0 && index < tasks.length) {
        String removedTask = tasks.removeAt(index);
        print('Removed task: $removedTask');
      } else {
        print('Invalid task number. Please try again.');
      }
    } catch (e) {
      print('Invalid input. Please enter a number.');
    }
  }
}