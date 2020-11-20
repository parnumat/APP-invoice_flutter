import 'dart:convert';

List<GoodOrders> goodOrdersFromJson(String str) =>
    List<GoodOrders>.from(json.decode(str).map((x) => GoodOrders.fromJson(x)));

String goodOrdersToJson(List<GoodOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoodOrders {
  GoodOrders({
    this.barCode,
    this.lot,
    this.number,
    this.weight,
  });

  String barCode;
  String lot;
  String number;
  String weight;

  factory GoodOrders.fromJson(Map<String, dynamic> json) => GoodOrders(
        barCode: json["barCode"],
        lot: json["lot"],
        number: json["number"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "barCode": barCode,
        "lot": lot,
        "number": number,
        "weight": weight,
      };
}
