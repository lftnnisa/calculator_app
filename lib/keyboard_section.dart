import 'package:flutter/material.dart';
import 'package:calculator_app/buttons.dart';
import 'package:calculator_app/input_section.dart';

class KeyboardSection extends StatelessWidget {
  KeyboardSection({Key? key}) : super(key: key);

  final List<String> buttons = [
    'C', '(', ')', '÷',
    '7', '8', '9', '×',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '0', '.', 'DEL', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      
      flex: 7,
      child: Container(
        child: GridView.builder(
          padding: EdgeInsets.all(16),
            itemCount: buttons.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context, int index) {
              return Button(
                buttonTapped: (){
                  setState
                },
                buttonText: buttons[index],
                color: isOperator(buttons[index]) ? Colors.pink[300] : Colors.pink[100],
                textColor: Colors.white,
              );
            }
        ),
      ),
    );
  }

  bool isOperator(String x){
    if(x == 'C' || x == ')' || x == '(' || x == 'DEL' || x == '÷' || x == '×' || x == '+' || x == '-' || x == '='){
      return true;
    }
    return false;
  }
}

