import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:LuckyOne/ulti/Randomize.dart';

class ArrowController extends GetxController with SingleGetTickerProviderMixin {
  var spinning = false.obs;
  var direction = 0.0.obs;
  var oldDirection = 0.0.obs;

  setRandomDirection() {
    var random = Randomize().randomInRange(360);
    var random2 = Randomize().randomInRange(2);
    direction.value = oldDirection.value +
        (5 + random2 + double.parse((random / 360).toStringAsFixed(3)))
            .toDouble();
  }
}
