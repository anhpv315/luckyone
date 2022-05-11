import 'dart:math';

class Randomize {
  randomInRange(int max) {
    if (max < 1) return 0;
    Random random = new Random();
    int randomNumber1 = random.nextInt(max);
    // int half = (max / 2).truncate().toInt();
    // int ramdomNumber2 = random.nextInt(max) + half;
    // int ramdomNumber3 = ramdomNumber2 > max? ramdomNumber2 - max: ramdomNumber2;
    // return (randomNumber1 + ramdomNumber3) / 2;
    return randomNumber1;
  }

  randomDice() {
      return randomInRange(6) + 1;
  }
}
