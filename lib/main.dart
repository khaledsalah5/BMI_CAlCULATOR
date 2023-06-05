import 'package:bmi_calc/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(BMICal());

class BMICal extends StatelessWidget {
  const BMICal({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      home: homeScreen()
    );
  }
}