import 'package:get/get.dart';

class LuckyNumberController extends GetxController {
  var rolling = false.obs;
  var listResult =  [''].obs;

  addResult(){
    if(listResult.length >= 4){
      listResult.length = 1;
    }else{
      listResult.add('');
    }
  }

}