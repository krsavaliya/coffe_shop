// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';

import '../models/chai.dart';

class ChaiTile extends StatelessWidget {
  final Chai chai;
  void Function()? onPressed;
  final Widget icon;
  ChaiTile({
    super.key,
    required this.chai,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
      child: ListTile(
        title: Text(chai.name),
        subtitle: Text(chai.price),
        leading: Image.asset(chai.iamgePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
