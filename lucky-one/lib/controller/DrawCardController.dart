import 'package:get/get.dart';
import 'package:lucky_one/ulti/Constant.dart';

class DrawCardController extends GetxController {
  var selected = ''.obs;
  var listResult = List<String>.empty().obs;
  var cards = Constant().cardsWithNoJokers.obs;
  var drawing = false.obs;
  var listDistances = List<double>.empty().obs;

  var vertical = 0.obs;
  var test = 0.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    cards = Constant().cardsWithNoJokers.obs;
    for (var i = 0; i < cards.length; i++) {
      listDistances.add(0);
    }
    vertical.value = 40;
    cards.shuffle();
    super.onInit();
  }

  refreshCards() async {
    listResult.length = 0;
    listResult.refresh();
    cards.value = Constant().cardsWithNoJokers;
    for (var i = 0; i < cards.length; i++) {
      listDistances.value[i] = 0;
    }
    await Future.delayed(Duration(milliseconds: 400));

    vertical.value = 5;
    vertical.refresh();
    await Future.delayed(Duration(milliseconds: 400));
    cards.shuffle();
    cards.refresh();
    listResult.refresh();
    selected.value = '';
    vertical.value = 40;
    vertical.refresh();
  }

  updateCard(int index, String value) async {
    var temp = cards.value[index];
    listResult.add(temp);
    if (listResult.length > 3) {
      listResult.removeAt(0);
    }

    listDistances.value[index] = 40;
    listDistances.refresh();
    await Future.delayed(Duration(milliseconds: 300));
    cards.value[index] = value;
    cards.refresh();
    await Future.delayed(Duration(milliseconds: 200));

    selected.value = temp;
    selected.refresh();
  }

}
