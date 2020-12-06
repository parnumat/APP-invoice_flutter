import 'package:flutter/material.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/screens/formOrderScreen/form_order_screen.dart';

//ipad size 1366x1024
class ToolCard extends StatelessWidget {
  final String assetImage;
  final String message;
  final String code;

  ToolCard({Key key, this.assetImage, this.message, this.code})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double c_width = MediaQuery.of(context).size.width * 0.8;
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: FadeYAnimation(
        delay: 0.5,
        child: GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormOrderScreen(
                numTax: code,
              ),
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                    child: Image.asset(
                      assetImage,
                      height: 100,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          height: 1.1),
                    ),
                  ),
                  Text(
                    code,
                    style: TextStyle(fontSize: 18, color: Colors.black45),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
