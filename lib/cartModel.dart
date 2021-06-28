import 'package:flutter/material.dart';

class MyCart extends ChangeNotifier {
  List cartList = [];

  addToCart(int index) {
    cartList.add(index);
    notifyListeners();
  }

  removeFromLast() {
    cartList.removeLast();
    notifyListeners();
  }
}
