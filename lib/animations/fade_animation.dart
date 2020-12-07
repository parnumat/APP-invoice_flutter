import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class FadeXAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeXAnimation({this.delay, this.child});
  @override
  Widget build(BuildContext context) {
    var multiTrackTween = MultiTrackTween([
      Track("opacity").add(
        Duration(milliseconds: 500),
        Tween(begin: 0.0, end: 1.0),
      ),
      Track("translateX").add(
          Duration(milliseconds: 500), Tween(begin: 300.0, end: 0.9),
          curve: Curves.easeOut)
    ]);
    final tween = multiTrackTween;

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(0, animation["translateX"]),
          child: child,
        ),
      ),
    );
  }
}

class FadeYAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

  FadeYAnimation({this.delay, this.child});
  @override
  Widget build(BuildContext context) {
    final tween = MultiTrackTween([
      Track("opacity").add(
        Duration(milliseconds: 500),
        Tween(begin: 0.0, end: 1.0),
      ),
      Track("translateY").add(
          Duration(milliseconds: 500), Tween(begin: 300.0, end: 0.0),
          curve: Curves.easeOut)
    ]);

    return ControlledAnimation(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builderWithChild: (context, child, animation) => Opacity(
        opacity: animation["opacity"],
        child: Transform.translate(
          offset: Offset(0, animation["translateY"]),
          child: child,
        ),
      ),
    );
  }
}
