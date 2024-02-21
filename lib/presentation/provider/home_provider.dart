import 'dart:math';
import 'package:flutter/material.dart';
import 'package:number_game/config/config.dart';

import '../../infreestructure/model/model.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    selectLevel();
  }
  int secretNumber = 0;
  GameModel game = GameModel(maxChance: 5, numberRange: 10, level: 'Facil');
  TextEditingController answerController = TextEditingController();
  double _valueSlider = 0;
  List<NumberModel> minorList = [];
  List<NumberModel> majorList = [];
  List<NumberModel> answerList = [];

  void checkAnswer(String value) {
    answerController.clear();
    if (!reviewValues(value)) return;
    final answer = int.parse(value);
    if (secretNumber == answer) {
      answerList.add(NumberModel(number: secretNumber, isCorrect: true));
      selectLevel();
      notifyListeners();
      return;
    }
    if (game.maxChance <= 1) {
      NotificationsService.showSnackbarError('Alcanzo el máximo de intentos');

      answerList.add(NumberModel(number: secretNumber, isCorrect: false));
      selectLevel();
      notifyListeners();
      return;
    }
    answer > secretNumber
        ? minorList.add(NumberModel(number: answer))
        : majorList.add(NumberModel(number: answer));

    game.maxChance--;
    notifyListeners();
  }

  bool reviewValues(String value) {
    if (value.isEmpty || value == '' || value == '0') {
      NotificationsService.showSnackbarError('Ingerese algun valor');
      return false;
    }
    if (int.parse(value) > game.numberRange) {
      NotificationsService.showSnackbarError(
          'El rango de maximo del numero es ${game.numberRange}');
      return false;
    }

    return true;
  }

  void selectLevel() {
    switch (valueSlider) {
      case 0:
        randomNumber(10, 5, 'Fácil');

        break;
      case 1:
        randomNumber(20, 8, 'Medio');

        break;
      case 2:
        randomNumber(100, 15, 'Avanzado');

        break;
      case 3:
        randomNumber(1000, 25, 'Extremo');

        break;

      default:
        randomNumber(10, 5, 'Fácil');
    }
  }

  void resetetGame() {
    answerController.clear();
    valueSlider = 0;
    answerList = [];
    selectLevel();
  }

  void randomNumber(int max, int maxChance, String name) {
    minorList = [];
    majorList = [];
    game.level = name;
    game.maxChance = maxChance;
    game.numberRange = max;
    secretNumber = Random().nextInt(max) + 1;
    notifyListeners();
  }

  double get valueSlider => _valueSlider;
  set valueSlider(double value) {
    _valueSlider = value;
    notifyListeners();
  }
}
