import 'package:flutter/material.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'homelayout';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
      ),
    );
  }
}
