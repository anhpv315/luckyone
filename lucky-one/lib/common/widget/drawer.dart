import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucky_one/controller/MainController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  final MainController main = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        backgroundColor: AppTheme.white,
        child: Container(
          color: AppTheme.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 120,
                child: DrawerHeader(
                  decoration: BoxDecoration(color: AppTheme.nearlyBlack),
                  child: Center(
                      child: Text(
                    'LUCKY ONE',
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.nearlyWhite),
                  )),
                ),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/dices.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Rolling Dice',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  main.currentScreen.value = 0;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '0');
                },
              ),
              Divider(
                color: AppTheme.nearlyBlack.withOpacity(0.8),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/cards.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Drawing cards',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  main.currentScreen.value = 1;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '1');
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/3cards.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      '3 cards',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  main.currentScreen.value = 2;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '2');
                },
              ),
              Divider(
                color: AppTheme.nearlyBlack.withOpacity(0.8),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/compass.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Spinning',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  main.currentScreen.value = 3;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '3');
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/wheel.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Spinning wheel',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  main.currentScreen.value = 4;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '4');
                },
              ),
              Divider(
                color: AppTheme.nearlyBlack.withOpacity(0.8),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/numbers.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Choosing numbers',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  main.currentScreen.value = 5;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '5');
                },
              ),
              Divider(
                color: AppTheme.nearlyBlack.withOpacity(0.8),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/lists.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Matching 2 lists',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  main.currentScreen.value = 6;
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString('screenID', '6');
                },
              ),
              Divider(
                color: AppTheme.nearlyBlack.withOpacity(0.8),
              ),
              ListTile(
                title: Row(
                  children: [
                    Tab(
                      icon: new Image.asset("assets/icons/donate.png"),
                      height: 30,
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Share your luck!',
                      style:
                          TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                    ),
                  ],
                ),
                onTap: () async {
                  // main.currentScreen.value = 0;
                  // SharedPreferences prefs =
                  //     await SharedPreferences.getInstance();
                  // prefs.setString('screenID', '0');
                },
              ),
            ],
          ),
        ));
  }
}
