import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:LuckyOne/controller/MainController.dart';
import 'package:LuckyOne/ulti/AppTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatelessWidget {
  final MainController main = Get.find();
  static const strText =  'Thắng bại tại nhân phẩm!      \nKhông phải tại thằng viết app...\n\n\nEnjoy it!';

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: AppTheme.nearlyBlack,
        body: GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: width * 0.6,
                  child: Image.asset('assets/images/logo.png'),
                ),
                Container(
                  // color: Colors.red,
                  height: 300,
                  padding: EdgeInsets.only(left: 60, right: 60, bottom: 100),
                    child:

                    Align(
                      alignment: Alignment.topLeft,
                      child:
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(

                            strText,
                            textStyle: const TextStyle(
                              fontSize: 20.0,
                              color: AppTheme.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'texgyrecursor'
                            ),
                            speed: const Duration(milliseconds: 84),
                          ),
                        ],
                        totalRepeatCount: 1,
                        pause: const Duration(milliseconds: 300),
                        displayFullTextOnTap: false,
                        stopPauseOnTap: false,
                        repeatForever: false,
                      )
                    )
                    ),
                Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      'Tap to skip',
                      style: TextStyle(color: AppTheme.nearlyWhite, fontSize: 16),
                    ))
              ],
            ),
          ),
          onTap: () async {
            print('tab');
            main.audio.stopAudio();
            main.currentScreen.value = 0;
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString('screenID', '0');
          },
        )
    );
  }
}
