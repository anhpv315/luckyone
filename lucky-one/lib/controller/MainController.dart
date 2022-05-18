import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:LuckyOne/ulti/Audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';

class MainController extends GetxController {
  var currentScreen = 0.obs;
  static const audioPath = 'audio/typing.mp3';
  late Audio audio;

  @override
  Future<void> onInit() async {
    currentScreen.value = -1;
    audio = new Audio(audioPath);
    // audio.playLocal();
    await Future.delayed(Duration(seconds: 9));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentScreen.value = prefs.getString('screenID') != null
        ? int.parse(prefs.getString('screenID').toString())
        : 0;
    super.onInit();
  }

  @override
  void onReady() {
    // initDataRoom();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }

  goToScreen(int num) {
    currentScreen.value = num;
    currentScreen.refresh();
  }
}
