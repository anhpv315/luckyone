import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainController extends GetxController {
  var currentScreen = 0.obs;

  @override
  Future<void> onInit() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    currentScreen.value = prefs.getString('screenID') != null? int.parse(prefs.getString('screenID').toString()) : 0;
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
