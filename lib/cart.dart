import 'package:flutter/material.dart';

import 'coffee.dart';

class Cart extends ChangeNotifier {
  final List<Coffee> _items = [];

  List<Coffee> get items => _items.toList();

  void addToCart(Coffee coffee) {
    _items.add(coffee);
    notifyListeners();
  }
  void clearCart() {
    _items.clear();
    notifyListeners();
  }

  void removeItemAtIndex(int index) {
    if (index >= 0 && index < _items.length) {
      _items.removeAt(index);
      notifyListeners();
    }
  }
}
