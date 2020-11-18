import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/animations/fade_animation.dart';
import 'package:invoice/models/invoice_tools.dart';
import 'package:invoice/pages/widget/custom_card_tool.dart';
import 'package:invoice/services/bloc/invoice_tools_bloc.dart';

class ToolsPage extends StatefulWidget {
  @override
  _ToolsPageState createState() => _ToolsPageState();
}

class _ToolsPageState extends State<ToolsPage> {
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
}
