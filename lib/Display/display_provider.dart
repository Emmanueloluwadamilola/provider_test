import 'package:flutter/material.dart';
import 'package:provider_test/Display/display_state.dart';

class DisplayProvider extends ChangeNotifier {
  final state = DisplayState();

  changeName(value) {
    state.name = value;
    notifyListeners();
  }

   getAge( value) {
    state.age = int.parse(value);
    notifyListeners();
  }

  increaseAge() {
    state.age++;
    notifyListeners();
  }
}
