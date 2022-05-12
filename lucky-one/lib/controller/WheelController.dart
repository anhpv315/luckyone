import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class WheelController extends GetxController {
  var listItems = ['Yes', 'No'].obs;
  var rolling = false.obs;
  var selected =  0.obs;
  var decrease = true.obs;
  var oldResult = ''.obs;

  @override
  void onInit(){
    super.onInit();
  }

  newList(List<String> list){
    listItems.value = list;
  }

  addItem(String item) {
    listItems.add(item);
  }

  deleteItem(int index){
    if(listItems.length>2){
      listItems.removeAt(index);
    }
  }

}