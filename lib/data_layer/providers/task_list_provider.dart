import 'package:todoey/data_layer/models/task.dart';
import 'package:flutter/material.dart';

class TaskListProvider extends ChangeNotifier {
  final List<Task> _tasks = [];
  int get length => _tasks.length;

  String getTaskDescription(int index) {
    if (index >= 0 && index < length) {
      return _tasks[index].description;
    }
    throw IndexError.withLength(index, length);
  }

  bool getTaskState(int index) {
    if (index >= 0 && index < length) {
      return _tasks[index].isDone;
    }
    throw IndexError.withLength(index, length);
  }

  void addTask({required final Task task}) {
    _tasks.add(task);
    notifyListeners();
  }

  void toggleTask({required final int index}) {
    if (index >= 0 && index < length) {
      _tasks[index].toggleIsDone();
      notifyListeners();
    } else {
      throw IndexError.withLength(index, length);
    }
  }

  void deleteTask({required int index}) {
    if (index >= 0 && index < length) {
      _tasks.removeAt(index);
      notifyListeners();
    } else {
      throw IndexError.withLength(index, length);
    }
  }
}
