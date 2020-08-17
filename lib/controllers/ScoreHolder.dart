import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'BaseWidget.dart';

class ScoreHolder extends BaseWidget {
  final double _xRatio;
  final double _yRatio;

  TextPainter _painter;
  TextStyle _textStyle;

  Offset _position;

  double _score;

  DateTime _lastCalc;

  Function _fnUpdate;
  int _digits;

  Size _size = Size(0, 0);

  ScoreHolder(this._xRatio, this._yRatio) {
    _score = 0;
    _digits = 1;

    _painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 0,
    );

    _painter.text =
        TextSpan(text: _score.toInt().toString(), style: _textStyle);

    _painter.layout();
    _position = Offset(0, 0);

    _fnUpdate = _init;
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }

  void update() {
    _fnUpdate();
  }

  void _update() {
    _score += (DateTime.now().difference(_lastCalc).inMilliseconds) / 100;
    _lastCalc = DateTime.now();

    if ((_score > 10 && _digits < 2) ||
        (_score > 100 && _digits < 3) ||
        (_score > 1000 && _digits < 4)) {
      _digits++;
      resize(_size);
    } else {
      _painter.text =
          TextSpan(text: _score.toInt().toString(), style: _textStyle);
      _painter.layout();
    }
  }

  void _init() {
    _fnUpdate = _update;
    _lastCalc = DateTime.now();
  }

  void resize(Size size) {
    _textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.width * 0.1,
    );

    _painter.text =
        TextSpan(text: _score.toInt().toString(), style: _textStyle);

    _painter.layout();

    _position = Offset(
      size.width * _xRatio - (_painter.width * 0.5),
      size.height * _yRatio - (_painter.height * 0.5),
    );

    _size = size;
  }

  void onTapDown(TapDownDetails details, Function fn) {}

  int getScore() {
    return _score.toInt();
  }
}
