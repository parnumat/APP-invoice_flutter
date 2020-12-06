import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/animations/test/test_animation.dart';
import 'package:invoice/models/good_orders.dart';
import 'package:invoice/models/tax_cards.dart';
import 'package:invoice/screens/detailScreen/detailScreenV2/widget/detail_tax.dart';
import 'package:invoice/screens/detailScreen/detailScreenV2/widget/print_tax.dart';
import 'package:invoice/screens/toolScreen/tool_screen.dart';
import 'package:invoice/screens/widgets/custom_card_success.dart';
import 'package:invoice/screens/widgets/custom_card_tax.dart';
import 'package:invoice/services/bloc/invoice_tools_bloc.dart';
import 'package:invoice/services/dummy/dummy.dart';

class DetailScreenV2 extends StatefulWidget {
  DetailScreenV2({Key key}) : super(key: key);

  @override
  _DetailScreenV2State createState() => _DetailScreenV2State();
}

class _DetailScreenV2State extends State<DetailScreenV2> {
  // TextEditingController _controller = TextEditingController();
  List<TaxCards> taxCards = taxCardsFromJson(Dummy.taxCards);
  List<GoodOrders> goodOrders = goodOrdersFromJson(Dummy.goodOrders);

  DateTime selectedDate = DateTime.now();
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

  bool _stateBotton = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Wrap(
              spacing: 20,
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: _width,
                  child: Text(
                    "Invoice Tools",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("วันที่ใบกำกับภาษี"),
                        SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: 230,
                          height: 29,
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.white),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  formatDate(selectedDate,
                                          [dd, '/', mm, '/', yyyy]) +
                                      "-" +
                                      formatDate(selectedDate,
                                          [dd, '/', mm, '/', yyyy]),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.date_range,
                                  color: Colors.black26,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("เลขที่ใบกำกับภาษี"),
                        SizedBox(width: 10),
                        Text("ตั้งแต่"),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 29,
                          child: TextField(
                            style: TextStyle(fontSize: 17),
                            // controller: _controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("ถึง"),
                        SizedBox(width: 10),
                        Container(
                          width: 120,
                          height: 29,
                          child: TextField(
                            style: TextStyle(fontSize: 17),
                            // controller: _controller,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    Row(
                      children: [
                        ButtonTheme(
                          minWidth: 35,
                          height: 25,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFFFFD05B),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) =>
                                                InvoiceToolsBloc(),
                                            child: ToolScreen(),
                                          )),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              "ค้นหา",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ButtonTheme(
                          minWidth: 35,
                          height: 25,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFFFFFFFF),
                            onPressed: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => BlocProvider(
                                            create: (context) =>
                                                InvoiceToolsBloc(),
                                            child: ToolScreen(),
                                          )),
                                  (Route<dynamic> route) => false);
                            },
                            child: Text(
                              "ล้าง",
                              style: TextStyle(
                                  fontSize: 13, color: Color(0XFFFFD05B)),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 65),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _stateBotton = true;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Center(
                              child: Text(
                            "เลขใบกำกับภาษี",
                            style: TextStyle(
                                color: (_stateBotton)
                                    ? Color(0XFFFFD05B)
                                    : Color(0XFFFFFFFF)),
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: (_stateBotton)
                                ? Color(0XFFFFFFFF)
                                : Color(0XFFFFD05B),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _stateBotton = false;
                          });
                        },
                        child: Container(
                          width: 100,
                          height: 30,
                          child: Center(
                              child: Text(
                            "รายการสินค้า",
                            style: TextStyle(
                                color: (_stateBotton)
                                    ? Color(0XFFFFFFFF)
                                    : Color(0XFFFFD05B)),
                          )),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: (_stateBotton)
                                ? Color(0XFFFFD05B)
                                : Color(0XFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    (_stateBotton)
                        ? DetailTaxCard(
                            width: _width, height: _height, taxCards: taxCards)
                        : PrintTax(
                            width: _width,
                            height: _height,
                            goodOrders: goodOrders),
                  ],
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
