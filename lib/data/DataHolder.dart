import 'package:shared_preferences/shared_preferences.dart';

DataHolder dataHolder = DataHolder();

class DataHolder {
  int _bestScore = -1;
  int _curScore = 0;

  String _userName = "";

  static const _bestScoreKey = "__best_score___";
  static const _userNameKey = "__user_name___";

  DataHolder();

  Future loadData() async {
    final data = await SharedPreferences.getInstance();

    _bestScore = data.getInt(_bestScoreKey) ?? 0;
    _userName = data.getString(_userNameKey) ?? "";
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

  String getUserName() => _userName;

  void setUserName(String userName) {
    this._userName = userName;
    saveData();
  }

  Future saveData() async {
    final data = await SharedPreferences.getInstance();

    data.setInt(_bestScoreKey, _bestScore);
    data.setString(_userNameKey, _userName);
  }
}
