import 'package:shared_preferences/shared_preferences.dart';

DataHolder dataHolder = DataHolder();

class DataHolder {
  int _bestScore = -1;
  int _curScore = 0;

  static const _bestScoreKey = "__best_score___";

  DataHolder();

  Future loadData() async {
    final data = await SharedPreferences.getInstance();

    _bestScore = data.getInt(_bestScoreKey) ?? 0;
  }

  void setNewScore(int score) {
    _curScore = score;
    if (_curScore > _bestScore) {
      _bestScore = _curScore;
      saveData();
    }
  }

  int getCurScore() => _curScore;

  int getBestScore() => _bestScore;

  Future saveData() async {
    final data = await SharedPreferences.getInstance();

    data.setInt(_bestScoreKey, _bestScore);
  }
}
