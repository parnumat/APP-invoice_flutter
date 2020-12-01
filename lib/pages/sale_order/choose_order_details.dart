import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/pages/sale_order/choose_order_date.dart';
import 'package:invoice/pages/widget/custom_progressbar.dart';
import 'package:invoice/services/bloc/choose_goods_detail_bloc.dart';

class ChooseOrderDetails extends StatefulWidget {
  ChooseOrderDetails({Key key}) : super(key: key);

  @override
  _ChooseOrderDetailsState createState() => _ChooseOrderDetailsState();
}

class _ChooseOrderDetailsState extends State<ChooseOrderDetails> {
  TextEditingController _codeTool = new TextEditingController();
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    ChooseGoodsDetailBloc _bloc =
        BlocProvider.of<ChooseGoodsDetailBloc>(context);
    _bloc.add(GetOrderEvent());

    double _width = MediaQuery.of(context).size.width;
    // double _height = MediaQuery.of(context).size.height;
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
                          Text("เลขที่ใบสั่งขาย",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.w500)),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            width: 350,
                            height: 35,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.top,
                              style: TextStyle(fontSize: 17),
                              controller: _codeTool,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'หมายเลขใบสั่งขาย',
                              ),
                            ),
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
                        child: BlocBuilder<ChooseGoodsDetailBloc,
                            ChooseGoodsDetailState>(
                          builder: (context, state) {
                            return DataTable(
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
                              rows: (state is MoveDetailsState &&
                                      state.mainData != [])
                                  ? List.generate(
                                      state.mainData.length,
                                      (index) => _customRow(
                                          press: () => _bloc.add(
                                              MoveToKeepEvent(index: index)),
                                          numBuy: state.mainData[index].numBuy,
                                          returnDate:
                                              state.mainData[index].returnDate,
                                          goodsCode:
                                              state.mainData[index].goodsCode,
                                          goodsName:
                                              state.mainData[index].goodsName,
                                          number: state.mainData[index].number,
                                          weight: state.mainData[index].weight,
                                          unit: state.mainData[index].unit))
                                  : [],
                            );
                          },
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
                        child: BlocBuilder<ChooseGoodsDetailBloc,
                            ChooseGoodsDetailState>(
                          builder: (context, state) {
                            return DataTable(
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
                              rows: (state is MoveDetailsState &&
                                      state.keepData != [])
                                  ? List.generate(
                                      state.keepData.length,
                                      (index) => _customRow(
                                          press: () => _bloc.add(
                                              KeepToMoveEvent(index: index)),
                                          numBuy: state.keepData[index].numBuy,
                                          returnDate:
                                              state.keepData[index].returnDate,
                                          goodsCode:
                                              state.keepData[index].goodsCode,
                                          goodsName:
                                              state.keepData[index].goodsName,
                                          number: state.keepData[index].number,
                                          weight: state.keepData[index].weight,
                                          unit: state.keepData[index].unit))
                                  : [],
                            );
                          },
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
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChooseOrderDate(),
                            ),
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

  _customRow(
      {numBuy,
      returnDate,
      goodsCode,
      goodsName,
      number,
      weight,
      unit,
      Function press}) {
    var dataRow = DataRow(
      cells: <DataCell>[
        DataCell(Text(numBuy), onTap: () {
          print(1);
          return press;
        }),
        DataCell(Text(returnDate), onTap: () => press),
        DataCell(Text(goodsCode), onTap: () => press),
        DataCell(
            Text(
              goodsName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () => press),
        DataCell(Text(number), onTap: () => press),
        DataCell(Text(weight), onTap: () => press),
        DataCell(Text(unit), onTap: () => press),
      ],
    );
    return dataRow;
  }
}
