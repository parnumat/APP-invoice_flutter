import 'dart:convert';

List<InvoiceTools> invoiceToolsFromJson(String str) => List<InvoiceTools>.from(
    json.decode(str).map((x) => InvoiceTools.fromJson(x)));

String invoiceToolsToJson(List<InvoiceTools> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InvoiceTools {
  InvoiceTools({
    this.assetImage,
    this.message,
    this.code,
  });

  String assetImage;
  String message;
  String code;

  factory InvoiceTools.fromJson(Map<String, dynamic> json) => InvoiceTools(
        assetImage: json["assetImage"],
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "assetImage": assetImage,
        "message": message,
        "code": code,
      };
}
