import 'package:flutter/material.dart';

class HomeViewController extends ChangeNotifier {
  int _scoreCasa = 0;
  int _scoreFora = 0;

  int get scoreCasa => _scoreCasa;
  int get scoreFora => _scoreFora;

  void incrementScoreCasa() {
    _scoreCasa++;
    notifyListeners();
  }

  void decrementScoreCasa() {
    if (_scoreCasa > 0) {
      _scoreCasa--;
      notifyListeners();
    }
  }

  void incrementScoreFora() {
    _scoreFora++;
    notifyListeners();
  }

  void decrementScoreFora() {
    if (_scoreFora > 0) {
      _scoreFora--;
      notifyListeners();
    }
  }

  void resetScore() {
    _scoreCasa = 0;
    _scoreFora = 0;
    notifyListeners();
  }
}
