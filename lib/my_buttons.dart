import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonText;
  final color;
  final textColor;
  final buttonTapped;

  MyButtons(
      {required this.buttonText,
      required this.color,
      required this.textColor,
      this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Container(
          margin: EdgeInsets.all(3),
          alignment: Alignment.center,
          color: color,
          child: Text(
            buttonText,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
