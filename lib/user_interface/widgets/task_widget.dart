import 'package:flutter/material.dart';
import 'package:todoey/data_layer/models/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key, required this.task}) : super(key: key);
  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.description,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(value: task.isDone, onChanged: (newValue) {}),
    );
  }
}
