import 'package:deliveryappfood/login.dart';
import 'package:deliveryappfood/signup.dart';
import 'package:flutter/material.dart';

class Choicelogin extends StatefulWidget {
  const Choicelogin({super.key});

  @override
  State<Choicelogin> createState() => _ChoiceloginState();
}

class _ChoiceloginState extends State<Choicelogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(top: 30.0),
          child: Text(
            "Welcome",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 70, bottom: 40),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "images/option.png",
                width: 400,
                height: 400,
              ),
              const SizedBox(
                height: 40,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ));
                  },
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[400],
                    ),
                    child: const Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.orange,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Signup(),
                          ));
                    },
                    child: const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
