import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/flutter_screens/UserNameScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class ScreenManager extends StatefulWidget {
  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            saveRedSquare.widget,
            getFlutterWidget(),
          ],
        ),
      ),
    );
  }

  Widget getFlutterWidget() {
    switch (saveRedSquare.getState()) {
      case ScreenState.kSetUserScreen:
        return UserNameScreen();
      default:
        return Container();
    }
  }
}
