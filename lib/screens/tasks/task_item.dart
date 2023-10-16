import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

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
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
              children: [
                Container(
                  height: 80.0,
                  width: 4.0,
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
                    Text('Task Title',
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            fontSize: 14.0, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 5.0.h,
                    ),
                    Text('Task Description',
                        style: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .copyWith(fontSize: 14.0)),
                  ],
                ),
                const Spacer(),
                MaterialButton(
                  height: 35.0.h,
                  minWidth: 70.w,
                  color: MyColors.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(
                        width: 2.0,
                        color: MyColors.primaryColor,
                      )),
                  onPressed: () {},
                  child: SvgPicture.asset('assets/images/doneIcon.svg'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
