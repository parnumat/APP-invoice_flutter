part of 'invoice_tools_bloc.dart';

String invoiceTools =
    '[ { "assetImage": "assets/images/WG6.png", "message": "เวลโกรว์ ซอย6", "code": "SI005" }, { "assetImage": "assets/images/LKB.png", "message": "ลาดกระบัง", "code": "SI002" }, { "assetImage": "assets/images/B1.png", "message": "เป่าฟิล์ม (B1)", "code": "SI010" }, { "assetImage": "assets/images/B2.png", "message": "เป่าฟิล์ม (B2)", "code": "SI015" }, { "assetImage": "assets/images/WG6OUT.png", "message": "เวลโกรว์ ต่างประเทศ", "code": "EXPF" }, { "assetImage": "assets/images/LKBOUT.png", "message": "ลาดกระบัง ต่างประเทศ", "code": "EXPF" }, { "assetImage": "assets/images/LAP.png", "message": "เบิก แอล.เอ.พี", "code": "SI005" }, { "assetImage": "assets/images/KPP.png", "message": "เบิก เค.พี.พี", "code": "SI005" } ]';

@immutable
abstract class InvoiceToolsState {}

// List<InvoiceTools> invoiceToolsMap = invoiceToolsFromJson(invoiceTools);

class InvoiceToolsInitial extends InvoiceToolsState {
  @override
  String toString() {
    return super.toString();
  }
}

class LoadingInvoiceToolsState extends InvoiceToolsState {
  @override
  String toString() {
    return super.toString();
  }
}

class LoaedInvoiceToolsState extends InvoiceToolsState {
  final List<InvoiceTools> invoiceToolsMap;
  LoaedInvoiceToolsState(this.invoiceToolsMap);
  @override
  String toString() {
    return super.toString();
  }
}
