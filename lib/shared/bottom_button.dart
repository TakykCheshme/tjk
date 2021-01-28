import 'package:flutter/material.dart';
import 'package:tjk/models/product.dart';
import 'package:tjk/providers/cartP.dart';

import '../const.dart';

class BottomButton extends StatelessWidget {
  BottomButton(this.onTap, this.label);
  final Function onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 70.0,
          width: double.infinity,
          color: primaryColor,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
