import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  const Task({
    super.key,
    required this.description,
  });
  final String description;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
        });
      },
      title: Text(
        widget.description,
        style: TextStyle(
          decoration: _isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        value: _isChecked,
        onChanged: (newValue) {
          if (newValue != null) {
            setState(() {
              _isChecked = newValue;
            });
          }
        },
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  const TaskCheckbox({
    super.key,
    required this.value,
    this.onChanged,
  });
  final bool value;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: onChanged,
    );
  }
}
