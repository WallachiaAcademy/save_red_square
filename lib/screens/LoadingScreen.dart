import 'dart:async';
import 'dart:ui';

import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/controllers/StaticText.dart';
import 'package:saveredsquare/data/DataHolder.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class LoadingScreen extends BaseScreen {
  StaticText _loadingText;
  double _progress = 0;

  static const white = PaletteEntry(Colors.white);

  Size size = Size(0, 0);

  LoadingScreen() {
    _loadingText = StaticText("LOADING", 0.5, 0.4, 0.1);
    Timer.periodic(Duration(milliseconds: 10), (timer) {
      _progress += 1;
      if (_progress >= 100) {
        timer.cancel();
        if (dataHolder.getUserName() == "") {
          saveRedSquare.switchScreen(ScreenState.kSetUserScreen);
        } else {
          saveRedSquare.switchScreen(ScreenState.kMenuScreen);
        }
      }
    });
  }
  @override
  void onTapDown(TapDownDetails details) {}

  @override
  void render(Canvas canvas) {
    _loadingText.render(canvas);

    canvas.drawRect(
        Rect.fromLTWH(size.width * 0.1, size.height * 0.5,
            size.width * 0.8 * (_progress / 100), size.height * 0.05),
        white.paint);
  }

  @override
  void resize(Size size) {
    this.size = size;
    _loadingText.resize(size);
  }

  @override
  void update() {
    _loadingText.update();
  }
}
