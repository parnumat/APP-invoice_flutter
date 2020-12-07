import 'package:flutter/material.dart';
import 'package:invoice/screens/widgets/custom_progressbar.dart';

class ControlProgressBar extends StatefulWidget {
  const ControlProgressBar({
    Key key,
    this.width,
  });

  final double width;

  @override
  _ControlProgressBarState createState() => _ControlProgressBarState();
}

class _ControlProgressBarState extends State<ControlProgressBar> {
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      height: 120,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  if (_value < 10)
                    _value = _value + 5;
                  else
                    _value = 0;
                });
              },
              child: CustomProgressBar(
                width: widget.width * 0.6,
                height: 10,
                radius: 20,
                value: _value,
                totalValue: 10,
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
