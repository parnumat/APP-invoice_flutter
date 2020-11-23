part of 'dataform_bloc.dart';

@immutable
abstract class DataformEvent {}

class FromInvoice extends DataformEvent {
  final String txt;

  FromInvoice(
    this.txt,
  );

  @override
  String toString() {
    return super.toString();
  }
}
