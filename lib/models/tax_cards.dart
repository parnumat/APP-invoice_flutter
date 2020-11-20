import 'dart:convert';

List<TaxCards> taxCardsFromJson(String str) =>
    List<TaxCards>.from(json.decode(str).map((x) => TaxCards.fromJson(x)));

String taxCardsToJson(List<TaxCards> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TaxCards {
  TaxCards({
    this.codeTax,
    this.nameTax,
    this.numTax,
  });

  String codeTax;
  String nameTax;
  String numTax;

  factory TaxCards.fromJson(Map<String, dynamic> json) => TaxCards(
        codeTax: json["codeTax"],
        nameTax: json["nameTax"],
        numTax: json["numTax"],
      );

  Map<String, dynamic> toJson() => {
        "codeTax": codeTax,
        "nameTax": nameTax,
        "numTax": numTax,
      };
}
