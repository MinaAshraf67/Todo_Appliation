import 'package:flutter/material.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/firebase/firebase_functions.dart';

class TasksProvider extends ChangeNotifier {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  selectTaskDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(
          days: 365,
        ),
      ),
    );
    if (chosenDate == null) {
      return;
    }

    selectedDate = chosenDate;

    notifyListeners();
  }

  addingTaskBottomSheet(BuildContext context, TaskModel taskModel) {
    FirebaseFunctions.addTasktoFireStore(taskModel);
    Navigator.pop(context);
    notifyListeners();
  }
}
