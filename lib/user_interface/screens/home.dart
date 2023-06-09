import 'package:flutter/material.dart';
import 'package:todoey/constants.dart';
import 'package:todoey/user_interface/widgets/task_widget.dart';
import 'package:todoey/user_interface/screens/add_task.dart';
import 'package:todoey/data_layer/providers/task_list_provider.dart';
import 'package:provider/provider.dart';

/// This constant defines the upper part of the screen.
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          size: 45,
        ),
        onPressed: () {
          final provider =
              Provider.of<TaskListProvider>(context, listen: false);
          showModalBottomSheet(
            context: context,
            builder: (context) => ChangeNotifierProvider.value(
              value: provider,
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTask(),
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
                              '${Provider.of<TaskListProvider>(context).length} tasks',
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
                        description: Provider.of<TaskListProvider>(context)
                            .getTaskDescription(index),
                        isDone: Provider.of<TaskListProvider>(context)
                            .getTaskState(index),
                        onTap: () {
                          Provider.of<TaskListProvider>(context, listen: false)
                              .toggleTask(index: index);
                        },
                        onChanged: (newValue) {
                          if (newValue != null &&
                              newValue !=
                                  Provider.of<TaskListProvider>(context,
                                          listen: false)
                                      .getTaskState(index)) {
                            Provider.of<TaskListProvider>(context,
                                    listen: false)
                                .toggleTask(index: index);
                          }
                        },
                        onLongPress: () {
                          Provider.of<TaskListProvider>(context, listen: false)
                              .deleteTask(index: index);
                        },
                      );
                    },
                    itemCount: Provider.of<TaskListProvider>(context).length,
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
