// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:coffe_shop/components/chai_tile.dart';
import 'package:coffe_shop/models/chai_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chai.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  void removeFromCart(Chai chai) {
    Provider.of<ChaiShop>(context, listen: false).removeItemToCart(chai);
  }

  void payNow() {}

  @override
  Widget build(BuildContext context) {
    return Consumer<ChaiShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              Text(
                'Your Cart',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: value.userCart.length,
                    itemBuilder: (context, index) {
                      Chai eachChai = value.userCart[index];
                      return ChaiTile(
                        chai: eachChai,
                        onPressed: () => removeFromCart(eachChai),
                        icon: Icon(Icons.delete),
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.all(25),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
