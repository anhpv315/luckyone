import 'package:get/get.dart';
import 'package:lucky_one/ulti/Constant.dart';

class ThreeCardsController extends GetxController {

  var listTopResult =  List<String>.empty().obs;
  var listBottomResult =  List<String>.empty().obs;
  var cards = Constant().cardsWithOnlyNumber.obs;
  var drawing = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    cards = Constant().cardsWithOnlyNumber.obs;
    super.onInit();
  }

  refreshCards(){
    cards.value = Constant().cardsWithOnlyNumber;
    listTopResult.length = 0;
    listBottomResult.length = 0;
    cards.refresh();
    listBottomResult.refresh();
    listTopResult.refresh();
  }

}