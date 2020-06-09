import 'package:flutter/material.dart';
import 'package:nasobilka/Pages/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Násobilka',
      home: MainPage(),
    );
  }
}