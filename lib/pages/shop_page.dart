// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable

import 'package:coffe_shop/components/chai_tile.dart';
import 'package:coffe_shop/models/chai_shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/chai.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add chai to cart
  void addToCart(Chai chai) {
    Provider.of<ChaiShop>(context, listen: false).addItemToCart(chai);

    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                'Successfully Added',
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ChaiShop>(
      builder: (context, value, child) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const Text(
              'How\'s The Tea',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: value.chaiShop.length,
                  itemBuilder: (context, index) {
                    // get special chai
                    Chai eachChai = value.chaiShop[index];
                    //return the tile for chai
                    return ChaiTile(
                      icon: Icon(Icons.add),
                      chai: eachChai,
                      onPressed: () => addToCart(eachChai),
                    );
                  }),
            )
          ]),
        ),
      ),
    );
  }
}
