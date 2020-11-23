part of 'dataform_bloc.dart';

@immutable
abstract class DataformState {}

class DataformInitial extends DataformState {}

class FromInvoiceState extends DataformState {
  final String numTax;
  final String dateTax;
  final String limitDateTax;
  final String numSale;
  final String numBuy;
  final String keditDay;
  final String customerDetail;
  final String address;
  final String senderCode;
  final String senderName;
  final String carRegis;
  final String receiverName;
  final String note;

  FromInvoiceState(
      this.numTax,
      this.dateTax,
      this.limitDateTax,
      this.numSale,
      this.numBuy,
      this.keditDay,
      this.customerDetail,
      this.address,
      this.senderCode,
      this.senderName,
      this.carRegis,
      this.receiverName,
      this.note);

  @override
  String toString() {
    return super.toString();
  }
}
