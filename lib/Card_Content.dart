import 'package:flutter/material.dart';
import 'constants.dart';

class cardcontent extends StatelessWidget {
  String label;
  IconData icon;
  cardcontent({this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
          size: 70,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}
