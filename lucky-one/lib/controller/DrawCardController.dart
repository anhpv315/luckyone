import 'package:get/get.dart';
import 'package:lucky_one/ulti/Constant.dart';

class DrawCardController extends GetxController {

  var selected = ''.obs;
  var listResult =  List<String>.empty().obs;
  var cards = Constant().cardsWithNoJokers.obs;
  var drawing = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    cards = Constant().cardsWithNoJokers.obs;
    cards.shuffle();
    super.onInit();
  }

  refreshCards(){
    cards.value = Constant().cardsWithNoJokers;
    cards.shuffle();
    cards.refresh();
    listResult.length = 0;
    listResult.refresh();
    selected.value = '';
  }
  saveCards(String card){
    listResult.add(card);
    if(listResult.length > 3) {
      listResult.removeAt(0);
    }

  }

}