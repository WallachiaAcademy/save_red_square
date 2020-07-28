import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:saveredsquare/controllers/BaseWidget.dart';

class RedSquare extends BaseWidget {
  static const blue = PaletteEntry(Colors.blue);

  double _horizontalSpeed = 5;
  double _horizontalSign = 1;

  double _x = 0;
  double _y = 0;

  double _width = 0;
  double _height = 0;

  Size size = Size(0, 0);

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(_x, _y, _width, _height), blue.paint);
  }

  @override
  void update() {
    _updateSpeed();
    _calcSign();
    _calcPosition();
  }

  @override
  void resize(Size size) {
    this.size = size;

    final ratio = size.height / size.width;

    _width = size.width * 0.1 * ratio;
    _height = size.height * 0.1;

    _x = 0;
    _y = (size.height - _height) / 2;
  }

  @override
  void onTapDown(TapDownDetails details, Function fn) {}

  void _updateSpeed() {
    if (_horizontalSpeed < 10) _horizontalSpeed += 0.001;
  }

  void _calcPosition() {
    _x += _horizontalSpeed * _horizontalSign;
  }

  void _calcSign() {
    if (_x > size.width - _width * 2) {
      _horizontalSign = -1;
    } else if (_x < _width) {
      _horizontalSign = 1;
    }
  }
}
