import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/models/http_test.dart';
import 'package:invoice/screens/toolScreen/bloc/invoice_tools_bloc.dart';
import 'package:invoice/screens/toolScreen/widget/tool_card.dart';
import 'package:http/http.dart' as http;

class ToolScreen extends StatefulWidget {
  @override
  _ToolScreenState createState() => _ToolScreenState();
}

class _ToolScreenState extends State<ToolScreen> {
  InvoiceToolsBloc _invoiceToolsBloc;

  @override
  Widget build(BuildContext context) {
    _invoiceToolsBloc = BlocProvider.of<InvoiceToolsBloc>(
        context); //DI == dependence injunction
    _invoiceToolsBloc.add(GetInvoiceTools());

    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: FadeXAnimation(
                    delay: 0.3,
                    child: Container(
                      child: Align(
                        alignment: Alignment(-0.65, 1.0),
                        child: Row(
                          children: [
                            SizedBox(width: 120),
                            Text(
                              "Invoice Tools",
                              style: TextStyle(
                                  fontSize: 44, fontWeight: FontWeight.w600),
                            ),
                            CupertinoButton(
                              child: Text("HTTP"),
                              onPressed: () async {
                                List<String> url = [
                                  'https://reqres.in/api/users?page=2',
                                  "https://192.168.55.100:1150/api/invoice/goods"
                                ];
                                var response = await http.get(url[0]);
                                if (response.statusCode == 200) {
                                  var res = userTestFromJson(response.body);
                                  print(res.data[0].firstName);
                                  _showCupertinoDialog(
                                      title: res.data[0].email);
                                } else {
                                  print(Exception(
                                      'Failed to load invoice tools'));
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100, 20, 100, 50),
                        child: Container(
                          child:
                              BlocBuilder<InvoiceToolsBloc, InvoiceToolsState>(
                            builder: (context, state) => (state
                                    is LoadedInvoiceToolsState)
                                ? GridView.count(
                                    primary: false,
                                    mainAxisSpacing: 32,
                                    crossAxisCount: 4,
                                    children: List.generate(
                                      state.invoiceToolsMap.length,
                                      (index) => ToolCard(
                                        assetImage: state
                                            .invoiceToolsMap[index].assetImage,
                                        message: state
                                            .invoiceToolsMap[index].message,
                                        code: state.invoiceToolsMap[index].code,
                                      ),
                                    ))
                                : Center(
                                    child: CircularProgressIndicator(),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // ),
      ),
    );
  }

  _showCupertinoDialog({title}) {
    showDialog(
        context: context,
        builder: (_) => CupertinoAlertDialog(
              title: Text(title),
              content: Text("Hey! I'm Coflutter!"),
              actions: <Widget>[
                FlatButton(
                  child: Text('Close me!'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ));
  }
}
