import 'package:flutter/material.dart';
import 'package:provider_test/Shopping_cart/manager/shopping_state.dart';

class ShoppingProvider extends ChangeNotifier {
  final state = ShoppingState();

  addItem(value) {
    state.myItems.add(value);
    notifyListeners();
  }

  removeItem(value) {
    state.myItems.remove(value);
    notifyListeners();
  }
}
