import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

import '../SaveRedSquare.dart';

class MenuScreen extends BaseScreen {
  static const blue = PaletteEntry(Colors.blue);
  Size size = Size(0, 0);
  @override
  void onTapDown(TapDownDetails details) {
    print("TAP ON MENU SCREEN!");
    saveRedSquare.switchScreen(ScreenState.kPlayGroundScreen);
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), blue.paint);
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
