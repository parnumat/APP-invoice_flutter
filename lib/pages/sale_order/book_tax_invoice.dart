import 'package:flutter/material.dart';
import 'package:invoice/pages/tool_page.dart';
import 'package:invoice/pages/widget/custom_dialog_box.dart';

import 'choose_order_details.dart';

class BookTaxInvoice extends StatefulWidget {
  BookTaxInvoice({Key key}) : super(key: key);

  @override
  _BookTaxInvoiceState createState() => _BookTaxInvoiceState();
}

class _BookTaxInvoiceState extends State<BookTaxInvoice> {
  static const int numItems = 8;
  List<bool> selected = List<bool>.generate(numItems, (index) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      color: Colors.teal,
                      child: Center(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          // alignment: Alignment(-0.50, 0),
                          child: Text(
                            "รายละเอียดการจองใบกำกับภาษี",
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: DataTable(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(20)),
                            columnSpacing: 150,
                            dataRowHeight: 35,
                            columns: [
                              // DataColumn(label: Text('เลือก')),
                              DataColumn(label: Text('เลขที่ใบกำกับภาษี')),
                              DataColumn(label: Text('วันที่บันทึก')),
                              DataColumn(label: Text('ผู้บันทึก')),
                            ],
                            rows: List<DataRow>.generate(
                              numItems,
                              (index) => DataRow(
                                selected: selected[index],
                                onSelectChanged: (value) => setState(() {
                                  selected[index] = !selected[index];
                                }),
                                cells: <DataCell>[
                                  DataCell(Text('SI005/0088239')),
                                  DataCell(Text('02/12/2016')),
                                  DataCell(Text('System Administrator')),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFFFFD05B),
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return CustomDialogBox();
                                },
                              );
                            },
                            child: Text("เลือก",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white)),
                          ),
                          SizedBox(
                            width: 37,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            color: Color(0XFF29EAA4),
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("ยกเลิก",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.white)),
                          ),
                        ],
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
