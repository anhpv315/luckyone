import 'package:flutter/material.dart';
import 'package:lucky_one/common/widget/drawer.dart';

class DiceApp extends StatefulWidget {
  const DiceApp({Key? key}) : super(key: key);
  //if data comes from another page then all the variables, names and function will be here
  @override
  _DiceAppState createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  //all function or variables of main.dart will be here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      // appBar: AppBar(
      //   title: Text('DiceApp'),
      //   centerTitle: true,
      //   backgroundColor: Colors.blue,
      // ),
      body: Center(

      )
    );
  }
}
