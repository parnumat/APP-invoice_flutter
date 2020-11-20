import 'dart:convert';

List<BookTax> bookTaxFromJson(String str) =>
    List<BookTax>.from(json.decode(str).map((x) => BookTax.fromJson(x)));

String bookTaxToJson(List<BookTax> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BookTax {
  BookTax({
    this.numTax,
    this.memDate,
    this.memUser,
  });

  String numTax;
  String memDate;
  String memUser;

  factory BookTax.fromJson(Map<String, dynamic> json) => BookTax(
        numTax: json["numTax"],
        memDate: json["memDate"],
        memUser: json["memUser"],
      );

  Map<String, dynamic> toJson() => {
        "numTax": numTax,
        "memDate": memDate,
        "memUser": memUser,
      };
}
