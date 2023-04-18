import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget(
      {Key? key,
      required this.description,
      required this.isDone,
      this.onChanged,
      this.onTap})
      : super(key: key);
  final String description;
  final bool isDone;
  final void Function()? onTap;
  final void Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        description,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      onTap: onTap,
      trailing: Checkbox(
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
