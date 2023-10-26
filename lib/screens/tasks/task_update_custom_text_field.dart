// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';

class TaskUpdateCustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String label;
  double borderRadius;
  TaskUpdateCustomTextField({
    required this.label,
    this.borderRadius = 20.0,
    this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        label: Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.unselectedItem,
            width: 2.0,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: MyColors.primaryColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
