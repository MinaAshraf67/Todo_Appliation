// ignore_for_file: avoid_print

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/screens/tasks/task_item.dart';
import 'package:todo_app/shared/firebase/firebase_functions.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});

  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: const AlignmentDirectional(0, 1.5),
          children: [
            Container(
              color: MyColors.primaryColor,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20.0),
              height: 157.h,
              child: Container(
                margin: const EdgeInsets.only(left: 52.0, top: 31.0),
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
            Container(
              color: Colors.white,
              child: CalendarTimeline(
                showYears: false,
                initialDate: selectedDate,
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                onDateSelected: (date) {
                  setState(() {
                    selectedDate = date;
                  });
                },
                leftMargin: 15,
                monthColor: Colors.blueGrey,
                dayColor: MyColors.blackColor,
                activeDayColor: MyColors.whiteColor,
                activeBackgroundDayColor: MyColors.primaryColor,
                shrink: false,
                dotsColor: MyColors.transparentColor,
                selectableDayPredicate: (date) => true,
                locale: 'en',
              ),
            ),
          ],
        ),
        SizedBox(
          height: 64.0.h,
        ),

        // For real-time changes
        StreamBuilder(
          stream: FirebaseFunctions.getTasks(selectedDate),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return const Center(
                child: Text("Something went wrong"),
              );
            }
            List<TaskModel> tasks =
                snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
            return Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return TaskItem(
                    task: tasks[index],
                  );
                },
                itemCount: tasks.length,
              ),
            );
          },
        ),

        //For one-time read

        // FutureBuilder(
        //   future: FirebaseFunctions.getTasks(selectedDate),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(child: CircularProgressIndicator());
        //     }
        //     if (snapshot.hasError) {
        //       return const Center(
        //         child: Text("Something went wrong"),
        //       );
        //     }
        //     List<TaskModel> tasks =
        //         snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
        //     return Expanded(
        //       child: ListView.builder(
        //         itemBuilder: (context, index) {
        //           return TaskItem(
        //             task: tasks[index],
        //           );
        //         },
        //         itemCount: tasks.length,
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
