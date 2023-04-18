import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/user_interface/screens/home.dart';
import 'package:todoey/data_layer/providers/task_list_provider.dart';

void main() => runApp(
      MaterialApp(
        home: ChangeNotifierProvider<TaskListProvider>(
          create: (BuildContext context) => TaskListProvider(),
          builder: (context, child) => const Home(),
        ),
      ),
    );
