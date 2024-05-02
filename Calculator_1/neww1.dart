//main.dart

import 'package:flutter/material.dart';
import 'package:flutterexam/Calculator_1/color.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:provider/provider.dart';


// void main(){
//   runApp(
//       MaterialApp(
//     home: CalculatorApp(),
//   ));
// }

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  //variables
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = "";
  var output = "";
  var operation = "";
  var hideInput = false;
  var outputSize = 3.0;

  onButtonClick(value){
    if(value == "AC"){
      input = "";
      output = "";
    }else if (value == "<"){
      if (input.isNotEmpty){
        input = input.substring(0,input.length-1);
      }
    }else if (value == "="){
      if (input.isNotEmpty){
        var userInput = input.replaceAll("x", "*");
        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if(output.endsWith(".0")){
          output = output.substring(0,output.length-2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;

      }
    }else{
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[600],
      body: Column(
          children: [
            //input output area
            Expanded(child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    hideInput ? "" : input,
                    style: TextStyle(
                      fontSize: 48,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    output,
                    style: TextStyle(
                      fontSize: outputSize,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            )),
            //buttons area
            Row(
              children: [
                button(text: "AC",
                    buttonBgColor: operatorColor, tColor: orangeColor),
                // button(text: "<", buttonBgColor: operatorColor, tColor: orangeColor),
                button(text: "%",  buttonBgColor: operatorColor, tColor: orangeColor
                ),
                button(text: "+ -",   buttonBgColor: operatorColor, tColor: orangeColor
                  //buttonBgColor: Colors.transparent
                ),
                button(text: "/", buttonBgColor: operatorColor, tColor: orangeColor
                ),
              ],
            ),
            Row(
              children: [
                button(text: "7",   tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "8",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "9",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "x", buttonBgColor: operatorColor, tColor: orangeColor

                ),
              ],
            ),
            Row(
              children: [
                button(text: "4",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "5",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "6",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "-",
                    tColor: orangeColor, buttonBgColor: operatorColor
                ),
              ],
            ),
            Row(
              children: [
                button(text: "1",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "2",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "3" ,  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "+",
                    buttonBgColor: operatorColor, tColor: orangeColor
                ),
              ],
            ),
            Row(
              children: [
                button(text: "00",  tColor: buttonColor, buttonBgColor: operatorColor
                ),
                button(text: "0",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: ".",  tColor: buttonColor, buttonBgColor: operatorColor),
                button(text: "=",
                    tColor: orangeColor, buttonBgColor: operatorColor
                ),
              ],
            ),
          ]),
    );
  }

  Widget button({
    text, tColor = Colors.white,  buttonBgColor ,
  }){
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)
            ),
            //backgroundColor: buttonBgColor,
            padding: const EdgeInsets.all(22),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              color: tColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

}