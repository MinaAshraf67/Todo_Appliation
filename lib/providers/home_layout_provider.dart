import 'package:flutter/material.dart';
import 'package:todo_app/screens/tasks/add_task_bottom_sheet.dart';

class HomeLayoutProvider extends ChangeNotifier {
  int index = 0;
  bottomNavCurrent(value) {
    index = value;
    notifyListeners();
  }

  void showSheet(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      isDismissible: true,
      elevation: 10.0,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: AddTaskBottomSheet(),
        );
      },
    );
    notifyListeners();
  }
}
