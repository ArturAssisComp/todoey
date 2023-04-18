import 'package:flutter/material.dart';
import 'package:todoey/data_layer/models/task.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({Key? key, required this.task, this.onChanged, this.onTap})
      : super(key: key);
  final Task task;
  final void Function()? onTap;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.description,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: onTap,
      trailing: Checkbox(
        value: task.isDone,
        onChanged: onChanged,
      ),
    );
  }
}
