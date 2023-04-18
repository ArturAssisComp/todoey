import 'package:todoey/constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:todoey/data_layer/providers/task_list_provider.dart';
import 'package:todoey/data_layer/models/task.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? currentTextFieldValue;

    return Container(
      color: kInactiveBackgroundColor,
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
            bottom: kGlobalBottomPadding,
            left: kGlobalLeftPadding,
            right: kGlobalRightPadding,
          ),
          child: Column(
            children: [
              const Text(
                'Add Task',
                style: TextStyle(
                    color: kMainColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w400),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newValue) {
                  currentTextFieldValue = newValue;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    if (currentTextFieldValue != null) {
                      Provider.of<TaskListProvider>(context, listen: false)
                          .addTask(
                              task: Task(description: currentTextFieldValue!));
                      Navigator.pop(context);
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: kMainColor,
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
