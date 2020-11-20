import 'package:flutter/material.dart';
import 'package:invoice/pages/invoice_details/invoice_details.dart';

class CustomCardTax extends StatelessWidget {
  String numTax;
  String codeTax;
  String nameTax;

  CustomCardTax({Key key, this.numTax, this.codeTax, this.nameTax})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InvoiceToolDetailPage(),
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(left: 15, top: 15),
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
                      Text(codeTax, style: TextStyle(fontSize: 14)),
                      SizedBox(width: 25),
                      Text(nameTax, style: TextStyle(fontSize: 14)),
                    ],
                  ),
                  Text(
                    numTax,
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
