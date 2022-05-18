import 'package:flutter/material.dart';
import 'package:grocery/pages/Login/login_screen.dart';
import 'package:grocery/styles/theme.dart';


void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeData,
      home: LoginScreen(),
    );
  }
}