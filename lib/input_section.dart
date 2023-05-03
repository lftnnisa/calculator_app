import 'package:flutter/material.dart';

class InputSection extends StatefulWidget {
  const InputSection({Key? key}) : super(key: key);

  @override
  State<InputSection> createState() => _InputSectionState();
}

class _InputSectionState extends State<InputSection> {

  var userQuestion = 'question';
  var userAnswer = 'answer';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(userQuestion),
                Text(userAnswer),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
