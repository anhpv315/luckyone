import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lucky_one/ulti/Constant.dart';

class ThreeCardsController extends GetxController {

  var listTopResult =  List<Map>.empty().obs;
  var listBottomResult =  List<Map>.empty().obs;
  var cards = Constant().cardsWithOnlyNumber.obs;
  var drawing = false.obs;
  var listKey1 = List<GlobalKey<FlipCardState>>.empty().obs;
  var listKey2 = List<GlobalKey<FlipCardState>>.empty().obs;

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