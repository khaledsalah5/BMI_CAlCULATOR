import 'package:flutter/material.dart';

class result extends StatelessWidget {
  late bool isMale;
  late double res;
  late int age;
  result({super.key, this.isMale = true, this.res = 0,required this.age});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender is : ${isMale ? 'Male' : 'Female'}',
              style: const TextStyle(fontSize: 35),
            ),
            Text('Age : $age',style: const TextStyle(fontSize: 35),),
            Text(
              'Result is ${res.toStringAsFixed(3)}',
              style: const TextStyle(fontSize: 35),
            )
          ],
        ),
      ),
    );
  }
}
