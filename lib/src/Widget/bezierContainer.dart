import 'dart:math';
import 'package:flutter/material.dart';
import 'customClipper.dart';

class BezierContainer extends StatelessWidget {
  const BezierContainer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Transform.rotate(
        angle: -pi / 3.5, 
        child: ClipPath(
        clipper: ClipPainter(),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.grey.shade200, Color(0xff51c8fa)]
              )
            ),
        ),
      ),
      )
    );
  }
}