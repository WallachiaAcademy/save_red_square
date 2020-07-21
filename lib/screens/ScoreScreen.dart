import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';

import '../SaveRedSquare.dart';
import 'ScreenState.dart';

class ScoreScreen extends BaseScreen {
  static const yellow = PaletteEntry(Colors.yellow);
  Size size = Size(0, 0);

  @override
  void onTapDown(TapDownDetails details) {
    print("TAP ON SCORE!!");

    saveRedSquare.switchScreen(ScreenState.kPlayGroundScreen);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), yellow.paint);
  }

  @override
  void resize(Size size) {
    this.size = size;
  }

  @override
  void update() {
    // TODO: implement update
  }
}
