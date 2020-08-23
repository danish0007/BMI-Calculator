import 'package:flutter/material.dart';

class buildcard extends StatelessWidget {
  buildcard({@required this.colour, this.cardchild});

  Color colour;
  Widget cardchild;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.all(15),
      child: cardchild,
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
