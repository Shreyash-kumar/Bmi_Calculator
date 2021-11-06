import 'main.dart';
import 'package:flutter/material.dart';
import 'dart:math';

double temp = weight / pow(height / 100, 2);

void main() => runApp(resultScreen());

class resultScreen extends StatelessWidget {
  const resultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(
          child: Text(
            "RESULT",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: containerColor,
              ),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80.0),
                  if (bmi1 >= 25)
                    Text(
                      ' OVERWEIGHT ',
                      style: TextStyle(
                        color: Color(0xFFFFFF66),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else if (bmi1 > 18.5)
                    Text(
                      ' NORMAL ',
                      style: TextStyle(
                        color: Color(0xFF50C878),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    Text(
                      ' UNDERWEIGHT ',
                      style: TextStyle(
                        color: Color(0xFFB22222),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  SizedBox(
                    height: 90.0,
                  ),
                  Text(
                    Bmi,
                    style: TextStyle(
                      fontSize: 70.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 90.0,
                  ),
                  if (temp >= 25)
                    Text(
                      'You have a higher than normal body weight. Try to exercise more.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  else if (temp >= 18.5)
                    Text(
                      'You have a normal body weight. Good job!',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    )
                  else
                    Text(
                      'You have a lower than normal body weight. You can eat a bit more.',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 70.0,
              child: const Center(
                child: Text(
                  'RE-CALCULATE',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
