import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/pages/tool_page.dart';

class Goods extends StatefulWidget {
  Goods({Key key}) : super(key: key);

  @override
  _GoodsState createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  TextEditingController _controller = TextEditingController();
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

  int _value = 1;

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
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black12),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "ชื่อสินค้า",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 450,
                                height: 46,
                                child: TextField(
                                  style: TextStyle(fontSize: 17),
                                  // controller: _codeTool,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "จำนวน",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                height: 46,
                                child: TextField(
                                  style: TextStyle(fontSize: 17),
                                  // controller: _codeTool,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "น้ำหนัก",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 100,
                                height: 46,
                                child: TextField(
                                  style: TextStyle(fontSize: 17),
                                  // controller: _codeTool,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "KG.",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("ระบุ Barcode",
                                  style: TextStyle(fontSize: 22)),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 500,
                                height: 46,
                                child: TextField(
                                  style: TextStyle(fontSize: 17),
                                  // controller: _codeTool,
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.qr_code_outlined)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            width: 1000,
                            height: 340,
                            child: DataTable(
                              headingRowHeight: 35,
                              columnSpacing: 20,
                              dataRowHeight: 35,
                              columns: [
                                DataColumn(label: Text('อันดับ')),
                                DataColumn(label: Text('เลขที่ Barcode')),
                                DataColumn(label: Text('ลำดับผลิตภัณฑ์')),
                                DataColumn(label: Text('Lot ผู้าย')),
                                DataColumn(label: Text('พาเลท')),
                                DataColumn(label: Text('Part Number')),
                                DataColumn(label: Text('จำนวน')),
                                DataColumn(label: Text('น้ำหนัก')),
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
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.5)),
                          color: Color(0XFFFFD05B),
                          onPressed: () => Navigator.of(context)
                              .pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) => ToolsPage()),
                                  (Route<dynamic> route) => false),
                          child: Text("เลือก",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
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
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customRow(int number) {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text('$number')),
        DataCell(Text('P63090000016')),
        DataCell(Text('630900023')),
        DataCell(Text('PS66309002')),
        DataCell(Text(
          'O63090002',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text('POF(CD046)')),
        DataCell(Text('1')),
        DataCell(Text('9999.99')),
      ],
    );
    return dataRow;
  }
}
