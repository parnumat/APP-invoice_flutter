part of 'choose_goods_detail_bloc.dart';

@immutable
abstract class ChooseGoodsDetailEvent {}

class GetOrderEvent extends ChooseGoodsDetailEvent {
  @override
  String toString() {
    return super.toString();
  }
}

class MoveToKeepEvent extends ChooseGoodsDetailEvent {
  final int index;
  MoveToKeepEvent({this.index});
  @override
  String toString() {
    return super.toString() + '$index';
  }
}

class KeepToMoveEvent extends ChooseGoodsDetailEvent {
  final int index;
  KeepToMoveEvent({this.index});
  @override
  String toString() {
    return super.toString() + '$index';
  }
}
