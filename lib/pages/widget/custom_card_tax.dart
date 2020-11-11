import 'package:flutter/material.dart';
import 'package:invoice/animations/test/test_animation.dart';
import 'package:invoice/pages/sale_order/main_detail.dart';

class CustomCardTax extends StatelessWidget {
  CustomCardTax({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TransitionsHomePage(),
        ),
      ),
      child: Container(
        width: _width * 0.18,
        height: _height * 0.11,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: 10, color: Color(0XFFFFD05B)),
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("CT255", style: TextStyle(fontSize: 14)),
                      SizedBox(width: 25),
                      Text("FM63091152", style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Text(
                    "SI005/0056158",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
