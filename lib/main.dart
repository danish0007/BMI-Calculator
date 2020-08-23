import 'package:flutter/material.dart';
import 'First_Page.dart';

void main() {
  runApp(First());
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: FirstPage(),
    );
  }
}
