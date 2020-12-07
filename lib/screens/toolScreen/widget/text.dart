import 'package:flutter/material.dart';

class Txt extends StatelessWidget {
  const Txt({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IconButton(
      icon: Icon(Icons.accessibility_new),
      onPressed: () => Navigator.pushNamed(context, 'home-screen'),
    ));
  }
}
