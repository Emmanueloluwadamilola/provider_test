import 'package:flutter/material.dart';
import 'package:provider_test/Counter/home_state.dart';


class HomeProvider extends ChangeNotifier {
  final state = HomeState();

  void changeValue(value) {
    state.num = value;
    notifyListeners();
  }
}
