import 'dart:convert';

List<GoodsOrders> goodsOrdersFromJson(String str) => List<GoodsOrders>.from(
    json.decode(str).map((x) => GoodsOrders.fromJson(x)));

String goodsOrdersToJson(List<GoodsOrders> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GoodsOrders {
  GoodsOrders({
    this.barCode,
    this.lot,
    this.number,
    this.weight,
  });

  String barCode;
  String lot;
  String number;
  String weight;

  factory GoodsOrders.fromJson(Map<String, dynamic> json) => GoodsOrders(
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
