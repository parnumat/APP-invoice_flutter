import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:invoice/models/order.dart';
import 'package:invoice/services/dummy/dummy.dart';
import 'package:meta/meta.dart';

part 'choose_goods_detail_event.dart';
part 'choose_goods_detail_state.dart';

class ChooseGoodsDetailBloc
    extends Bloc<ChooseGoodsDetailEvent, ChooseGoodsDetailState> {
  var mainData = new List<Order>();
  var keepData = new List<Order>();
  ChooseGoodsDetailBloc() : super(ChooseGoodsDetailInitial());

  @override
  Stream<ChooseGoodsDetailState> mapEventToState(
    ChooseGoodsDetailEvent event,
  ) async* {
    if (event is GetOrderEvent) {
      yield* _loadedOrder(event);
    } else if (event is MoveToKeepEvent) {
      yield* _moveToKeep(event.index);
    } else if (event is KeepToMoveEvent) {
      yield* _keepToMain(event.index);
    }
  }

  Stream<ChooseGoodsDetailState> _loadedOrder(GetOrderEvent event) async* {
    List<Order> orderData = orderFromJson(Dummy.orders);
    mainData = orderData;
    keepData = [];
    yield MoveDetailsState(mainData, keepData);
  }

  Stream<ChooseGoodsDetailState> _moveToKeep(int index) async* {
    Order _data = mainData[index];
    keepData.add(_data);
    mainData.remove(_data);
    yield MoveDetailsState(mainData, keepData);
  }

  Stream<ChooseGoodsDetailState> _keepToMain(int index) async* {
    Order _data = keepData[index];
    mainData.add(_data);
    keepData.remove(_data);
    yield MoveDetailsState(mainData, keepData);
  }
}
