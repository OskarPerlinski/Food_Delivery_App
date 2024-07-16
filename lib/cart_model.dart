// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List _shopItems = [
    ["Hamburger", "1.80", "images/hamburgernew.jpg", "Beef, onions, pickle"],
    [
      "Cheeseburger",
      "2.00",
      "images/cheese1.jpg",
      "Beef, cheese, onions, pickle"
    ],
    ["BigMac", "4.00", "images/bigmac.jpg", "Beef, cheese, onions, tomato"],
    ["DoubleCheese", "3.50", "images/double.jpg", "2xbeef, 2xcheese, onions"],
    ["Vegetable", "3.00", "images/vegetable.jpg", "Plant burger, lettuce"],
    ["Chickenburger", "2.50", "images/chicken.jpg", "Chicken, lettuce"],
    [
      "Sweet chili chicken",
      "4.00",
      "images/sweetchilichciken.jpg",
      "Chicken, lettuce, cucumber"
    ],
    [
      "Spicy veggie",
      "3.80",
      "images/spicyveggie.jpg",
      "Veggie dippers, Lettuce"
    ],
    [
      "BBQ & bacon chcicken",
      "4.20",
      "images/bbqbacon.jpg",
      "Chicken, bacon, lettuce"
    ],
    ["Mozzarella bites", "3.00", "images/mozzarellabites.jpg", "Mozzarella"],
    ["Fish bites", "3.00", "images/fishbites.jpg", "Fish"],
    ["CocaCola zero", "2.50", "images/cocacolazero.jpg", "Cold drink"],
    ["Fanta zero", "2.50", "images/fantazero.jpg", "Cold drink"],
    ["Sprite zero", "2.50", "images/spritezero.jpg", "Cold drink"],
  ];
  List _cartItems = [];
  get shopItems => _shopItems;
  get cartItems => _cartItems;

  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < _cartItems.length; i++) {
      totalPrice += double.parse(_cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}

