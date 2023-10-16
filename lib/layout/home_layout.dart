import 'package:flutter/material.dart';
import 'package:todo_app/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'homelayout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: MyColors.primaryColor,
          )
        ],
      ),
    );
  }
}
