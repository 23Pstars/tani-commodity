import 'package:flutter/material.dart';

class BackgroundCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 255,
      child: Image.asset(
        'assets/images/intersection.png',
        width: double.infinity,
        height: 255,
        fit: BoxFit.fill,
      ),
    );
  }
}
