import 'package:flame/palette.dart';
import 'package:flutter/material.dart';
import 'package:saveredsquare/controllers/BaseWidget.dart';

class RedSquare extends BaseWidget {
  static const blue = PaletteEntry(Colors.blue);
  static const red = PaletteEntry(Colors.red);

  double _horizontalSpeed = 5;
  double _horizontalSign = 1;

  double _verticalSpeed = 0;
  double _verticalSign = 1;

  double _x = 0;
  double _y = 0;

  double _width = 0;
  double _height = 0;

  Size size = Size(0, 0);

  bool _isGameOver = false;

  @override
  void render(Canvas canvas) {
    canvas.drawRect(
      Rect.fromLTWH(_x, _y, _width, _height),
      (_isSquareSafe() ? blue.paint : red.paint),
    );
  }

  @override
  void update() {
    _updateSpeed();
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
  void onTapDown(TapDownDetails details, Function fn) {
    _calcSign();
  }

  void _updateSpeed() {
    if (_horizontalSpeed < 10) _horizontalSpeed += 0.001;

    if (_horizontalSpeed > 6 && _horizontalSpeed < 10) _verticalSpeed += 0.002;
  }

  void _calcPosition() {
    _x += _horizontalSpeed * _horizontalSign;
    _y += _verticalSpeed * _verticalSign;

    if (_x < 0 ||
        _x + _width > size.width ||
        _y < 0 ||
        _y + _height > size.height) {
      _isGameOver = true;
    }
  }

  void _calcSign() {
    if (!_isXSafe()) {
      _horizontalSign *= -1;
    }

    if (!_isYSafe()) {
      _verticalSign *= -1;
    }
  }

  bool _isSquareSafe() {
    return _isXSafe() && _isYSafe();
  }

  bool _isXSafe() {
    if (_x < size.width - _width * 2 && _x > _width) {
      return true;
    }
    return false;
  }

  bool _isYSafe() {
    if (_y < size.height - _height * 2 && _y > _height) {
      return true;
    }
    return false;
  }

  bool isGameOver() {
    return _isGameOver;
  }
}
