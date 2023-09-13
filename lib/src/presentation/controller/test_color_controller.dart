import 'package:flutter/material.dart';

class TestColorController with ChangeNotifier {
  bool isMechanismWork = false;

  void changeMechanismWorkState() {
    isMechanismWork = !isMechanismWork;
    notifyListeners();
  }
}
