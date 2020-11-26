part of 'choose_goods_detail_bloc.dart';

@immutable
abstract class ChooseGoodsDetailState {}

class ChooseGoodsDetailInitial extends ChooseGoodsDetailState {}

class MoveDetailsState extends ChooseGoodsDetailState {
  final List<Order> mainData;
  final List<Order> keepData;
  MoveDetailsState(this.mainData, this.keepData);
}
