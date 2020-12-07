import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/screens/homeScreen/home_screen.dart';
import 'package:invoice/screens/toolScreen/bloc/invoice_tools_bloc.dart';
import 'package:invoice/screens/toolScreen/tool_screen.dart';
import 'package:invoice/services/observer.dart';
import 'package:invoice/services/route_screen.dart';

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
      // home: HomeScreen(),
      home: BlocProvider(
        create: (context) => InvoiceToolsBloc(),
        child: ToolScreen(),
      ),
      routes: RouteScreen.routes,
    );
  }
}
