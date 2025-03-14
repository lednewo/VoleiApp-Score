import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  final String _scoreCasaKey = 'scoreCasa';
  final String _scoreForaKey = 'scoreFora';
  final String _historicoKey = 'historico';

  Future<void> saveScores(int scoreCasa, int scoreFora) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_scoreCasaKey, scoreCasa);
    await prefs.setInt(_scoreForaKey, scoreFora);
  }

  Future<Map<String, int>> loadScores() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return {
      'scoreCasa': prefs.getInt(_scoreCasaKey) ?? 0,
      'scoreFora': prefs.getInt(_scoreForaKey) ?? 0,
    };
  }

  Future<void> saveHistorico(List<String> historico) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_historicoKey, historico);
  }

  Future<List<String>> loadHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historicoKey) ?? [];
  }

  Future<void> clearHistorico() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historicoKey);
  }
}
