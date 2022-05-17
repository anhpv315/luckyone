import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/controller/MainController.dart';
import 'package:lucky_one/ulti/AppTheme.dart';


import 'Home.dart';


void main(){
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(MainController());
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      color: AppTheme.nearlyBlack,
      debugShowCheckedModeBanner: false,
      home: Home(),

    );
  }
}
