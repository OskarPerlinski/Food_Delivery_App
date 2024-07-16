import 'package:deliveryappfood/choicelogin.dart';
import 'package:deliveryappfood/onboarding3.dart';
import 'package:flutter/material.dart';

class Onboarding2 extends StatefulWidget {
  const Onboarding2({super.key});

  @override
  State<Onboarding2> createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
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
                "images/Savings.png",
                width: 250,
                height: 250,
              ),
              const SizedBox(
                height: 50,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Best ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    "prices compared to Our",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Text(
                "competitors",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 50),
              const Text(
                'Save money by tracking your order.\nGiving feedback and discovering More !',
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
                        builder: (context) => const Onboarding3(),
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
