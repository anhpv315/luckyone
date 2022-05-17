
import 'dart:io';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';


class MainController extends GetxController {
  var currentScreen = 0.obs;
  AudioPlayer audioPlayer = AudioPlayer();
static const audioPath = 'assets/audio/typing.mp3';
  @override
  Future<void> onInit() async {
    currentScreen.value = -1;
    playLocal();
    await Future.delayed(Duration(seconds: 8));

    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentScreen.value = prefs.getString('screenID') != null? int.parse(prefs.getString('screenID').toString()) : 0;
    super.onInit();
  }

  playLocal() async {
    var str = (await getTemporaryDirectory()).path != null? (await getTemporaryDirectory()).path : '' ;
    final file = new File((str+'/typing.mp3'));
    await file.writeAsBytes((await loadAsset()).buffer.asUint8List());
    int result = await audioPlayer.play(file.path, isLocal: true);
  }

  Future<ByteData> loadAsset() async {
    return await rootBundle.load('assets/audio/typing.mp3');
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
