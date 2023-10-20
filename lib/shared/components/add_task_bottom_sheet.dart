import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/shared/styles/colors.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  var titleController = TextEditingController();

  var descriptionController = TextEditingController();

  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
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
          TextFormField(
            controller: titleController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Task Title',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: MyColors.unselectedItem,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.0.h,
          ),
          TextFormField(
            controller: descriptionController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              label: Text(
                'Task Description',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: MyColors.unselectedItem,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide(
                  color: MyColors.primaryColor,
                  width: 2.0,
                ),
              ),
            ),
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
                selectTaskDate(context);
              },
              child: Text(
                selectedDate.toString().substring(0, 10),
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
            onPressed: () {},
            color: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
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
  }

  selectTaskDate(BuildContext context) async {
    DateTime? chosenDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(
          days: 365,
        ),
      ),
    );
    if (chosenDate == null) {
      return;
    }
    setState(() {
      selectedDate = chosenDate;
    });
  }
}
