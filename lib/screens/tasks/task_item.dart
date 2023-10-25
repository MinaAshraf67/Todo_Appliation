// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/firebase/firebase_functions.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskItem extends StatefulWidget {
  TaskModel task;

  TaskItem({required this.task, super.key});

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14.0),
        ),
        elevation: 10.0,
        child: IntrinsicHeight(
          child: Slidable(
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  onPressed: (context) {
                    FirebaseFunctions.deleteTask(widget.task.id);
                  },
                  label: 'Delete',
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(14.0),
                    bottomLeft: Radius.circular(14.0),
                  ),
                ),
                SlidableAction(
                  onPressed: (context) {},
                  label: 'Edit',
                  icon: Icons.edit,
                  backgroundColor: Colors.blue,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  Container(
                    height: 80.0.h,
                    width: 4.0.w,
                    decoration: BoxDecoration(
                        color: MyColors.primaryColor,
                        borderRadius: BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    width: 20.0.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.task.title,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      SizedBox(
                        height: 5.0.h,
                      ),
                      Text(
                        widget.task.description,
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 14.0.sp),
                      ),
                    ],
                  ),
                  const Spacer(),
                  widget.task.isDone
                      ? SizedBox(
                          height: 35.0.h,
                          width: 70.w,
                          child: Text(
                            'Done!',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: MyColors.greenColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        )
                      : MaterialButton(
                          height: 35.0.h,
                          minWidth: 70.w,
                          color: MyColors.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                              side: BorderSide(
                                width: 2.0,
                                color: MyColors.primaryColor,
                              )),
                          onPressed: () {
                            widget.task.isDone = true;
                            FirebaseFunctions.updateTask(widget.task);
                            setState(() {});
                          },
                          child: SvgPicture.asset('assets/images/doneIcon.svg'),
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
