import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/controllers/RedSquare.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class PlayGroundScreen extends BaseScreen {
  RedSquare _redSquare;

  PlayGroundScreen() {
    _redSquare = RedSquare();
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
  }

  @override
  void resize(Size size) {
    _redSquare.resize(size);
  }

  @override
  void update() {
    _redSquare.update();
  }
}
