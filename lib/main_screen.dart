import 'package:flutter/material.dart';
import 'package:calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<String> buttons = [
    'C', '+/-', '%', 'DEL',
    '7', '8', '9', '÷',
    '4', '5', '6', '×',
    '1', '2', '3', '-',
    '0', '.', '=', '+',
  ];

  var userQuestion = '';
  var userAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appbar
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.pink[300],
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          //Input Section
          Expanded(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userQuestion,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                  ),
                  Container(
                      padding: EdgeInsets.all(16),
                      alignment: Alignment.centerRight,
                      child: Text(
                        userAnswer,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            height: 1,
            child: ColoredBox(color: Colors.black,),
          ),

          //Keyboard Section
          Expanded(
            flex: 7,
            child: Container(
              child: GridView.builder(
                  padding: EdgeInsets.all(16),
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    //clear button
                    if(index == 0){
                      return Button(
                        buttonTapped: (){
                          setState((){
                            userQuestion = '';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }

                    // delete button
                    else if(index == 18){
                      return Button(
                        buttonTapped: (){
                          setState((){
                            equalPressed();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.pink[300],
                        textColor: Colors.white,
                      );
                    }

                    // equal button
                    else if(index == 3){
                      return Button(
                        buttonTapped: (){
                          setState((){
                            userQuestion = userQuestion.substring(0, userQuestion.length-1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }

                    //button
                    else {
                      return Button(
                        buttonTapped: (){
                          setState((){
                            userQuestion += buttons[index];
                          });
                        },
                        buttonText: buttons[index],
                        color: isOperator(buttons[index])
                            ? Colors.pink[300]
                            : Colors.pink[100],
                        textColor: isOperator(buttons[index])
                            ? Colors.white
                            : Colors.pink[300],
                      );
                    }
                  }
              ),
            ),
          ),
        ],

      ),
    );
  }

  bool isOperator(String x){
    if(x == 'C' || x == '%' || x == '+/-' || x == 'DEL' || x == '÷' || x == '×' || x == '+' || x == '-' || x == '='){
      return true;
    }
    return false;
  }

  void equalPressed(){
    String finalQuestion = userQuestion;
    finalQuestion = finalQuestion.replaceAll('×', '*');
    finalQuestion = finalQuestion.replaceAll('÷', '/');
    finalQuestion = finalQuestion.replaceAll('+/-', '-');

    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    
    userAnswer = eval.toString();
  }
}


