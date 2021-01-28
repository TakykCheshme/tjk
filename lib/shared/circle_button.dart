import 'package:flutter/material.dart';
import 'package:tjk/const.dart';

class CircleButton extends StatelessWidget {
  CircleButton(this.label, this.onPress);
  final String label;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: const EdgeInsets.all(5.0),
        // margin: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: primaryColor),
        ),
        child: Text(label,
            style: TextStyle(
              fontFamily: "courier",
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: primaryColor,
            )),
      ),
    );
  }
}
