import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/controllers/StaticText.dart';
import 'package:saveredsquare/controllers/TextedButton.dart';
import 'package:saveredsquare/data/DataHolder.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

import '../SaveRedSquare.dart';

class MenuScreen extends BaseScreen {
  TextedButton _startButton;
  StaticText _staticText;

  MenuScreen() {
    _startButton = TextedButton("START", 0.5, 0.5);
    _staticText =
        StaticText("Greetings, " + dataHolder.getUserName(), 0.5, 0.3, 0.07);
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
    _staticText.render(canvas);
  }

  @override
  void resize(Size size) {
    _startButton.resize(size);
    _staticText.resize(size);
  }

  @override
  void update() {
    _startButton.update();
  }
}
