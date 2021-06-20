import 'package:calculator/buttons2.dart';
import 'package:calculator/color.dart';
import 'package:flutter/material.dart';
import 'buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int firstNumber;
  late int secondNumber;
  String history = '';
  String textToDisplay = '';
  late String res;
  late String operation;

  void btnOnClick(String btnValue) {
    print(btnValue);
    if (btnValue == '<') {
      res = textToDisplay.substring(0, textToDisplay.length - 1);
    } else if (btnValue == '.') {
      res = textToDisplay + '.';
    } else if (btnValue == '+/-') {
      if (textToDisplay[0] != '-') {
        res = '-' + textToDisplay;
      } else {
        res = textToDisplay.substring(1);
      }
    } else if (btnValue == 'AC') {
      textToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      res = '';
      history = '';
    } else if (btnValue == 'C') {
      textToDisplay = '';
      firstNumber = 0;
      secondNumber = 0;
      res = '';
    } else if (btnValue == '+' ||
        btnValue == '-' ||
        btnValue == '*' ||
        btnValue == '/') {
      firstNumber = int.parse(textToDisplay);
      res = '';
      operation = btnValue;
    } else if (btnValue == '=') {
      secondNumber = int.parse(textToDisplay);
      textToDisplay = '';
      if (operation == '+') {
        res = (firstNumber + secondNumber).toString();
        history = history +
            firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '-') {
        res = (firstNumber - secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '*') {
        res = (firstNumber * secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
      if (operation == '/') {
        res = (firstNumber / secondNumber).toString();
        history = firstNumber.toString() +
            operation.toString() +
            secondNumber.toString();
      }
    } else {
      res = textToDisplay + btnValue;
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBlue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xFF152238),
        title: Text("Calculator"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 140.0),
                    Container(
                      child: Text(
                        history,
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment(1.0, 1.0),
                    ),
                    SizedBox(height: 5.0),
                    Container(
                      child: Text(
                        textToDisplay,
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      alignment: Alignment(1.0, 1.0),
                    ),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons2(num: 'AC', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: 'C', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: '<', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: '+/-', callback: btnOnClick),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons2(num: '+', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: '-', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: '*', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons2(num: '/', callback: btnOnClick),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons(num: '1', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '2', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '3', callback: btnOnClick),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons(num: '4', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '5', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '6', callback: btnOnClick),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons(num: '7', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '8', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '9', callback: btnOnClick),
                      ],
                    ),
                    SizedBox(height: 1.0),
                    Row(
                      children: [
                        SizedBox(width: 1.0),
                        buttons(num: '.', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '0', callback: btnOnClick),
                        SizedBox(width: 1.0),
                        buttons(num: '=', callback: btnOnClick),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
