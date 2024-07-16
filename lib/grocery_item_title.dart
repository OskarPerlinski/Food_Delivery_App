// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';

class GroceryItemTitle extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final String itemDescription;
  void Function()? onPressed;

  GroceryItemTitle(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.imagePath,
      required this.itemDescription,
      required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 8,
                spreadRadius: 5),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              imagePath,
              height: 64,
            ),
            Text(
              itemName,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              itemDescription,
              style: const TextStyle(fontSize: 10, color: Colors.black54),
            ),
            MaterialButton(
              onPressed: onPressed,
              color: Colors.orange,
              child: Text(
                "\$" + itemPrice,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}

