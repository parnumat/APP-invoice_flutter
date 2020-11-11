import 'package:flutter/material.dart';
import 'package:invoice/pages/invoice_details/invoice_tools_page.dart';
import 'package:invoice/pages/sale_order/choose_order_date.dart';
import 'package:invoice/pages/tool_page.dart';
import 'package:invoice/pages/widget/custom_card_success.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage({Key key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  TextEditingController _codeTool = new TextEditingController();
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
                      child: Center(
                        child: Container(
                          child: Container(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: CustomCardSuccess(),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14.5)),
                              color: Color(0XFFFFD05B),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => InvoiceToolsPage(),
                                ),
                              ),
                              // Navigator.of(context)
                              //     .pushAndRemoveUntil(
                              //         MaterialPageRoute(
                              //             builder: (context) => ToolsPage()),
                              //         (Route<dynamic> route) => false),
                              child: Text("เลือก",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white)),
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
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white)),
                            ),
                          ],
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

  _customRow() {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text('PO29102020')),
        DataCell(Text('29/10/2020')),
        DataCell(Text('POF9Q0190000')),
        DataCell(Text(
          'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text('1')),
        DataCell(Text('26.52')),
        DataCell(Text('Kilogram')),
      ],
    );
    return dataRow;
  }
}
