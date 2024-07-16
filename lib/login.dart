// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, use_build_context_synchronously

import 'package:deliveryappfood/forgotpassword.dart';
import 'package:deliveryappfood/home_screen.dart';
import 'package:deliveryappfood/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? mail, password;
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();
  userLogin() async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: mail!, password: password!);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "No user found fot that Email",
          style: TextStyle(fontSize: 15),
        )));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Wrong Password",
          style: TextStyle(fontSize: 15),
        )));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 20),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Welcome Back',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Enter your credential to login",
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Email";
                      }
                      return null;
                    },
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: const TextStyle(color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.cyan[100],
                        prefixIcon: const Icon(
                          Icons.mail,
                          color: Colors.black45,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please Enter Password";
                      }
                      return null;
                    },
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: const TextStyle(color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.cyan[100],
                        prefixIcon: const Icon(
                          Icons.password,
                          color: Colors.black45,
                        )),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                        setState(() {
                          mail= emailcontroller.text;
                          password= passwordcontroller.text;
                        });
                        userLogin();
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Forgotpassword(),
                          ));
                    },
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?   "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Signup(),
                              ));
                        },
                        child: const Text(
                          " Sign Up",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
