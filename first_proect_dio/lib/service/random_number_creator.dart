import 'dart:math';

class RandomNumberCreator {
  static int generateRandomNumber(int maxNumber) {
    Random randomNumber = Random();

    return randomNumber.nextInt(maxNumber);
  }
}
