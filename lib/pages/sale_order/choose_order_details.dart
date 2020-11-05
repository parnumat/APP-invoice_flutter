import 'package:flutter/material.dart';
import 'package:invoice/pages/widget/custom_dialog_box.dart';

import '../tool_page.dart';
import 'book_tax_invoice.dart';

class ChooseOrderDetails extends StatefulWidget {
  ChooseOrderDetails({Key key}) : super(key: key);

  @override
  _ChooseOrderDetailsState createState() => _ChooseOrderDetailsState();
}

class _ChooseOrderDetailsState extends State<ChooseOrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    color: Colors.amber,
                    child: Center(
                      child: OutlineButton(
                        child: Text("GO BLACK!!"),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return CustomDialogBox();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Center(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.5)),
                        color: Color(0XFFFFD05B),
                        onPressed: () => Navigator.of(context)
                            .pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => ToolsPage()),
                                (Route<dynamic> route) => false),
                        child: Text("ต่อไป",
                            style:
                                TextStyle(fontSize: 13, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
