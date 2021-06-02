import 'package:flutter/material.dart';

class ShakeTransition extends StatelessWidget {
  final Widget child;
  final double offset;

  ShakeTransition({this.child, this.offset = 140.0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: child,
        curve: Curves.bounceOut,
        tween: Tween(begin: 1.0, end: 0.0),
        duration: Duration(seconds: 1),
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(value * offset, 0.0),
            child: child,
          );
        });
  }
}


class BottomShakeTransition extends StatelessWidget {
  final Widget child;
  final double offset;

  BottomShakeTransition({this.child, this.offset = 140.0});

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
        child: child,
        curve: Curves.bounceOut,

        tween: Tween(begin: 1.0, end: 0.0),
        duration: Duration(milliseconds: 800),

        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0.0, value * offset),
            child: child,
          );
        });
  }
}