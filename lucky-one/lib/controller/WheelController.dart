import 'package:get/get.dart';

class WheelController extends GetxController {
  var listItems = ['1', '2'].obs;
  var rolling = false.obs;
  var selected =  0.obs;

  @override
  void onInit(){
    super.onInit();
  }

  addDice(String item) {
    listItems.add(item);
  }

  deleteItem(int index){
    listItems.removeAt(index);
  }

}