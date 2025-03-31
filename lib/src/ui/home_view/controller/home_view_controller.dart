import 'package:flutter/material.dart';
import 'package:placar_volei/src/service/storage_service.dart';

class HomeViewController extends ChangeNotifier {
  int _scoreCasa = 0;
  int _scoreFora = 0;
  List<String> _historico = [];
  final StorageService _storageService = StorageService();

  int get scoreCasa => _scoreCasa;
  int get scoreFora => _scoreFora;
  List<String> get historico => _historico;

  HomeViewController() {
    _loadData();
  }

  Future<void> _loadData() async {
    var scores = await _storageService.loadScores();
    _scoreCasa = scores['scoreCasa']!;
    _scoreFora = scores['scoreFora']!;
    _historico = await _storageService.loadHistorico();
    notifyListeners();
  }

  void incrementScoreCasa() {
    if (_scoreCasa < 99) {
      _scoreCasa++;
      _saveScores();
      notifyListeners();
    } else {
      _scoreCasa = 0;
    }
  }

  void decrementScoreCasa() {
    if (_scoreCasa > 0) {
      _scoreCasa--;
      _saveScores();
      notifyListeners();
    }
  }

  void _saveScores() {
    _storageService.saveScores(_scoreCasa, _scoreFora);
  }

  void _saveHistorico() {
    _storageService.saveHistorico(_historico);
  }

  void incrementScoreFora() {
    if (_scoreFora < 99) {
      _scoreFora++;
      _saveScores();
      notifyListeners();
    } else {
      _scoreFora = 0;
    }
  }

  void decrementScoreFora() {
    if (_scoreFora > 0) {
      _scoreFora--;
      _saveScores();
      notifyListeners();
    }
  }

  void clearHistorico(int index) {
    if (index >= 0 && index < _historico.length) {
      _historico.removeAt(index);
      _storageService.clearHistorico();
      notifyListeners();
    }
  }

  void resetScore() {
    if (_scoreCasa > 0 || _scoreFora > 0) {
      String resultado = 'Casa $scoreCasa x $_scoreFora Fora';
      _historico.add(resultado);
      _saveHistorico();
    }
    _scoreCasa = 0;
    _scoreFora = 0;
    _saveScores();
    notifyListeners();
  }
}
