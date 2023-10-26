// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/providers/tasks_provider.dart';
import 'package:todo_app/screens/tasks/task_update_custom_text_field.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskUpdate extends StatefulWidget {
  TaskModel task;
  TaskUpdate({super.key, required this.task});

  @override
  State<TaskUpdate> createState() => _TaskUpdateState();
}

class _TaskUpdateState extends State<TaskUpdate> {
  TextEditingController titleController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  @override
  void initState() {
    super.initState();
    titleController.text = widget.task.title;
    descriptionController.text = widget.task.description;
    selectedDate = DateTime.fromMillisecondsSinceEpoch(widget.task.date);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TasksProvider(),
      builder: (context, child) {
        var provider = Provider.of<TasksProvider>(context);

        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: MyColors.primaryColor,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 20.0),
                    height: 157.h,
                    child: Container(
                      margin: const EdgeInsets.only(left: 52.0, top: 65.0),
                      child: Text(
                        'To Do List',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                              color: MyColors.whiteColor,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Card(
                  margin: const EdgeInsets.only(top: 100.0, bottom: 200.0),
                  elevation: 15.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Edit Tasks',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                        TaskUpdateCustomTextField(
                          label: 'Task Title',
                          controller: titleController,
                        ),
                        TaskUpdateCustomTextField(
                          label: 'Task Description',
                          controller: descriptionController,
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: MyColors.primaryColor,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80.0.h,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          color: MyColors.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          minWidth: double.infinity,
                          height: 42.0.h,
                          child: Text(
                            'Save Changes',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(
                                  color: MyColors.whiteColor,
                                  fontSize: 16.0.sp,
                                ),
                          ),
                        )
                      ],
                    ),
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
