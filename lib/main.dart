import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          title: Text("Dicee"),
        ),
        body: DicePage(),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  var leftDiceNum = 1;
  var rightDiceNum = 1;

  void generateRandomNum() {
    leftDiceNum = Random().nextInt(6) + 1;
    rightDiceNum = Random().nextInt(6) + 1;
  }

  void resetDice() {
    leftDiceNum = 1;
    rightDiceNum = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              /* Expanded is the equivalent for layout_weight in native android dev */
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        generateRandomNum();
                      });
                      print('Left button was pressed');
                    },
                    child: Image.asset('images/dice$leftDiceNum.png')),
              ),
              Expanded(
                child: FlatButton(
                    onPressed: () {
                      setState(() {
                        generateRandomNum();
                      });
                      print('Right button was pressed');
                    },
                    child: Image.asset('images/dice$rightDiceNum.png')),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(21.0),
            child: RaisedButton(
              child: Text(
                "Reset",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                setState(() {
                  resetDice();
                });
              },
              color: Colors.blue[900],
            ),
          )
        ],
      ),
    );
  }
}
