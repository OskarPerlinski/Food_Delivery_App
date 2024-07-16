// ignore_for_file: avoid_unnecessary_containers, unnecessary_new, use_build_context_synchronously, unused_local_variable


import 'package:deliveryappfood/database.dart';
import 'package:deliveryappfood/home_screen.dart';
import 'package:deliveryappfood/login.dart';
import 'package:deliveryappfood/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';


class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? name, mail, password;

  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registration() async {
    if (password != null && name != null && mail != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: mail!, password: password!);
             String id = randomAlphaNumeric(10);
        await SharedpreferenceHelper().saveUserName(namecontroller.text);
        await SharedpreferenceHelper().saveUserEmail(emailcontroller.text);

        await SharedpreferenceHelper().saveUserId(id);
            Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "Email": emailcontroller.text,
          "Id": id,
        };
        await DatabaseMethods().addUserDetails(userInfoMap, id);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Center(
              child: Text(
                        "Registered Successfully",
                        style: TextStyle(fontSize: 15),
                      ),
            )));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Center(
                child: Text(
                            "Password is to weak",
                            style: TextStyle(fontSize: 15),
                          ),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Center(
                child: Text(
                            "Account Already exists",
                            style: TextStyle(fontSize: 15),
                          ),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 70, right: 30, left: 30, bottom: 20),
          child: Container(
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      "Sign up",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    "Create your account",
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
                        return "Please Enter Username";
                      }
                      return null;
                    },
                    controller: namecontroller,
                    decoration: InputDecoration(
                        hintText: "Username",
                        hintStyle: const TextStyle(color: Colors.black45),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(20)),
                        filled: true,
                        fillColor: Colors.cyan[100],
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.black45,
                        )),
                  ),
                  const SizedBox(
                    height: 10,
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
                        ),),
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
                          name= namecontroller.text;
                          password= passwordcontroller.text;
                        });
                      }
                      registration();
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Center(
                        child: Text(
                          "Sign up",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?   "),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Login(),
                              ));
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
