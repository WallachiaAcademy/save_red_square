import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';

class SaveRedSquare extends Game with TapDetector {
  @override
  void render(Canvas canvas) {}

  @override
  void update(double t) {}

  @override
  void resize(Size size) {
    // TODO: implement
  }

  void onTapDown(TapDownDetails details) {
    //TODO: implement
    print("TAP!");
  }
}
