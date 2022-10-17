import 'package:flutter/material.dart';
import 'package:flutter_calculator/my_buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var userInput = '';
  var userOutput = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[200],
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        userInput,
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                    ),
                    Container(
                        alignment: Alignment.bottomRight,
                        child: Text(userOutput,
                            style:
                                TextStyle(fontSize: 30, color: Colors.white))),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == 0) {
                      return MyButtons(
                        buttonTapped: () {
                          setState(() {
                            userInput = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    } else if (index == 1) {
                      return MyButtons(
                        buttonTapped: () {
                          setState(() {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else if (index == buttons.length - 1) {
                      return MyButtons(
                        buttonTapped: () {
                          setState(() {
                            business();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    } else {
                      return MyButtons(
                        buttonTapped: () {
                          setState(() {
                            userInput += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.pink[800]
                            : Colors.pink[500],
                        textColor: Colors.white,
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ));
  }

  bool isOperator(String value) {
    if (value == '%' ||
        value == '/' ||
        value == '*' ||
        value == '-' ||
        value == '+' ||
        value == '=') {
      return true;
    }
    return false;
  }

  void business() {
    String finalbus = userInput;

    Parser p = Parser();
    Expression exp = p.parse(finalbus);

    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userOutput = eval.toString();
  }
}
