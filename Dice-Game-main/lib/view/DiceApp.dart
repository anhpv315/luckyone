
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  //if data comes from another page then all the variables, names and function will be here
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //all function or variables of main.dart will be here

  int leftDiceNumber =1;
  int rightDiceNumber =6;

  void changeDiceFace(){
    //to update things we use setstate()
    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6)+1;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigoAccent,
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                onPressed: (){
                  changeDiceFace();
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
            Expanded(
              child: FlatButton(
                onPressed: (){
                  changeDiceFace();
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
