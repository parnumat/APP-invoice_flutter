import 'package:flutter/material.dart';
import 'package:invoice/models/goods.dart';
import 'package:invoice/pages/success/success_page.dart';
import 'package:invoice/pages/widget/custom_progressbar.dart';
import 'package:invoice/services/dummy/dummy.dart';

class GoodsPage extends StatefulWidget {
  GoodsPage({Key key}) : super(key: key);

  @override
  _GoodsPageState createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {
  // TextEditingController _controller = TextEditingController();
  DateTime selectedDate = DateTime.now();
  double _value = 5;

  @override
  Widget build(BuildContext context) {
    List<Goods> goods = goodsFromJson(Dummy.goods);
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Wrap(
              children: [
                Container(
                  height: 100,
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
                  margin: const EdgeInsets.all(20.0),
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
                            width: 350,
                            height: 35,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(fontSize: 17),
                              // controller: _codeTool,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
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
                            width: 75,
                            height: 35,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(fontSize: 17),
                              // controller: _codeTool,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
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
                            width: 75,
                            height: 35,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(fontSize: 17),
                              // controller: _codeTool,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
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
                          Text("ระบุ Barcode", style: TextStyle(fontSize: 22)),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 350,
                            height: 35,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
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
                        height: 350,
                        child: DataTable(
                            headingRowHeight: 35,
                            columnSpacing: 20,
                            dataRowHeight: 35,
                            columns: [
                              DataColumn(label: Text('อันดับ')),
                              DataColumn(label: Text('เลขที่ Barcode')),
                              DataColumn(label: Text('ลำดับผลิตภัณฑ์')),
                              DataColumn(label: Text('Lot ผู้ขาย')),
                              DataColumn(label: Text('พาเลท')),
                              DataColumn(label: Text('Part Number')),
                              DataColumn(label: Text('จำนวน')),
                              DataColumn(label: Text('น้ำหนัก')),
                            ],
                            rows: List.generate(
                                goods.length,
                                (index) => _customRow(
                                    index: index + 1,
                                    barCode: goods[index].barCode,
                                    numProduct: goods[index].numProduct,
                                    saleLot: goods[index].saleLot,
                                    pallet: goods[index].pallet,
                                    partNum: goods[index].partNum,
                                    number: goods[index].number,
                                    weight: goods[index].weight))),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () => _showDialog(context),
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

  _customRow(
      {int index,
      barCode,
      numProduct,
      saleLot,
      pallet,
      partNum,
      number,
      weight}) {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text('$index')),
        DataCell(Text(barCode)),
        DataCell(Text(numProduct)),
        DataCell(Text(saleLot)),
        DataCell(Text(
          pallet,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        )),
        DataCell(Text(partNum)),
        DataCell(Text(number)),
        DataCell(Text(weight)),
      ],
    );
    return dataRow;
  }
}

_showDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: Color(0XFFFFD05B), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Text('บันทึก'),
        content: SingleChildScrollView(
          child: ListBody(
            // reverse: true,
            children: <Widget>[
              Center(child: Text('บันทึกข้อมูล เลขที่เอกสารใบกำกับภาษีเลขที่')),
              Center(
                  child: Text(
                      'SI005/0105054 และใบเบิกสินค้าเลขที่ IO63106F0006 เรียบร้อยแล้ว')),
            ],
          ),
        ),
        actions: <Widget>[
          RaisedButton(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: Color(0XFFFFD05B),
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => SuccessPage()),
            ),
            child: Text("ตกลง",
                style: TextStyle(fontSize: 13, color: Colors.white)),
          ),
          SizedBox(
            width: 20,
          )
          // TextButton(
          //   child: Text('Approve'),
          //   onPressed: () {
          //     Navigator.of(context).pop();
          //     Navigator.of(context).push(
          //       MaterialPageRoute(builder: (context) => SuccessPage()),
          //     );
          //   },
          // ),
        ],
      );
    },
  );
}
