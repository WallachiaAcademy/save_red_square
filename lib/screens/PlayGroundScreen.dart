import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/controllers/RedSquare.dart';
import 'package:saveredsquare/controllers/ScoreHolder.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class PlayGroundScreen extends BaseScreen {
  RedSquare _redSquare;
  ScoreHolder _scoreHolder;

  PlayGroundScreen() {
    _redSquare = RedSquare();
    _scoreHolder = ScoreHolder(0.5, 0.1);
  }
  @override
  void onTapDown(TapDownDetails details) {
    _redSquare.onTapDown(details, () {
      saveRedSquare.switchScreen(ScreenState.kScoreScreen);
    });
  }

  @override
  void render(Canvas canvas) {
    _redSquare.render(canvas);
    _scoreHolder.render(canvas);
  }

  @override
  void resize(Size size) {
    _redSquare.resize(size);
    _scoreHolder.resize(size);
  }

  @override
  void update() {
    _redSquare.update();
    _scoreHolder.update();
  }
}
