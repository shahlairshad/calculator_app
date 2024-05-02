import 'package:flutter/material.dart';

import 'package:flutterexam/Calculator_app/calculator_new/provider/providerr.dart';
import 'package:provider/provider.dart';

import 'neww1.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CalculatorProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorApp(),
    ),
  ));
}
