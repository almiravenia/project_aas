//@dart=2.9
import 'package:aas/login_page.dart';
import 'package:aas/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:aas/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}