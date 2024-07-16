import 'dart:io';

import 'package:deliveryappfood/cart_model.dart';
import 'package:deliveryappfood/onboarding1.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyCwVFN2xmaaBbCM_9ZMMTcByqzuvuK0Mhs",
              appId: "1:816502075206:android:98921ad1098384836b3f47",
              messagingSenderId: "816502075206",
              projectId: "fooddeliveryapp-5f0a1"))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => CartModel(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Onboarding1(),
        ));
  }
}
