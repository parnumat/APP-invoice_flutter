import 'package:flutter/material.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/pages/sale_order/book_tax_invoice.dart';
import 'package:invoice/pages/sale_order/choose_order_details.dart';

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
              builder: (context) => BookTaxInvoice(),
            ),
          ),
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
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        message,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.w700),
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
        ),
      ),
    );
  }
}
