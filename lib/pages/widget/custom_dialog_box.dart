import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invoice/pages/sale_order/choose_order_details.dart';
import 'package:invoice/pages/tool_page.dart';

import 'constants.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({Key key}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _codeTool = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context),
      ),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: 800,
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("เลขที่ใบสั่งขาย",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600)),
                  // TextField(
                  //   controller: _codeTool,
                  // )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20)),
                child: DataTable(
                  headingRowHeight: 35,
                  columnSpacing: 20,
                  dataRowHeight: 55,
                  columns: [
                    DataColumn(label: Text('รหัสสินค้า')),
                    DataColumn(label: Text('ชื่อสินค้า')),
                    DataColumn(label: Text('จำนวน')),
                    DataColumn(label: Text('หน่วย')),
                    DataColumn(label: Text('กำหนดส่งสินค้า')),
                  ],
                  rows: [
                    _customRow(),
                    _customRow(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                    SizedBox(width: 100),
                    RotatedBox(
                      quarterTurns: 1,
                      child: Icon(
                        Icons.arrow_back,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20)),
                child: DataTable(
                  headingRowHeight: 35,
                  columnSpacing: 20,
                  dataRowHeight: 65,
                  columns: [
                    DataColumn(label: Text('รหัสสินค้า')),
                    DataColumn(label: Text('ชื่อสินค้า')),
                    DataColumn(label: Text('จำนวน')),
                    DataColumn(label: Text('หน่วย')),
                    DataColumn(label: Text('กำหนดส่งสินค้า')),
                  ],
                  rows: [
                    _customRow(),
                    _customRow(),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.5)),
                    color: Color(0XFFFFD05B),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseOrderDetails(),
                      ),
                    ),
                    child: Text("เลือก",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.5)),
                    color: Color(0XFF29EAA4),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("ยกเลิก",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _customRow() {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text('POF9Q0190000')),
        DataCell(Text(
          'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text('26.52')),
        DataCell(Text('Kilogram')),
        DataCell(Text('25/09/2020')),
      ],
    );
    return dataRow;
  }
}
