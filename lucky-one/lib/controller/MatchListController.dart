import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MatchListController extends GetxController {
  var listResult = [].obs;
  var rolling = false.obs;
  var leftList = ['1', '2'].obs;
  var rightList = ['a', 'b'].obs;


  @override
  void onInit(){
    super.onInit();
  }


  newLeftList(List<String> list){
    leftList.value = list;
  }


  newRightList(List<String> list){
    rightList.value = list;
  }

}