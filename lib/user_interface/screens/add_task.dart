import 'package:todoey/constants.dart';
import 'package:flutter/material.dart';

class AddTask extends StatelessWidget {
  const AddTask({
    super.key,
    this.addTask,
  });

  final void Function(String?)? addTask;

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
                    if (addTask != null) {
                      addTask!(currentTextFieldValue);
                      if (currentTextFieldValue != null) {
                        Navigator.pop(context);
                      }
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
