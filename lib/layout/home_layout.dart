// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/user_model.dart';
import 'package:todo_app/providers/home_layout_provider.dart';
import 'package:todo_app/screens/settings/settings_tab.dart';
import 'package:todo_app/screens/tasks/tasks_tab/tasks_tab.dart';
import 'package:todo_app/shared/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  static const String routeName = 'homelayout';
  List<Widget> tabs = [
    const TasksTab(),
    const SettingsTab(),
  ];

  HomeLayout({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeLayoutProvider(),
      builder: (context, child) {
        var provider = Provider.of<HomeLayoutProvider>(context);
        var user = ModalRoute.of(context)?.settings.arguments as UserModel;
        return Container(
          color: MyColors.primaryColor,
          child: SafeArea(
            child: Scaffold(
              extendBody: true,
              appBar: AppBar(
                elevation: 0.0,
                title: Text("ToDO ${user.name}"),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: CircleBorder(
                  side: BorderSide(color: MyColors.whiteColor, width: 4.0),
                ),
                onPressed: () {
                  provider.showSheet(context);
                },
                child: const Icon(
                  Icons.add,
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: MyColors.whiteColor,
                shape: const CircularNotchedRectangle(),
                notchMargin: 8,
                child: BottomNavigationBar(
                  backgroundColor: MyColors.transparentColor,
                  elevation: 0.0,
                  currentIndex: provider.index,
                  onTap: (value) {
                    provider.bottomNavCurrent(value);
                  },
                  items: const [
                    BottomNavigationBarItem(
                      label: 'Tasks',
                      icon: Icon(Icons.list),
                    ),
                    BottomNavigationBarItem(
                      label: 'Settings',
                      icon: Icon(Icons.settings),
                    ),
                  ],
                ),
              ),
              body: tabs[provider.index],
            ),
          ),
        );
      },
    );
  }
}
