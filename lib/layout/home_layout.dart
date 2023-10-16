// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/home_layout_provider.dart';
import 'package:todo_app/screens/settings/settings_tab.dart';
import 'package:todo_app/screens/tasks/tasks_tab.dart';
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

        return Container(
          color: MyColors.primaryColor,
          child: SafeArea(
            child: Scaffold(
              extendBody: true,
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              floatingActionButton: FloatingActionButton(
                shape: const CircleBorder(
                  side: BorderSide(color: Colors.white, width: 4.0),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                ),
              ),
              bottomNavigationBar: BottomAppBar(
                color: MyColors.whiteColor,
                shape: const CircularNotchedRectangle(),
                notchMargin: 8,
                child: BottomNavigationBar(
                  backgroundColor: Colors.transparent,
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
