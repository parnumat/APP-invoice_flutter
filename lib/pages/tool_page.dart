import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/models/invoice_tools.dart';
import 'package:invoice/pages/widget/custom_card_tool.dart';
import 'package:invoice/services/bloc/invoice_tools_bloc.dart';

class ToolsPage extends StatefulWidget {
  ToolsPage({Key key}) : super(key: key);

  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
  String invoiceTools =
      '[ { "assetImage": "assets/images/WG6.png", "message": "เวลโกรว์ ซอย6", "code": "SI005" }, { "assetImage": "assets/images/LKB.png", "message": "ลาดกระบัง", "code": "SI002" }, { "assetImage": "assets/images/B1.png", "message": "เป่าฟิล์ม (B1)", "code": "SI010" }, { "assetImage": "assets/images/B2.png", "message": "เป่าฟิล์ม (B2)", "code": "SI015" }, { "assetImage": "assets/images/WG6OUT.png", "message": "เวลโกรว์ ต่างประเทศ", "code": "EXPF" }, { "assetImage": "assets/images/LKBOUT.png", "message": "ลาดกระบัง ต่างประเทศ", "code": "EXPF" }, { "assetImage": "assets/images/LAP.png", "message": "เบิก แอล.เอ.พี", "code": "SI005" }, { "assetImage": "assets/images/KPP.png", "message": "เบิก เค.พี.พี", "code": "SI005" } ]';
  InvoiceToolsBloc _invoiceToolsBloc;

  @override
  Widget build(BuildContext context) {
    _invoiceToolsBloc = BlocProvider.of<InvoiceToolsBloc>(context);
    _invoiceToolsBloc.add(GetInvoiceTools());
    List<InvoiceTools> invoiceToolsMap = invoiceToolsFromJson(invoiceTools);
    // print(invoiceToolsMap);
    return Scaffold(
      backgroundColor: Color(0xFFE8ECEF),
      body:
          // BlocBuilder(
          //   builder: (context, state) =>
          SafeArea(
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
                        child: Text(
                          "Invoice Tools",
                          style: TextStyle(
                              fontSize: 44, fontWeight: FontWeight.w600),
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
                          child: GridView.count(
                            primary: false,
                            mainAxisSpacing: 32,
                            crossAxisCount: 4,
                            children: List.generate(
                              invoiceToolsMap.length,
                              (index) => ToolCard(
                                assetImage: invoiceToolsMap[index].assetImage,
                                message: invoiceToolsMap[index].message,
                                code: invoiceToolsMap[index].code,
                              ),
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
      ),
      // ),
    );
  }
}
