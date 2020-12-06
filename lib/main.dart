import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/screens/toolScreen/tool_screen.dart';
import 'package:invoice/services/bloc/invoice_tools_bloc.dart';
import 'package:invoice/services/observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Prompt'),
      home: BlocProvider(
        create: (context) => InvoiceToolsBloc(),
        child: ToolScreen(),
      ),
    );
  }
}
