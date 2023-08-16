// ignore_for_file: non_constant_identifier_names, prefer_final_fields, unused_import

import 'package:coffe_shop/models/chai.dart';
import 'package:flutter/material.dart';

class ChaiShop extends ChangeNotifier {
  // chai for sale list
  final List<Chai> _shop = [
    Chai(
      name: 'Chai',
      price: '₹15',
      iamgePath: 'lib/images/black.png',
    ),
    Chai(
      name: 'Kali-Chai',
      price: '₹10',
      iamgePath: 'lib/images/black-tea.png',
    ),
    Chai(
      name: 'Hari-Chai',
      price: '₹30',
      iamgePath: 'lib/images/green-tea.png',
    ),
    Chai(
      name: 'Masala-Chai',
      price: '₹25',
      iamgePath: 'lib/images/chai-tea.png',
    ),
  ];

  //user cart
  List<Chai> _userCart = [];

  //get chai list
  List<Chai> get chaiShop => _shop;

  //get user cart
  List<Chai> get userCart => _userCart;

  //add item to cart
  void addItemToCart(Chai chai) {
    _userCart.add(chai);
    notifyListeners();
  }

  //remove from cart
  void removeItemToCart(Chai chai) {
    _userCart.remove(chai);
    notifyListeners();
  }
}
