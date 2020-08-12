import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/controllers/ScoreText.dart';
import 'package:saveredsquare/controllers/TextedButton.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';

import '../SaveRedSquare.dart';
import 'ScreenState.dart';

class ScoreScreen extends BaseScreen {
  TextedButton _replay;
  ScoreText _curScore;
  ScoreText _bestScore;

  Size size = Size(0, 0);

  //TODO: remove this later.
  int getDummyScore() {
    return 100;
  }

  ScoreScreen() {
    _replay = TextedButton('RESTART', 0.5, 0.5);
    _curScore = ScoreText('SCORE: ', getDummyScore, 0.5, 0.2);
    _bestScore = ScoreText('BEST: ', getDummyScore, 0.5, 0.3);
  }

  @override
  void onTapDown(TapDownDetails details) {
    _replay.onTapDown(details, () {
      saveRedSquare.switchScreen(ScreenState.kPlayGroundScreen);
    });
  }

  @override
  void render(Canvas canvas) {
    _replay.render(canvas);
    _curScore.render(canvas);
    _bestScore.render(canvas);
  }

  @override
  void resize(Size size) {
    this.size = size;

    _replay.resize(size);
    _curScore.resize(size);
    _bestScore.resize(size);
  }

  @override
  void update() {}
}
