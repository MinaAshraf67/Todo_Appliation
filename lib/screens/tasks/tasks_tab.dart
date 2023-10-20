// ignore_for_file: avoid_print

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/screens/tasks/task_item.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: const AlignmentDirectional(0, 2.0),
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
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(
                  const Duration(days: 365),
                ),
                lastDate: DateTime.now().add(
                  const Duration(days: 365),
                ),
                onDateSelected: (date) => print(date),
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
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return TaskItem();
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
