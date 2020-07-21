import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/gestures.dart';
import 'package:flutter/cupertino.dart';
import 'package:saveredsquare/screens/BaseScreen.dart';
import 'package:saveredsquare/screens/MenuScreen.dart';
import 'package:saveredsquare/screens/PlayGroundScreen.dart';
import 'package:saveredsquare/screens/ScoreScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

SaveRedSquare saveRedSquare = SaveRedSquare();

class SaveRedSquare extends Game with TapDetector {
  ScreenState _screenState;
  BaseScreen _menuScreen;
  BaseScreen _playGroundScreen;
  BaseScreen _scoreScreen;

  SaveRedSquare() {
    _screenState = ScreenState.kMenuScreen;

    _menuScreen = MenuScreen();
    _playGroundScreen = PlayGroundScreen();
    _scoreScreen = ScoreScreen();
  }
  @override
  void render(Canvas canvas) {
    _getActiveScreen()?.render(canvas);
  }

  @override
  void update(double t) {
    _getActiveScreen()?.update();
  }

  @override
  void resize(Size size) {
    _menuScreen?.resize(size);
    _playGroundScreen?.resize(size);
    _scoreScreen?.resize(size);
  }

  void onTapDown(TapDownDetails details) {
    _getActiveScreen()?.onTapDown(details);
  }

  BaseScreen _getActiveScreen() {
    switch (_screenState) {
      case ScreenState.kMenuScreen:
        return _menuScreen;
      case ScreenState.kPlayGroundScreen:
        return _playGroundScreen;
      case ScreenState.kScoreScreen:
        return _scoreScreen;
      default:
        return _menuScreen;
    }
  }

  void switchScreen(ScreenState newScreen) {
    _screenState = newScreen;
  }
}
