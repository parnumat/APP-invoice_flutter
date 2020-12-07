import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoice/screens/chooseOrderScreen/bloc/choose_goods_detail_bloc.dart';
import 'package:invoice/screens/chooseOrderScreen/chooseOrderScreenV1/choose_order_screen_v1.dart';
import 'package:invoice/screens/chooseOrderScreen/chooseOrderScreenV2/choose.order_screen_v2.dart';
import 'package:invoice/screens/chooseOrderScreen/chooseOrderScreenV3/choose.order_screen_v3.dart';
import 'package:invoice/screens/chooseOrderScreen/chooseOrderScreenV4/choose.order_screen_v4.dart';
import 'package:invoice/screens/detailScreen/detailScreenV1/detail.screen_v1.dart';
import 'package:invoice/screens/detailScreen/detailScreenV2/detail.screen_v2.dart';
import 'package:invoice/screens/formOrderScreen/form_order_screen.dart';
import 'package:invoice/screens/goodsScreen/goods_screen.dart';
import 'package:invoice/screens/successScreen/success_screen.dart';
import 'package:invoice/screens/toolScreen/tool_screen.dart';

class RouteScreen {
  RouteScreen._();
  static Map<String, Widget Function(BuildContext)> routes = {
    'home-screen': (context) => (ToolScreen()),
    'second-screen': (context) => FormOrderScreen(),
    'third-screen-v1': (context) => ChooseOrderScreenV1(),
    'third-screen-v2': (context) => BlocProvider(
        create: (context) => ChooseGoodsDetailBloc(),
        child: ChooseOrderScreenV2()),
    'third-screen-v3': (context) => BlocProvider(
        create: (context) => ChooseGoodsDetailBloc(),
        child: ChooseOrderScreenV3()),
    'third-screen-v4': (context) => BlocProvider(
        create: (context) => ChooseGoodsDetailBloc(),
        child: ChooseOrderScreenV4()),
    'fourth-screen': (context) => GoodsScreen(),
    'fifth-screen': (context) => SuccessScreen(),
    'last-screen-v1': (context) => DetailScreenV1(),
    'last-screen-v2': (context) => DetailScreenV2()
  };
}
