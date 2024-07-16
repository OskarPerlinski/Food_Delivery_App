// ignore_for_file: avoid_unnecessary_containers

import 'package:deliveryappfood/choicelogin.dart';
import 'package:deliveryappfood/onboarding2.dart';
import 'package:flutter/material.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _Onboarding1State();
}

class _Onboarding1State extends State<Onboarding1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Choicelogin(),
                ));
          },
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20.0, top: 20),
              child: Text(
                "Skip",
                style: TextStyle(fontSize: 15, color: Colors.black45),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 70),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/Hamburger.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Order Your Favorite Burger",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                "Now !",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange),
              ),
              const SizedBox(height: 50),
              const Text(
                'Discover your favorite burger with curated\nselection of the juiciest, most mouthwatering\noptions in town',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 42,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Onboarding2(),
                      ));
                },
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.orange),
                  child: const Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

