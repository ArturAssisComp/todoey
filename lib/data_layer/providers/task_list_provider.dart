import 'package:todoey/data_layer/models/task.dart';
import 'package:flutter/material.dart';

class TaskListProvider extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(description: 'Buy milk'),
    Task(description: 'Buy soda'),
    Task(description: 'Buy meat'),
    Task(description: 'Buy bananas'),
    Task(description: 'Buy orange juice'),
    Task(description: 'Buy orange'),
    Task(description: 'Buy fini'),
  ];
  int get length => _tasks.length;

  String getTaskDescription(int index) {
    return _tasks[index].description;
  }

  bool getTaskState(int index) {
    return _tasks[index].isDone;
  }

  void addTask({required final Task task}) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask({required final int index}) {
    _tasks[index].toggleIsDone();
    notifyListeners();
  }
}
