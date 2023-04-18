import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/user_interface/widgets/task_widget.dart';
import 'package:todoey/user_interface/screens/add_task.dart';
import 'package:todoey/data_layer/models/task.dart';

/// This constant defines the upper part of the screen.
const _kUpperPart = [
  Expanded(
    flex: 3,
    child: Padding(
      padding: EdgeInsets.only(left: kGlobalLeftPadding),
      child: Align(
        alignment: Alignment(-1, 0.5),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 30,
          child: Icon(
            Icons.list,
            color: kMainColor,
            size: 45,
          ),
        ),
      ),
    ),
  ),
  Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsets.only(left: kGlobalLeftPadding),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          'Todoey',
          style: TextStyle(
            fontSize: 40,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ),
  Expanded(
    flex: 1,
    child: Padding(
      padding: EdgeInsets.only(left: kGlobalLeftPadding),
      child: Align(
        alignment: Alignment.topLeft,
        child: Text(
          '12 tasks',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ),
  ),
];

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  List<Task> _tasks = [
    Task(description: 'Buy milk'),
    Task(description: 'Buy soda'),
    Task(description: 'Buy meat'),
    Task(description: 'Buy bananas'),
    Task(description: 'Buy orange juice'),
    Task(description: 'Buy orange'),
    Task(description: 'Buy fini'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: const AddTask(),
            ),
            isScrollControlled: true,
          );
        },
      ),
      backgroundColor: kMainColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.only(bottom: kGlobalBottomPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: _kUpperPart,
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: kGlobalTopPadding,
                    bottom: 4 * kGlobalBottomPadding,
                    left: kGlobalLeftPadding,
                    right: kGlobalRightPadding,
                  ),
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return TaskWidget(task: _tasks[index]);
                    },
                    itemCount: _tasks.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
