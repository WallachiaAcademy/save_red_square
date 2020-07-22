import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class PlayGroundScreen extends BaseScreen {
  static const red = PaletteEntry(Colors.red);
  Size size = Size(0, 0);

  //TODO: FIX THE POSITION by doing _painter.width/2
  @override
  void onTapDown(TapDownDetails details) {
    print("TAP ON PLAY GROUND!!");
    saveRedSquare.switchScreen(ScreenState.kScoreScreen);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), red.paint);
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
