import 'package:flutter/material.dart';
import 'package:invoice/pages/sale_order/book_tax_invoice.dart';

class MainOrderDetail extends StatefulWidget {
  MainOrderDetail({Key key}) : super(key: key);

  @override
  _MainOrderDetailState createState() => _MainOrderDetailState();
}

class _MainOrderDetailState extends State<MainOrderDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Stack(
              children: [
                Positioned(
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            color: Colors.teal,
                            child: Center(
                              child: Container(
                                child: Container(),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Expanded(
                      child: Container(),
                    ),
                    Expanded(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          color: Colors.amber,
                          child: Center(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      child: Center(
                                        child: Form(
                                          child: Column(
                                            children: [],
                                          ),
                                        ),
                                      ),
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: Center(
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.5)),
                              color: Color(0XFFFFD05B),
                              onPressed: () => Navigator.of(context)
                                  .push(_createRoute(BookTaxInvoice())),

                              // Navigator.of(context)
                              //     .pushAndRemoveUntil(
                              //         MaterialPageRoute(
                              //             builder: (context) => BookTaxInvoice()),
                              //         (Route<dynamic> route) => false),
                              child: Text("ต่อไป",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white)),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Route _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
