import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/constants/constants.dart';
import 'package:invoice/screens/formOrderScreen/form_order_screen.dart';
import 'package:invoice/screens/toolScreen/bloc/invoice_tools_bloc.dart';
import 'package:invoice/screens/widgets/control_progress_bar.dart';
import 'package:invoice/services/route_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showProgress = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Constants.iBackGroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ControlProgressBar(width: size.width),
              ),
              Expanded(
                flex: 5,
                child: MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(fontFamily: 'Prompt'),
                  routes: RouteScreen.routes,
                  home: BlocProvider(
                    create: (context) => InvoiceToolsBloc(),
                    child: FormOrderScreen(),
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
