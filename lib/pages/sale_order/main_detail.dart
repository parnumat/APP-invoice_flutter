import 'dart:convert';
import 'dart:math';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoice/pages/sale_order/book_tax_invoice.dart';
import 'package:invoice/pages/widget/custom_progressbar.dart';
import 'package:invoice/services/maxLenght.dart';

class MainOrderDetail extends StatefulWidget {
  MainOrderDetail({Key key}) : super(key: key);

  @override
  _MainOrderDetailState createState() => _MainOrderDetailState();
}

class _MainOrderDetailState extends State<MainOrderDetail> {
  double _value = 0;
  DateTime selectedDate = DateTime.now();
  TextEditingController _conNumTax = TextEditingController();
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(selectedDate.year - 5),
      lastDate: DateTime(selectedDate.year + 5),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // color: Colors.blue,
          height: _height,
          child: Center(
            child: Wrap(
              // runSpacing: 30,
              direction: Axis.horizontal,
              children: [
                Container(
                  // color: Colors.red,
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
                            width: _width * 0.6,
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
                ),
                Container(
                  height: _height * 0.65,
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('เลขที่ใบกำกับภาษี'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 220,
                                height: 45,
                                child: TextField(
                                  controller: _conNumTax,
                                  onChanged: (String value) {
                                    print(_conNumTax.text);
                                  },
                                  maxLength: 8,
                                  maxLines: 1,
                                  inputFormatters: [
                                    Utf8LengthLimitingTextInputFormatter(8),
                                  ],
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.top,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.menu),
                                    counter: SizedBox.shrink(),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Text('วันที่ในใบกำกับภาษี'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 200,
                                height: 35,
                                child: OutlineButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4.0),
                                  ),
                                  borderSide: BorderSide(color: Colors.black54),
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        formatDate(selectedDate,
                                            [dd, '/', mm, '/', yyyy]),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 17),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.date_range,
                                        color: Colors.black45,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text('วันครบกำหนดชำระ'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 175,
                                height: 45,
                                child: TextField(
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.top,
                                  // controller: _codeTool,
                                  maxLength: 8,
                                  inputFormatters: [
                                    Utf8LengthLimitingTextInputFormatter(8),
                                  ],
                                  decoration: InputDecoration(
                                    counter: SizedBox.shrink(),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('เลขที่ใบสั่งขาย'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 240,
                                height: 45,
                                child: TextField(
                                  maxLength: 8,
                                  maxLines: 1,
                                  inputFormatters: [
                                    Utf8LengthLimitingTextInputFormatter(8),
                                  ],
                                  style: TextStyle(fontSize: 17),
                                  textAlignVertical: TextAlignVertical.top,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.menu),
                                    counter: SizedBox.shrink(),
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                              Text('ใบสั่งซื้อเลขที่'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 200,
                                height: 35,
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
                                height: 35,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ลูกค้า'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 870,
                                height: 35,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('ที่อยู่'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 870,
                                height: 35,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('สถานที่ส่งของ'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 870,
                                height: 35,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('รหัสผู้ส่ง'),
                              SizedBox(width: 35),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 118,
                                height: 35,
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
                                height: 35,
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
                                height: 35,
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
                                height: 35,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('หมายเหตุ'),
                              Container(
                                margin: EdgeInsets.all(5),
                                width: 870,
                                height: 35,
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
                ),
                Container(
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
                          style: TextStyle(fontSize: 13, color: Colors.white)),
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
