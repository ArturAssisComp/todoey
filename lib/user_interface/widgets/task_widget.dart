import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.description,
    required this.isDone,
    this.onChanged,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);
  final String description;
  final bool isDone;
  final void Function()? onTap;
  final void Function(bool?)? onChanged;
  final void Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: ListTile(
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
      ),
    );
  }
}
