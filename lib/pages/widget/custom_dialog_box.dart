import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/pages/sale_order/choose_order_details.dart';
import 'package:invoice/services/bloc/choose_goods_detail_bloc.dart';

class CustomDialogBox extends StatefulWidget {
  const CustomDialogBox({Key key}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  // final _formKey = GlobalKey<FormState>();
  // TextEditingController _codeTool = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    ChooseGoodsDetailBloc _bloc =
        BlocProvider.of<ChooseGoodsDetailBloc>(context);
    _bloc.add(GetOrderEvent());
    return Center(
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Constants.padding),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: contentBox(context, _bloc),
      ),
    );
  }

  contentBox(context, ChooseGoodsDetailBloc _bloc) {
    return Wrap(
      children: <Widget>[
        Container(
          width: 800,
          padding: EdgeInsets.only(
              left: Constants.padding,
              top: Constants.avatarRadius + Constants.padding,
              right: Constants.padding,
              bottom: Constants.padding),
          margin: EdgeInsets.only(top: Constants.avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(Constants.padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("เลขที่ใบสั่งขาย",
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w400)),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: 250,
                    height: 35,
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      style: TextStyle(fontSize: 17),
                      // controller: _codeTool,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 25,
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(20)),
                child:
                    BlocBuilder<ChooseGoodsDetailBloc, ChooseGoodsDetailState>(
                  builder: (context, state) {
                    return DataTable(
                        headingRowHeight: 35,
                        columnSpacing: 20,
                        dataRowHeight: 55,
                        columns: [
                          DataColumn(label: Text('รหัสสินค้า')),
                          DataColumn(label: Text('ชื่อสินค้า')),
                          DataColumn(label: Text('จำนวน')),
                          DataColumn(label: Text('หน่วย')),
                          DataColumn(label: Text('กำหนดส่งสินค้า')),
                        ],
                        rows: (state is MoveDetailsState &&
                                state.mainData != [])
                            ? List.generate(
                                state.mainData.length,
                                (index) => _customRow(
                                    press: () => _bloc
                                        .add(MoveToKeepEvent(index: index)),
                                    goodsCode: state.mainData[index].goodsCode,
                                    goodsName: state.mainData[index].goodsName,
                                    number: state.mainData[index].number,
                                    unit: state.mainData[index].unit,
                                    returnDate:
                                        state.mainData[index].returnDate))
                            : []);
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
                child:
                    BlocBuilder<ChooseGoodsDetailBloc, ChooseGoodsDetailState>(
                  builder: (context, state) {
                    return DataTable(
                        headingRowHeight: 35,
                        columnSpacing: 20,
                        dataRowHeight: 55,
                        columns: [
                          DataColumn(label: Text('รหัสสินค้า')),
                          DataColumn(label: Text('ชื่อสินค้า')),
                          DataColumn(label: Text('จำนวน')),
                          DataColumn(label: Text('หน่วย')),
                          DataColumn(label: Text('กำหนดส่งสินค้า')),
                        ],
                        rows: (state is MoveDetailsState &&
                                state.keepData != [])
                            ? List.generate(
                                state.keepData.length,
                                (index) => _customRow(
                                    press: () => _bloc
                                        .add(KeepToMoveEvent(index: index)),
                                    goodsCode: state.keepData[index].goodsCode,
                                    goodsName: state.keepData[index].goodsName,
                                    number: state.keepData[index].number,
                                    unit: state.keepData[index].unit,
                                    returnDate:
                                        state.keepData[index].returnDate))
                            : []);
                  },
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0XFFFFD05B),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) {
                        return BlocProvider(
                          create: (context) => ChooseGoodsDetailBloc(),
                          child: ChooseOrderDetails(),
                        );
                      }),
                    ),
                    child: Text("เลือก",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
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
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0XFF29EAA4),
                    onPressed: () {
                      _bloc.add(MoveToKeepEvent(index: 0));
                    },
                    child: Text("MainToKeep",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                  SizedBox(
                    width: 37,
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    color: Color(0XFF29EAA4),
                    onPressed: () {
                      _bloc.add(KeepToMoveEvent(index: 1));
                    },
                    child: Text("KeepToMain",
                        style: TextStyle(fontSize: 13, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  _customRow({goodsCode, goodsName, number, unit, returnDate, Function press}) {
    var dataRow = DataRow(
      // onSelectChanged: (value) => bloc.add(KeepToMoveEvent(index: index)),
      cells: <DataCell>[
        DataCell(Text(goodsCode), onTap: press),
        DataCell(
            Text(
              goodsName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: press),
        DataCell(Text(number), onTap: press),
        DataCell(Text(unit), onTap: press),
        DataCell(Text(returnDate), onTap: press),
      ],
    );
    return dataRow;
  }
}
