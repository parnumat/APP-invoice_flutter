import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/pages/tool_page.dart';
import 'package:invoice/pages/widget/custom_card_success.dart';
import 'package:invoice/pages/widget/custom_card_tax.dart';

class InvoiceToolDetailPage extends StatefulWidget {
  InvoiceToolDetailPage({Key key}) : super(key: key);

  @override
  _InvoiceToolDetailPageState createState() => _InvoiceToolDetailPageState();
}

class _InvoiceToolDetailPageState extends State<InvoiceToolDetailPage> {
  // TextEditingController _controller = TextEditingController();
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
                                      builder: (context) => ToolsPage()),
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
                                      builder: (context) => ToolsPage()),
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
                        ? Column(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                width: _width * 0.85,
                                height: _height * 0.70,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  alignment: WrapAlignment.spaceAround,
                                  runAlignment: WrapAlignment.spaceAround,
                                  // spacing: 20,
                                  // runSpacing: 12,
                                  children: [
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                    CustomCardTax(),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 2,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(top: 10),
                                  height: 30,
                                  child: Center(child: Text("OOOOO")))
                            ],
                          )
                        : Container(
                            padding: EdgeInsets.all(8),
                            width: _width * 0.85,
                            height: _height * 0.70,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      width: _width * 0.30,
                                      child: Center(
                                        child: Text(
                                            "POF Shrink Regular 12.5u x 400 mm x 3,000 m. แกน 3 นิ้ว Flat/Non-Perforate เกรด A"),
                                      ),
                                    ),
                                    Container(
                                      width: _width * 0.30,
                                      height: _height * 0.581,
                                      decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                      ),
                                      child: Column(
                                        children: [
                                          DataTable(
                                            headingRowHeight: 20,
                                            columnSpacing: 5,
                                            dataRowHeight: 22,
                                            columns: [
                                              DataColumn(
                                                  label: Text('ลำดับ',
                                                      style: TextStyle(
                                                          fontSize: 12))),
                                              DataColumn(
                                                  label: Text('Barcode',
                                                      style: TextStyle(
                                                          fontSize: 12))),
                                              DataColumn(
                                                  label: Text('LOT',
                                                      style: TextStyle(
                                                          fontSize: 12))),
                                              DataColumn(
                                                  label: Text('จำนวน',
                                                      style: TextStyle(
                                                          fontSize: 12))),
                                              DataColumn(
                                                  label: Text('น้ำหนักรวม',
                                                      style: TextStyle(
                                                          fontSize: 12))),
                                            ],
                                            rows: [
                                              _customRow(1),
                                              _customRow(2),
                                              _customRow(3),
                                              _customRow(4),
                                              _customRow(5),
                                              _customRow(6),
                                              _customRow(7),
                                              _customRow(8),
                                              _customRow(9),
                                              _customRow(10),
                                              _customRow(11),
                                              _customRow(12),
                                              _customRow(13),
                                              _customRow(14),
                                              _customRow(15),
                                              _customRow(16),
                                              _customRow(17),
                                              _customRow(18),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 4.5),
                                    Text("OOOOO")
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CustomCardSuccess(
                                      w: 0.45,
                                      h: 0.6,
                                    ),
                                    RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      color: Color(0XFFFFD05B),
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pushAndRemoveUntil(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ToolsPage()),
                                                (Route<dynamic> route) =>
                                                    false);
                                      },
                                      child: Text(
                                        "พิมพ์",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 2,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
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

  _customRow(index) {
    var dataRow = DataRow(
      color: MaterialStateProperty.all(
          (index % 2 == 0) ? Color(0XFFFFD05B) : Color(0XFFFFFFFF)),
      cells: <DataCell>[
        DataCell(Text('$index', style: TextStyle(fontSize: 11))),
        DataCell(Text('S630900000013', style: TextStyle(fontSize: 11))),
        DataCell(Text('630900024', style: TextStyle(fontSize: 11))),
        DataCell(Text('1', style: TextStyle(fontSize: 11))),
        DataCell(Text('6.63', style: TextStyle(fontSize: 11))),
      ],
    );
    return dataRow;
  }
}
