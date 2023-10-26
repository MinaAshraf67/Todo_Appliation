// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/shared/components/custom_text_field.dart';
import 'package:todo_app/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      builder: (context, child) {
        var provider = Provider.of<TasksProvider>(context);

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Task',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 18.0.sp),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              CustomTextField(
                label: 'Task Title',
                controller: provider.titleController,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              CustomTextField(
                label: 'Task Description',
                controller: provider.descriptionController,
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Text(
                'Select Date',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(fontSize: 18.0.sp),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              Align(
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    provider.selectTaskDate(context);
                  },
                  child: Text(
                    provider.selectedDate.toString().substring(0, 10),
                    style: Theme.of(context).textTheme.labelSmall!.copyWith(
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                ),
              ),
              SizedBox(
                height: 16.0.h,
              ),
              MaterialButton(
                onPressed: () {
                  TaskModel taskModel = TaskModel(
                    title: provider.titleController.text,
                    description: provider.descriptionController.text,
                    date: DateUtils.dateOnly(provider.selectedDate)
                        .millisecondsSinceEpoch,
                  );
                  provider.addingTaskBottomSheet(context, taskModel);
                },
                color: MyColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                minWidth: double.infinity,
                height: 42.0.h,
                child: Text(
                  'Add Task',
                  style: Theme.of(context).textTheme.labelSmall!.copyWith(
                        fontSize: 14.0,
                        color: MyColors.whiteColor,
                      ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
