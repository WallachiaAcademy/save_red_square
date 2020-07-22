import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/controllers/TextedButton.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

import '../SaveRedSquare.dart';

class MenuScreen extends BaseScreen {
  TextedButton _startButton;

  MenuScreen() {
    _startButton = TextedButton("START", 0.5, 0.5);
  }
  @override
  void onTapDown(TapDownDetails details) {
    _startButton.onTapDown(details, () {
      saveRedSquare.switchScreen(ScreenState.kPlayGroundScreen);
    });
  }

  @override
  void render(Canvas canvas) {
    _startButton.render(canvas);
  }

  @override
  void resize(Size size) {
    _startButton.resize(size);
  }

  @override
  void update() {
    _startButton.update();
  }
}
