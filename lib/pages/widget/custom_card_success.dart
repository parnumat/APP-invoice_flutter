import 'package:flutter/material.dart';

class CustomCardSuccess extends StatelessWidget {
  const CustomCardSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 750,
      height: 450,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(20)),
    );
  }
}
