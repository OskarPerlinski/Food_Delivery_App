// ignore_for_file: avoid_unnecessary_containers, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Forgotpassword extends StatelessWidget {
  const Forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailcont = TextEditingController();
    forgotpassword(String email) async {
      if (email == "") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
          "Enter your email address to reset your password",
        )));
      } else {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Email sent Successfully!")));
      }
    }
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Reset Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 30, left: 30),
        child: Container(
          child: Column(
            children: [
              const Center(
                  child: Text(
                "Enter your email addres to reset your password",
                style: TextStyle(color: Colors.black45, fontSize: 14),
              )),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailcont,
                decoration: InputDecoration(
                  hintText: "Email",
                  hintStyle: const TextStyle(color: Colors.black45),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20)),
                  filled: true,
                  fillColor: Colors.cyan[100],
                  prefixIcon: const Icon(
                    Icons.email,
                    color: Colors.black45,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () {
                    forgotpassword(emailcont.text.toString());
                  },
                  child: const Text(
                    'Reset Password',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
