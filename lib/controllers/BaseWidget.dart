import 'dart:ui';

import 'package:flutter/gestures.dart';

abstract class BaseWidget {
  void render(Canvas canvas);
  void update();
  void resize(Size size);
  void onTapDown(TapDownDetails details, Function fn);
}
