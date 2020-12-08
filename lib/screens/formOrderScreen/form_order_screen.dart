import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/screens/chooseOrderScreen/bloc/choose_goods_detail_bloc.dart';
import 'package:invoice/screens/formOrderScreen/widget/custom_dialog_box.dart';
import 'package:invoice/screens/formOrderScreen/widget/form_detail.dart';
import 'package:invoice/screens/widgets/control_progress_bar.dart';

class FormOrderScreen extends StatefulWidget {
  final String numTax;
  FormOrderScreen({Key key, this.numTax}) : super(key: key);

  @override
  _FormOrderScreenState createState() => _FormOrderScreenState();
}

class _FormOrderScreenState extends State<FormOrderScreen> {
  double _h = 120.0;
  // double _value = 0;

  // TextEditingController _conNumTax = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    // bool _show = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: _height,
          child: Center(
            child: Wrap(
              direction: Axis.horizontal,
              children: [
                AnimatedContainer(
                  height: _h,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInExpo,
                  child: OverflowBox(
                      minHeight: 0,
                      child: _h > 119
                          ? ControlProgressBar(width: _width)
                          : Container()),
                ),
                Container(
                  height: _height * 0.65,
                  padding: const EdgeInsets.all(Constants.iDefaultPadding),
                  child: Center(
                    child: FormDetail(widget: widget),
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
                          onPressed: () =>
                              Navigator.pushNamed(context, 'fourth-screen'),
                          // Navigator.of(context)
                          //     .push(createRoute(GoodsScreen())),
                          child: Text("ต่อไป",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'third-screen-v1'),
                          child: Text("เลือกใบ V1",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return BlocProvider(
                                  create: (context) => ChooseGoodsDetailBloc(),
                                  child: CustomDialogBox(),
                                );
                              },
                            );
                          },
                          child: Text("เลือกใบ POP UP",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'third-screen-v2'),
                          child: Text("เลือกใบ V2",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'third-screen-v3'),
                          child: Text("เลือกใบ V3",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFFFD05B),
                          onPressed: () =>
                              Navigator.pushNamed(context, 'third-screen-v4'),
                          child: Text("เลือกใบ V4",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
                        ),
                        SizedBox(width: 20),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: Color(0XFFEDEDED),
                          onPressed: () {
                            setState(() {
                              if (_h > 0.0) {
                                _h = 0.0;
                              } else {
                                _h = 120.0;
                              }
                              print(_h);
                            });
                          },
                          child: Text("Hidden Progressbar",
                              style: TextStyle(
                                  fontSize: Constants.iTextSize,
                                  color: Colors.white)),
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
}
