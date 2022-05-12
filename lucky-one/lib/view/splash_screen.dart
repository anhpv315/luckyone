import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lucky_one/Home.dart';
import 'package:lucky_one/ulti/AppTheme.dart';

class SplashScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), (){
      Get.to(Home());
    });

    return Scaffold(
      backgroundColor: AppTheme.nearlyBlack,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}