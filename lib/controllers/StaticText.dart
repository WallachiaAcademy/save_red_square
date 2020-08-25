import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'BaseWidget.dart';

class StaticText extends BaseWidget {
  final double _xRatio;
  final double _yRatio;
  final String _text;

  final double _fontProc;

  TextPainter _painter;
  TextStyle _textStyle;

  Offset _position;

  StaticText(this._text, this._xRatio, this._yRatio, this._fontProc) {
    _painter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    _textStyle = TextStyle(
      color: Colors.white,
      fontSize: 0,
    );

    _painter.text = TextSpan(
      text: _text,
      style: _textStyle,
    );

    _painter.layout();
    _position = Offset(0, 0);
  }

  void render(Canvas canvas) {
    _painter.paint(canvas, _position);
  }

  void update() {}
  void resize(Size size) {
    _textStyle = TextStyle(
      color: Colors.white,
      fontSize: size.width * _fontProc,
    );

    _painter.text = TextSpan(
      text: _text,
      style: _textStyle,
    );

    _painter.layout();

    _position = Offset(
      size.width * _xRatio - (_painter.width * 0.5),
      size.height * _yRatio - (_painter.height * 0.5),
    );
  }

  void onTapDown(TapDownDetails details, Function fn) {}
}
