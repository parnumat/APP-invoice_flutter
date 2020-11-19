import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/pages/sale_order/choose_order_date2.dart';
import 'package:invoice/pages/widget/custom_progressbar.dart';

class ChooseOrderDate extends StatefulWidget {
  ChooseOrderDate({Key key}) : super(key: key);

  @override
  _ChooseOrderDateState createState() => _ChooseOrderDateState();
}

class _ChooseOrderDateState extends State<ChooseOrderDate> {
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

  double _value = 0;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Wrap(
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
                                width: 220,
                                height: 40,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.top,
                                  style: TextStyle(fontSize: 17),
                                  controller: _controller,
                                  // obscureText: true,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: 'หมายเลขใบสั่งขาย',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
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
                                    numBuy: 'PO29102020',
                                    returnDate: '29/10/2020',
                                    goodsCode: 'POF9Q0190000',
                                    goodsName:
                                        'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
                                    number: '1',
                                    weight: '26.52',
                                    unit: 'Kilogram'),
                                _customRow(
                                    numBuy: 'PO29102020',
                                    returnDate: '29/10/2020',
                                    goodsCode: 'POF9Q0190000',
                                    goodsName:
                                        'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
                                    number: '1',
                                    weight: '26.52',
                                    unit: 'Kilogram'),
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
                                    numBuy: 'PO29102020',
                                    returnDate: '29/10/2020',
                                    goodsCode: 'POF9Q0190000',
                                    goodsName:
                                        'POF Shrink Regular 19u x 290 mm x 6,402 m. แกน 3 นิ้ว 3รอยต่อ Flat/Non-Perforateเกรด A',
                                    number: '1',
                                    weight: '26.52',
                                    unit: 'Kilogram'),
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
                                  borderRadius: BorderRadius.circular(20)),
                              color: Color(0XFFFFD05B),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChooseOrderDate2(),
                                ),
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
                                  borderRadius: BorderRadius.circular(20)),
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
