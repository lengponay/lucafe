import 'package:flutter/material.dart';

class OrderProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _orderItems = [];

  List<Map<String, dynamic>> get orderItems => _orderItems;

  void addItem(Map<String, dynamic> item) { //* add an item to the list
    _orderItems.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _orderItems.removeAt(index);
    notifyListeners();
  }

  void updateQuantity(int index, int quantity) {
    _orderItems[index]['quantity'] = quantity;
    notifyListeners();
  }

  double calculateTotal() {
    double total = 0;
    for (var item in _orderItems) {
      double price = double.parse(item['price'].substring(1));
      total += price * item['quantity'];
    }
    return total;
  }
}