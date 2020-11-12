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
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Container(
                      height: 100,
                      color: Colors.amber,
                    ),
                  ),
                ),
                Container(
                  // flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              child: Form(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('เลขที่ใบกำกับภาษี'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 240,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.menu),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('วันที่ในใบกำกับภาษี'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 200,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(
                                                  Icons.date_range_outlined),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('วันครบกำหนดชำระ'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 175,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('เลขที่ใบสั่งขาย'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 240,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.menu),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('ใบสั่งซื้อเลขที่'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 200,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('เครดิต'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 74,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('วัน'),
                                        SizedBox(
                                          width: 80,
                                        )
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('ลูกค้า'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 870,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('ที่อยู่'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 870,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('สถานที่ส่งของ'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 870,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('รหัสผู้ส่ง'),
                                        SizedBox(width: 28),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 118,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.menu),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('ชื่อผู้ส่ง'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 180,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('ทะเบียนรถ'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 140,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        Text('ชื่อผู้รับ'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 180,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('หมายเหตุ'),
                                        Container(
                                          margin: EdgeInsets.all(5),
                                          width: 870,
                                          height: 28,
                                          child: TextField(
                                            style: TextStyle(fontSize: 17),
                                            // controller: _codeTool,
                                            decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.menu),
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Center(
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () => Navigator.of(context)
                              .push(_createRoute(BookTaxInvoice())),

                          // Navigator.of(context)
                          //     .pushAndRemoveUntil(
                          //         MaterialPageRoute(
                          //             builder: (context) => BookTaxInvoice()),
                          //         (Route<dynamic> route) => false),
                          child: Text("ต่อไป",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
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
