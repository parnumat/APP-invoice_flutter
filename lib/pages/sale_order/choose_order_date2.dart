import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';
import 'package:invoice/pages/goods/goods.dart';
import 'package:invoice/pages/tool_page.dart';

class ChooseOrderDate2 extends StatefulWidget {
  ChooseOrderDate2({Key key}) : super(key: key);

  @override
  _ChooseOrderDate2State createState() => _ChooseOrderDate2State();
}

class _ChooseOrderDate2State extends State<ChooseOrderDate2> {
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
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "วันที่ส่งสินค้า",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                width: 166,
                                height: 50,
                                child: OutlinedButton.icon(
                                  onPressed: () {
                                    _selectDate(context);
                                  },
                                  icon: Icon(
                                    Icons.date_range,
                                    color: Colors.black45,
                                  ),
                                  label: Text(
                                    formatDate(
                                        selectedDate, [dd, '/', mm, '/', yyyy]),
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 17),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "เลขที่ใบสั่งขาย",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  padding: EdgeInsets.only(left: 15),
                                  width: 145,
                                  height: 46,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: DropdownButtonFormField(
                                    decoration: InputDecoration(
                                        enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.white))),
                                    icon: Icon(Icons.arrow_drop_down),
                                    value: _value,
                                    items: [
                                      DropdownMenuItem(
                                        child: Text("FM63090011"),
                                        value: 1,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090012"),
                                        value: 2,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090013"),
                                        value: 3,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090014"),
                                        value: 4,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090015"),
                                        value: 5,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090016"),
                                        value: 6,
                                      ),
                                      DropdownMenuItem(
                                        child: Text("FM63090017"),
                                        value: 7,
                                      ),
                                    ],
                                    onChanged: (value) {
                                      setState(() {
                                        _value = value;
                                      });
                                    },
                                  )),
                              SizedBox(
                                width: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            width: 900,
                            height: 340,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                                borderRadius: BorderRadius.circular(20)),
                            child: DataTable(
                              headingRowHeight: 35,
                              columnSpacing: 20,
                              dataRowHeight: 55,
                              columns: [
                                DataColumn(label: Text('เลขที่ใบสั่งซื้อ')),
                                DataColumn(label: Text('กำหนดส่งสินค้า')),
                                DataColumn(label: Text('รหัสสินค้า')),
                                DataColumn(label: Text('ชื่อสินค้า')),
                                DataColumn(label: Text('จำนวน')),
                                DataColumn(label: Text('น้ำหนัก')),
                                DataColumn(label: Text('หน่วย')),
                              ],
                              rows: [
                                // _customRow(),
                                // _customRow(),
                                // _customRow(),
                              ],
                            ),
                          ),
                        ],
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
                                  borderRadius: BorderRadius.circular(14.5)),
                              color: Color(0XFFFFD05B),
                              onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => Goods()),
                              ),
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
                            // RaisedButton(
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(14.5)),
                            //   onPressed: () {
                            //     showRoundedTimePicker(
                            //       context: context,
                            //       initialTime: TimeOfDay.now(),
                            //     );
                            //   },
                            //   child: Text("Clock"),
                            // )
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
