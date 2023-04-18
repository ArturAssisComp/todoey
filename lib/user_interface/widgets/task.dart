import 'package:flutter/material.dart';

class Task extends StatelessWidget {
  const Task({
    super.key,
    required this.description,
  });
  final String description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(description),
      trailing: Checkbox(
        value: false,
        onChanged: (newValue) {},
      ),
    );
  }
}
