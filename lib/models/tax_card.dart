import 'dart:convert';

List<TaxCard> taxCardFromJson(String str) =>
    List<TaxCard>.from(json.decode(str).map((x) => TaxCard.fromJson(x)));

String taxCardToJson(List<TaxCard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaxCard {
  TaxCard({
    this.numTax,
    this.memDate,
    this.memUser,
  });

  String numTax;
  String memDate;
  String memUser;

  factory TaxCard.fromJson(Map<String, dynamic> json) => TaxCard(
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
