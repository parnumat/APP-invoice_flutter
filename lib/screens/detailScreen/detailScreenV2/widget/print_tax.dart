import 'package:flutter/material.dart';
import 'package:invoice/animations/test/test_animation.dart';
import 'package:invoice/models/goods_orders.dart';
import 'package:invoice/screens/widgets/custom_card_success.dart';

class PrintTax extends StatelessWidget {
  const PrintTax({
    Key key,
    @required double width,
    @required double height,
    @required this.goodOrders,
  })  : _width = width,
        _height = height,
        super(key: key);

  final double _width;
  final double _height;
  final List<GoodsOrders> goodOrders;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  border: Border.all(color: Colors.black12),
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
                                  style: TextStyle(fontSize: 12))),
                          DataColumn(
                              label: Text('Barcode',
                                  style: TextStyle(fontSize: 12))),
                          DataColumn(
                              label:
                                  Text('LOT', style: TextStyle(fontSize: 12))),
                          DataColumn(
                              label: Text('จำนวน',
                                  style: TextStyle(fontSize: 12))),
                          DataColumn(
                              label: Text('น้ำหนักรวม',
                                  style: TextStyle(fontSize: 12))),
                        ],
                        rows: List.generate(
                          goodOrders.length,
                          (index) => _customRow(
                              index: index + 1,
                              barCode: goodOrders[index].barCode,
                              lot: goodOrders[index].lot,
                              number: goodOrders[index].number,
                              weight: goodOrders[index].weight),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 4.5),
              Text("OOOOO")
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomCardSuccess(
                w: 0.45,
                h: 0.6,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0XFFFFD05B),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => TransitionsHomePage()),
                      (Route<dynamic> route) => false);
                },
                child: Text(
                  "พิมพ์",
                  style: TextStyle(fontSize: 13, color: Colors.white),
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
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }

  _customRow({index, barCode, lot, number, weight}) {
    var dataRow = DataRow(
      color: MaterialStateProperty.all(
          (index % 2 == 0) ? Color(0XFFFFD05B) : Color(0XFFFFFFFF)),
      cells: <DataCell>[
        DataCell(Text('$index', style: TextStyle(fontSize: 11))),
        DataCell(Text(barCode, style: TextStyle(fontSize: 11))),
        DataCell(Text(lot, style: TextStyle(fontSize: 11))),
        DataCell(Text(number, style: TextStyle(fontSize: 11))),
        DataCell(Text(weight, style: TextStyle(fontSize: 11))),
      ],
    );
    return dataRow;
  }
}
