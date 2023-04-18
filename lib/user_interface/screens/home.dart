import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/user_interface/widgets/task_widget.dart';
import 'package:todoey/user_interface/screens/add_task.dart';
import 'package:todoey/data_layer/models/task.dart';

/// This constant defines the upper part of the screen.
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> _tasks = [
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
              child: AddTask(
                addTask: (newTaskDescription) {
                  if (newTaskDescription != null) {
                    final Task task = Task(description: newTaskDescription);
                    setState(() {
                      _tasks.add(task);
                    });
                  }
                },
              ),
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
                    children: [
                      const Expanded(
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
                      const Expanded(
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
                          padding:
                              const EdgeInsets.only(left: kGlobalLeftPadding),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '${_tasks.length} tasks',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
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
                      return TaskWidget(
                          task: _tasks[index],
                          onTap: () {
                            setState(() {
                              _tasks[index].toggleIsDone();
                            });
                          },
                          onChanged: (newValue) {
                            if (newValue != null &&
                                newValue != _tasks[index].isDone) {
                              setState(() {
                                _tasks[index].toggleIsDone();
                              });
                            }
                          });
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
