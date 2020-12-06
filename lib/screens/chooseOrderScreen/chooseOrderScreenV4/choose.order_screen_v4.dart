import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/models/order.dart';
import 'package:invoice/screens/widgets/custom_progressbar.dart';
import 'package:invoice/screens/formOrderScreen/form_order_screen.dart';
import 'package:invoice/services/dummy/dummy.dart';

class ChooseOrderScreenV4 extends StatefulWidget {
  ChooseOrderScreenV4({Key key}) : super(key: key);

  @override
  _ChooseOrderScreenV4State createState() => _ChooseOrderScreenV4State();
}

class _ChooseOrderScreenV4State extends State<ChooseOrderScreenV4> {
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

  int _values = 1;
  double _value = 0;

  @override
  Widget build(BuildContext context) {
    List<Order> orders = orderFromJson(Dummy.orders);
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Wrap(
              children: [
                Container(
                  padding: const EdgeInsets.all(20.0),
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
                Container(
                  padding: const EdgeInsets.all(20.0),
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
                            height: 40,
                            child: OutlineButton(
                              onPressed: () {
                                _selectDate(context);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    formatDate(
                                        selectedDate, [dd, '/', mm, '/', yyyy]),
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
                              height: 50,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12),
                                  borderRadius: BorderRadius.circular(5)),
                              child: DropdownButtonFormField(
                                decoration: InputDecoration(
                                    enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white))),
                                icon: Icon(Icons.arrow_drop_down),
                                value: _values,
                                // style: TextStyle(
                                //     fontSize: 14, color: Colors.black),
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
                                    _values = value;
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
                            _customRow(
                                numBuy: orders[0].numBuy,
                                returnDate: orders[0].returnDate,
                                goodsCode: orders[0].goodsCode,
                                goodsName: orders[0].goodsName,
                                number: orders[0].number,
                                weight: orders[0].weight,
                                unit: orders[0].unit),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => FormOrderScreen()),
                          ),
                          child: Text("เลือก",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                        SizedBox(
                          width: 37,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFF29EAA4),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("ยกเลิก",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white)),
                        ),
                        // RaisedButton(
                        //   shape: RoundedRectangleBorder(
                        //       borderRadius: BorderRadius.circular(20)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  _customRow({numBuy, returnDate, goodsCode, goodsName, number, weight, unit}) {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text(numBuy)),
        DataCell(Text(returnDate)),
        DataCell(Text(goodsCode)),
        DataCell(Text(
          goodsName,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text(number)),
        DataCell(Text(weight)),
        DataCell(Text(unit)),
      ],
    );
    return dataRow;
  }
}
