import 'package:flutter/material.dart';
import 'package:first_app/models/food.dart';
import 'package:flutter/widgets.dart';

class Shop extends ChangeNotifier {
  final List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "50.000",
        imagePath: "lib/images/salmon.png",
        rating: "4.5"),
    Food(
        name: "Vegetable Sushi",
        price: "45.000",
        imagePath: "lib/images/2.png",
        rating: "4.3"),
  ];

  List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}
