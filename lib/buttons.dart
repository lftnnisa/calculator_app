import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  Button({super.key,
    this.color,
    this.textColor,
    required this.buttonText,
    this.buttonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: MaterialButton(
              onPressed: buttonTapped,
              child: InkWell(
                borderRadius: BorderRadius.circular(50),
                child: Center(
                  child: Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }
}
