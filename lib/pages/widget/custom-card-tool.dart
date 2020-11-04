import 'package:flutter/material.dart';

//ipad size 1366x1024
class ToolCard extends StatelessWidget {
  final String assetImage;
  final String message;
  final String code;

  ToolCard({Key key, this.assetImage, this.message, this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                  child: Image.asset(
                    assetImage,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    message,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  code,
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
