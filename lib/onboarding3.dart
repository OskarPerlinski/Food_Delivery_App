import 'package:deliveryappfood/choicelogin.dart';
import 'package:flutter/material.dart';

class Onboarding3 extends StatefulWidget {
  const Onboarding3({super.key});

  @override
  State<Onboarding3> createState() => _Onboarding3State();
}

class _Onboarding3State extends State<Onboarding3> {
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
                "images/Delivery.png",
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
                    "Less than ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "30 ",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                  Text(
                    'minutes delivery',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                'We guarantee you the fastes delivery and the\nbest service to satisfy you',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 42,
              ),
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.orange),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Choicelogin(),
                        ));
                  },
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


