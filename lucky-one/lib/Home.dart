import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:LuckyOne/common/widget/drawer.dart';
import 'package:LuckyOne/controller/MainController.dart';
import 'package:LuckyOne/ulti/AppTheme.dart';
import 'package:LuckyOne/view/ArrowApp.dart';
import 'package:LuckyOne/view/DiceApp.dart';
import 'package:LuckyOne/view/DrawCardApp.dart';
import 'package:LuckyOne/view/LuckyNumberApp.dart';
import 'package:LuckyOne/view/MatchListApp.dart';
import 'package:LuckyOne/view/ThreeCardsApp.dart';
import 'package:LuckyOne/view/WheelApp.dart';
import 'package:LuckyOne/view/splash_screen.dart';

class Home extends GetWidget<MainController> {
  //all function or variables of main.dart will be here
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var title = 'Lucky One';
    var screenID = controller.currentScreen.value;
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: AppTheme.nearlyBlack
    // ));

    return GetMaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      // initialRoute: contactView,
      home: Scaffold(
          backgroundColor: AppTheme.nearlyBlack,
          body: Container(child: Obx(() {
        if (controller.currentScreen.value == 1) {
          // Get.deleteAll();
          return DrawCardApp();
        }
        if (controller.currentScreen.value == 2) {
          // Get.deleteAll();
          return ThreeCardsApp();
        }
        if (controller.currentScreen.value == 3) {
          // Get.deleteAll();
          return ArrowApp();
        }
        if (controller.currentScreen.value == 4) {
          // Get.deleteAll();
          return WheelApp();
        }
        if (controller.currentScreen.value == 5) {
          // Get.deleteAll();
          return LuckyNumberApp();
        }
        if (controller.currentScreen.value == 6) {
          // Get.deleteAll();
          return MatchListApp();
        }
        // if (controller.currentScreen.value == 7) {
        //   // Get.deleteAll();
        //   return MatchListApp();
        // }
        if (controller.currentScreen.value == -1) {
          // Get.deleteAll();
          return SplashScreen();
        }
        return DiceApp();
      }))),
      getPages: [
        GetPage(name: '/dice_app', page: () => DiceApp()),
        GetPage(name: '/wheel_app', page: () => WheelApp()),
        GetPage(name: '/arrow_app', page: () => ArrowApp()),
        GetPage(name: '/lucky_number_app', page: () => LuckyNumberApp()),
        GetPage(name: '/match_list_app', page: () => MatchListApp()),
        GetPage(name: '/draw_card_app', page: () => DrawCardApp()),
        GetPage(name: '/three_cards_app', page: () => ThreeCardsApp()),
      ],
    );
  }
}
