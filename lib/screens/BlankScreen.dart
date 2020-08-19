import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/tap.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';

class BlankScreen extends BaseScreen {
  BlankScreen() {}
  @override
  void onTapDown(TapDownDetails details) {}

  @override
  void render(Canvas canvas) {}

  @override
  void resize(Size size) {}

  @override
  void update() {}
}
