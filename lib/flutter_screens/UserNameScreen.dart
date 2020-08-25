import 'package:flutter/material.dart';
import 'package:saveredsquare/SaveRedSquare.dart';
import 'package:saveredsquare/data/DataHolder.dart';
import 'package:saveredsquare/screens/ScreenState.dart';

class UserNameScreen extends StatefulWidget {
  @override
  _UserNameScreenState createState() => _UserNameScreenState();
}

class _UserNameScreenState extends State<UserNameScreen> {
  String _userName = "";

  @override
  Widget build(BuildContext context) {
    var txtFontSize = MediaQuery.of(context).size.width * 0.05;
    var rowSpace = MediaQuery.of(context).size.height * 0.03;

    var tbWidth = MediaQuery.of(context).size.width * 0.8;
    var tbHeight = MediaQuery.of(context).size.height * 0.05;

    var iconSize = MediaQuery.of(context).size.width * 0.07;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Choose your user name:',
              style: TextStyle(
                fontSize: txtFontSize,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: rowSpace,
            ),
            Container(
              width: tbWidth,
              height: tbHeight,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
              child: TextFormField(
                onChanged: (val) {
                  _userName = val;
                  setState(() {});
                },
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: txtFontSize * 0.9,
                  fontWeight: FontWeight.bold,
                ),
                initialValue: dataHolder.getUserName(),
              ),
            ),
            SizedBox(
              height: rowSpace,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    dataHolder.setUserName(_userName);
                    saveRedSquare.switchScreen(ScreenState.kMenuScreen);
                  },
                  child: Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
                SizedBox(
                  width: iconSize,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: iconSize,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
