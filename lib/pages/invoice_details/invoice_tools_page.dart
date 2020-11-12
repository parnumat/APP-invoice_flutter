import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/pages/widget/custom_card_tax.dart';

class InvoiceToolsPage extends StatefulWidget {
  InvoiceToolsPage({Key key}) : super(key: key);

  @override
  _InvoiceToolsPageState createState() => _InvoiceToolsPageState();
}

class _InvoiceToolsPageState extends State<InvoiceToolsPage> {
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
              spacing: 15,
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
                  children: [
                    Text("วันที่ใบกำกับภาษี"),
                    SizedBox(width: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15)),
                      width: 216,
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
                              formatDate(
                                      selectedDate, [dd, '/', mm, '/', yyyy]) +
                                  "-" +
                                  formatDate(
                                      selectedDate, [dd, '/', mm, '/', yyyy]),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
                      width: 160,
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
                      width: 160,
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
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(12),
                          width: _width * 0.62,
                          height: _height * 0.70,
                          child: Wrap(
                            alignment: WrapAlignment.spaceAround,
                            runAlignment: WrapAlignment.spaceAround,
                            // spacing: 12,
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("OOOOO")
                      ],
                    ),
                    SizedBox(width: 20),
                    Container(
                      width: _width * 0.32,
                      height: _height * 0.75,
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              color: Color(0XFFFFD05B),
                            ),
                            child: Center(
                              child: Text(
                                "รายการสินค้า",
                                style: TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                                "POF Shrink Regular 12.5u x 400 mm x 3,000 m. แกน 3 นิ้ว Flat/Non-Perforate เกรด A"),
                          ),
                          Container(
                            width: _width * 0.30,
                            height: _height * 0.58,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12),
                            ),
                            child: DataTable(
                              headingRowHeight: 20,
                              columnSpacing: 5,
                              dataRowHeight: 22,
                              columns: [
                                DataColumn(
                                    label: Text('ลำดับ',
                                        style: TextStyle(fontSize: 12))),
                                DataColumn(
                                    label: Text('Barcode',
                                        style: TextStyle(fontSize: 12))),
                                DataColumn(
                                    label: Text('LOT',
                                        style: TextStyle(fontSize: 12))),
                                DataColumn(
                                    label: Text('จำนวน',
                                        style: TextStyle(fontSize: 12))),
                                DataColumn(
                                    label: Text('น้ำหนักรวม',
                                        style: TextStyle(fontSize: 12))),
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
                          ),
                          SizedBox(height: 4.5),
                          Text("OOOOO")
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
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                    )
                  ],
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
