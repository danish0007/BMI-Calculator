import 'First_Page.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'Bmi_ Brain.dart';

class Result_Page extends StatelessWidget {
  Result_Page(
      {@required this.bmi, @required this.result, @required this.advice});

  final String bmi;
  final String result;
  final String advice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 15,
            ),
            Text(
              'Your  Result: ',
              style: TextStyle(fontSize: 40, color: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                color: activecolor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      result.toUpperCase(),
                      style: TextStyle(color: Color(0xff24D876), fontSize: 25),
                    ),
                    Text(
                      bmi,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 65,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      advice,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstPage()),
                );
              },
              child: Container(
                margin: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFEB1555),
                    borderRadius: BorderRadius.circular(12)),
                height: 50,
                child: Center(
                  child: Text(
                    'RE - CALCULATE',
                    style: TextStyle(
                        color: Colors.white, letterSpacing: 1, fontSize: 30),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
