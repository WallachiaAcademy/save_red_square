import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saveredsquare/SaveRedSquare.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                print("TAP" + DateTime.now().toString());
              },
              child: Text(
                "Hello world!",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.teal,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
