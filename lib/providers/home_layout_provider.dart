import 'package:flutter/material.dart';

class HomeLayoutProvider extends ChangeNotifier {
  int index = 0;
  bottomNavCurrent(value) {
    index = value;
    notifyListeners();
  }
}
