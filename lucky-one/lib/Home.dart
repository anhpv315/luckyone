import 'package:flutter/material.dart';
import 'package:lucky_one/ulti/Randomize.dart';

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
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              // const DrawerHeader(
              //   decoration: BoxDecoration(
              //     color: Colors.blue,
              //   ),
              //   child: Text('Drawer Header'),
              // ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
      ),
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
