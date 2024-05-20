import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(DiceRollerApp());

class DiceRollerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DiceApp',
      home: HomePage(),
    );
  }

}