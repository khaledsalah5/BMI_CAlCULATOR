import 'dart:math';

import 'package:bmi_calc/result.dart';
import 'package:flutter/material.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  double height = 150;
  int weight = 60, age = 30;
  bool isMale =true;
  Color cc=Colors.blue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: GestureDetector(
                      onTap: () {setState(() {
                        isMale=true;
                      });},
                      child: Container(
                                      margin: const EdgeInsets.all(10),
                                      // height: 140,
                                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: isMale?cc:Colors.grey[400],
                                      ),
                                      child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.male,
                          size: 70,
                        ),
                        Text(
                          'MALE',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                                      ),
                                    ),
                    )),
                Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale=false;
                        });
                        
                      },
                      child: Container(
                                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: !isMale? cc :Colors.grey[400]),
                                      margin: const EdgeInsets.all(10),
                                      child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.female,
                          size: 70,
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                                      ),
                                      // height: 140,
                                    ),
                    ))
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[400],
              ),
              margin: const EdgeInsets.all(10),
              // height: 140,
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text('HEIGHT'),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${height.round()}',
                        style: const TextStyle(fontSize: 40),
                      ),
                      const Text('cm')
                    ],
                  ),
                  Slider(
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                    max: 220,
                    min: 100,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    //height: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT'),
                        Text(
                          '$weight',
                          style: const TextStyle(fontSize: 33),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              mini: true,
                              onPressed: () {setState(() {
                                weight++;
                              });},
                              heroTag: 'Weight++',
                              child: const Icon(Icons.add),
                            ),
                            FloatingActionButton.small(
                              onPressed: () {setState(() {
                                weight--;
                              });},
                              heroTag: "weight--",
                              child: const Icon(Icons.remove),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    //height: 140,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE'),
                        Text(
                          '$age',
                          style: const TextStyle(fontSize: 33),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              heroTag: 'age++',
                              mini: true,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: const Icon(Icons.add),
                            ),
                            FloatingActionButton.small(
                              heroTag: 'age--',
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: const Icon(Icons.remove),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 50,
        onPressed: () {
          double res = weight/ pow(height/100, 2);
          print(res);

          Navigator.push(context, MaterialPageRoute(builder: (context)=>result(isMale: isMale,res: res,age: age,)));
        },
        color: Colors.red,
        child: const Text(
          'CALCULATE',
        ),
      ),
    );
  }
}
