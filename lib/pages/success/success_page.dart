import 'package:flutter/material.dart';
import 'package:invoice/pages/invoice_details/invoice_tools_page.dart';
import 'package:invoice/pages/widget/custom_card_success.dart';
import 'package:invoice/pages/widget/custom_progressbar.dart';

class SuccessPage extends StatefulWidget {
  SuccessPage({Key key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  double _value = 10;
  // TextEditingController _codeTool = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                      // color: Colors.teal,
                      child: Center(
                        child: Column(
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
                          ],
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
                      child: CustomCardSuccess(
                        w: 0.7,
                        h: 0.8,
                      ),
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
                                  borderRadius: BorderRadius.circular(20)),
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
                              child: Text("พิมพ์",
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.white)),
                            ),
                            SizedBox(
                              width: 37,
                            ),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              color: Color(0XFFFFD05B),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Packing List",
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

  // _customRow() {
  //   var dataRow = DataRow(
  //     cells: <DataCell>[
  //       DataCell(Text('PO29102020')),
  //       DataCell(Text('29/10/2020')),
  //       DataCell(Text('POF9Q0190000')),
  //       DataCell(Text(
  //         'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
  //         maxLines: 2,
  //         overflow: TextOverflow.ellipsis,
  //       )),
  //       DataCell(Text('1')),
  //       DataCell(Text('26.52')),
  //       DataCell(Text('Kilogram')),
  //     ],
  //   );
  //   return dataRow;
  // }
}
