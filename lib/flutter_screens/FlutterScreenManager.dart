import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/flutter_screens/UserNameScreen.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

FlutterScreenManager flutterScreenManager = new FlutterScreenManager();

class FlutterScreenManager extends StatefulWidget {
  @override
  _FlutterScreenManagerState createState() => _FlutterScreenManagerState();
}

class _FlutterScreenManagerState extends State<FlutterScreenManager> {
  @override
  void initState() {
    super.initState();

    SystemChrome.setEnabledSystemUIOverlays([]);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);

    saveRedSquare.setCallBack(this.refreshState);
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

  void refreshState() {
    setState(() {});
  }
}
