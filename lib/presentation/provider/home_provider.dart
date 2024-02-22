import 'dart:math';
import 'package:flutter/material.dart';
import 'package:number_game/config/config.dart';
import '../../infreestructure/model/model.dart';
import '../../infreestructure/model/review_value_model.dart';

class HomeProvider extends ChangeNotifier {

  int secretNumber = 0;
  double _valueSlider = 0;
  TextEditingController answerController = TextEditingController();
  GameModel game = GameModel();
  List<NumberModel> minorList = [];
  List<NumberModel> majorList = [];
  List<NumberModel> answerList = [];

  void checkAnswer(String value) {
    answerController.clear();
    final answer = int.tryParse(value) ?? 0;

    List<ReviewValueModel> validationList = [
      ReviewValueModel(message: value.isEmpty? 'Ingerese algun valor': 'Ingerese un valor mayor a 0',compare: (answer <= 0),),
      ReviewValueModel(message: 'El rango de maximo del numero es ${game.numberRange}',compare: answer> game.numberRange),
      ReviewValueModel(
          compare: secretNumber == answer,
          function: () {answerList.add(NumberModel(number: secretNumber, isCorrect: true));selectLevel();}),
      ReviewValueModel(
          message: 'Alcanzo el máximo de intentos',
          compare: (game.maxChance <= 1),
          function: () {answerList.add(NumberModel(number: secretNumber, isCorrect: false));selectLevel();}),
    ];

    if (!reviewValuesCustom(validationList)) return;
    answer > secretNumber
        ? minorList.add(NumberModel(number: answer))
        : majorList.add(NumberModel(number: answer));

    game.maxChance--;
    notifyListeners();
  }

  bool reviewValuesCustom(List<ReviewValueModel> listCompare) {
    for (var i = 0; i < listCompare.length; i++) {
      if (listCompare[i].compare) {
        NotificationsService.showSnackbarError(listCompare[i].message);
        if(listCompare[i].function != null) listCompare[i].function!();
        notifyListeners();
        return false;
      }
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
