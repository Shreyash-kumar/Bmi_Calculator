import 'main.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'result_screen.dart';

double calculate_bmi(double height, int weight){

  height = height/100;
  double bmi = weight/pow(height, 2);

  return bmi ;

}








