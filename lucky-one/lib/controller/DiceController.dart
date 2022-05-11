import 'package:get/get.dart';

class DiceController extends GetxController {
  var listDiceFaces = List<int>.empty().obs;

  addDice() {
      if(listDiceFaces.length >= 4){
        listDiceFaces.length = 0;
        listDiceFaces.add(6);
        return;
      }
      listDiceFaces.add(6);
  }

}