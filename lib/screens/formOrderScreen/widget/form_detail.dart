import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:invoice/animations/routes/route_animation.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/screens/chooseOrderScreen/chooseOrderScreenV1/choose_order_screen_v1.dart';
// import 'package:invoice/pages/sale_order/book_tax_invoice.dart';
import 'package:invoice/screens/formOrderScreen/form_order_screen.dart';

class FormDetail extends StatefulWidget {
  const FormDetail({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final FormOrderScreen widget;

  @override
  _FormDetailState createState() => _FormDetailState();
}

class _FormDetailState extends State<FormDetail> {
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
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เลขที่ใบกำกับภาษี',
                style: TextStyle(
                  fontSize: Constants.iTextSize,
                  color: Constants.iTextColor,
                ),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 175,
                height: 28,
                decoration: BoxDecoration(
                  border: Border.all(color: Constants.iTextColor),
                  borderRadius: BorderRadius.circular(Constants.iBorderRadius),
                ),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Constants.iDefaultPadding / 3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.widget.numTax}/0000001",
                        style: TextStyle(
                          fontSize: Constants.iTextSize,
                          color: Constants.iTextColor,
                        ),
                      ),
                      Icon(
                        Icons.menu,
                        size: Constants.iConSize,
                        color: Constants.iConColor,
                      )
                    ],
                  ),
                )),
              ),
              Text(
                'วันที่ในใบกำกับภาษี',
                style: TextStyle(fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 175,
                height: 28,
                child: OutlineButton(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(Constants.iBorderRadius),
                  ),
                  borderSide: BorderSide(color: Colors.black54),
                  onPressed: () {
                    _selectDate(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatDate(selectedDate, [dd, '/', mm, '/', yyyy]),
                        style: TextStyle(
                            color: Constants.iTextColor,
                            fontSize: Constants.iTextSize),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.date_range,
                        color: Constants.iConColor,
                        size: Constants.iConSize,
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'วันครบกำหนดชำระ',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                  margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                  width: 160,
                  height: 28,
                  decoration: BoxDecoration(
                    border: Border.all(color: Constants.iTextColor),
                    borderRadius:
                        BorderRadius.circular(Constants.iBorderRadius),
                  ),
                  child: Center(
                      child: Text(
                    "05/11/2015",
                    style: TextStyle(
                        color: Constants.iTextColor,
                        fontSize: Constants.iTextSize),
                  ))),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'เลขที่ใบสั่งขาย',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(createRoute(ChooseOrderScreenV1())),
                child: Container(
                  margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                  width: 175,
                  height: 28,
                  decoration: BoxDecoration(
                      border: Border.all(color: Constants.iTextColor),
                      borderRadius:
                          BorderRadius.circular(Constants.iBorderRadius)),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: Constants.iDefaultPadding / 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Constants.iDefaultPadding / 4,
                        ),
                        Text(
                          "FM63090005",
                          style: TextStyle(
                            fontSize: Constants.iTextSize,
                            color: Constants.iTextColor,
                          ),
                        ),
                        Icon(
                          Icons.menu,
                          size: Constants.iConSize,
                          color: Constants.iConColor,
                        )
                      ],
                    ),
                  )),
                ),
              ),
              Text(
                'ใบสั่งซื้อเลขที่',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 200,
                height: 28,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.iTextColor),
                    borderRadius:
                        BorderRadius.circular(Constants.iBorderRadius)),
                child: Center(
                  child: Text(
                    "PO09102020",
                    style: TextStyle(
                        color: Constants.iTextColor,
                        fontSize: Constants.iTextSize),
                  ),
                ),
              ),
              Text(
                'เครดิต',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                  margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                  width: 74,
                  height: 45,
                  decoration: BoxDecoration(
                      border: Border.all(color: Constants.iTextColor),
                      borderRadius:
                          BorderRadius.circular(Constants.iBorderRadius)),
                  child: Center(
                    child: Text(
                      '60',
                      style: TextStyle(
                          color: Constants.iTextColor,
                          fontSize: Constants.iTextSize),
                    ),
                  )),
              Text(
                'วัน',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              SizedBox(
                width: 80,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ลูกค้า',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 870,
                height: 28,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.iTextColor),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Constants.iBorderRadius),
                              bottomLeft:
                                  Radius.circular(Constants.iBorderRadius))),
                      child: Center(
                        child: Text(
                          'CC032',
                          style: TextStyle(
                              color: Constants.iTextColor,
                              fontSize: Constants.iTextSize),
                        ),
                      ),
                    ),
                    Container(
                      width: 720,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.iTextColor),
                          borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Constants.iBorderRadius),
                              bottomRight:
                                  Radius.circular(Constants.iBorderRadius))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.iDefaultPadding / 2),
                        child: Text(
                          'คอลเกตปาล์มโอลีฟ(ประเทศไทย) บจ.',
                          style: TextStyle(
                              color: Constants.iTextColor,
                              fontSize: Constants.iTextSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'ที่อยู่',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 870,
                height: 28,
                decoration: BoxDecoration(
                    border: Border.all(color: Constants.iTextColor),
                    borderRadius:
                        BorderRadius.circular(Constants.iBorderRadius)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Constants.iDefaultPadding / 2),
                  child: Text(
                    '19 ซอยแยกถนน ณ ระนอง ถ.สุนทรโกษา แขวงคลองเตย เขตคลองเตย กรุงเทพมหานคร 10110',
                    style: TextStyle(
                        color: Constants.iTextColor,
                        fontSize: Constants.iTextSize),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'สถานที่ส่งของ',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 870,
                height: 28,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.iTextColor),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(Constants.iBorderRadius),
                              bottomLeft:
                                  Radius.circular(Constants.iBorderRadius))),
                      child: Center(
                        child: Text(
                          '000',
                          style: TextStyle(
                              color: Constants.iTextColor,
                              fontSize: Constants.iTextSize),
                        ),
                      ),
                    ),
                    Container(
                      width: 720,
                      decoration: BoxDecoration(
                          border: Border.all(color: Constants.iTextColor),
                          borderRadius: BorderRadius.only(
                              topRight:
                                  Radius.circular(Constants.iBorderRadius),
                              bottomRight:
                                  Radius.circular(Constants.iBorderRadius))),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Constants.iDefaultPadding / 2),
                        child: Text(
                          '19 ซอย แยกถนน ณ ระนอง ถ.สุนทรโกษา แขวง คลองเตย กรุงเทพมหานคร 10110',
                          style: TextStyle(
                              color: Constants.iTextColor,
                              fontSize: Constants.iTextSize),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'รหัสผู้ส่ง',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              SizedBox(width: 35),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 118,
                height: 35,
                child: TextField(
                  style: TextStyle(fontSize: Constants.iTextSize),
                  // controller: _codeTool,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.menu,
                      color: Constants.iConColor,
                      size: Constants.iConSize,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
                'ชื่อผู้ส่ง',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 180,
                height: 35,
                child: TextField(
                  style: TextStyle(fontSize: Constants.iTextSize),
                  // controller: _codeTool,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
                'ทะเบียนรถ',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 140,
                height: 35,
                child: TextField(
                  style: TextStyle(fontSize: Constants.iTextSize),
                  // controller: _codeTool,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Text(
                'ชื่อผู้รับ',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 180,
                height: 35,
                child: TextField(
                  style: TextStyle(fontSize: Constants.iTextSize),
                  // controller: _codeTool,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'หมายเหตุ',
                style: TextStyle(
                    color: Constants.iTextColor, fontSize: Constants.iTextSize),
              ),
              Container(
                margin: EdgeInsets.all(Constants.iDefaultPadding / 4),
                width: 870,
                height: 35,
                child: TextField(
                  style: TextStyle(fontSize: Constants.iTextSize),
                  // controller: _codeTool,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.menu,
                      color: Constants.iConColor,
                      size: Constants.iConSize,
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
