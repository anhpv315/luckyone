import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/controller/MainController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';
import 'package:lucky_one/view/DiceApp.dart';
import 'package:lucky_one/view/WheelApp.dart';

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
        color: AppTheme.notWhite,
        child:ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          SizedBox(
            height: 120,
            child: DrawerHeader(
              decoration: BoxDecoration(),
              child: Center(child: Text('LUCKY ONE', style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),)
              ),
            ),
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              main.currentScreen.value = 0;
            },
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              main.currentScreen.value = 4;
            },
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),
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
                  style: TextStyle(fontSize: 18, color: AppTheme.nearlyBlack),
                ),
              ],
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          Divider(color: AppTheme.nearlyBlack.withOpacity(0.8),),

        ],
      ),)
    );
  }
}
