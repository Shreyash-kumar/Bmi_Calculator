import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'result_screen.dart';
import 'calculator.dart';



const double bottomContainerHeight = 60.0;
const Color containerColor = Color(0xFF1D1E33);
const Color bottomContainerColor = Color(0xFFEB1555);
const Color inactiveCardColor = Color(0xFF111328);
Color maleCardColor = inactiveCardColor;
Color femaleCardColor = inactiveCardColor;

double height = 170;
int weight = 60;
int age = 15;
String Bmi = '';
double bmi1 = 0.0 ;
String text1 = '';
enum Gender { male, female }

const newTextStyle = TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98));
const numberTextStyle = TextStyle(
  fontSize: 45.0,
  fontWeight: FontWeight.w900,
);

void changeCardColor(Gender option) {
  if (option == Gender.male) {
    if (maleCardColor == inactiveCardColor) {
      maleCardColor = containerColor;
      femaleCardColor = inactiveCardColor;
    } else {
      maleCardColor = inactiveCardColor;
    }
  } else if (option == Gender.female) {
    if (femaleCardColor == inactiveCardColor) {
      femaleCardColor = containerColor;
      maleCardColor = inactiveCardColor;
    } else {
      femaleCardColor = inactiveCardColor;
    }
  }
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        title: const Center(
          child: Text('BMI CALCULATOR',
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeCardColor(Gender.male);
                      });
                    },
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          SizedBox(
                            height: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.mars,
                            size: 80.0,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'MALE',
                            style: newTextStyle,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: maleCardColor,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        changeCardColor(Gender.female);
                      });
                    },
                    child: Container(
                      child: Column(
                        children: const <Widget>[
                          SizedBox(
                            height: 5.0,
                          ),
                          Icon(
                            FontAwesomeIcons.venus,
                            size: 80.0,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'FEMALE',
                            style: newTextStyle,
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: femaleCardColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: containerColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const SizedBox(height: 5.0),
                  const Center(
                    child: Text(
                      'HEIGHT',
                      style: newTextStyle,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.round().toString(),
                        style: numberTextStyle,
                      ),
                      const Text(
                        'cm',
                        style: newTextStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 200,
                    activeColor: bottomContainerColor,
                    inactiveColor: const Color(0xFF8D8E98),
                    divisions: 100,
                    label: height.toString(),
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: containerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('WEIGHT', style: newTextStyle),
                        Text('$weight', style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              splashColor: bottomContainerColor,
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                              splashColor: bottomContainerColor,
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: containerColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('AGE', style: newTextStyle),
                        Text('$age', style: numberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FloatingActionButton(
                              splashColor: bottomContainerColor,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },
                              child: Icon(Icons.remove, color: Colors.white),
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                            const SizedBox(width: 10.0),
                            FloatingActionButton(
                              splashColor: bottomContainerColor,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              child: Icon(Icons.add, color: Colors.white),
                              backgroundColor: const Color(0xFF4C4F5E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              setState(() {
                 bmi1 = calculate_bmi(height, weight) ;
                Bmi = calculate_bmi(height, weight).toStringAsFixed(1) ;
              });
               Navigator.push(context, MaterialPageRoute(builder: (context){
                 return const resultScreen();
               }));
               print('$Bmi');
            },
            child: Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
              child: const Center(
                child: Text('CALCULATE YOUR BMI',style: TextStyle(fontSize: 20.0 , fontWeight: FontWeight.w700),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  ReusableCard(@required this.colour);

  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: colour,
      ),
    );
  }
}
