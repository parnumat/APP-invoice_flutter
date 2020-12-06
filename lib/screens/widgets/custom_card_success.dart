import 'package:flutter/material.dart';

class CustomCardSuccess extends StatelessWidget {
  final double w;
  final double h;
  const CustomCardSuccess({Key key, this.w, this.h}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Container(
      width: _width * w, //0.45 750
      height: _height * h, //0.6 45
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
