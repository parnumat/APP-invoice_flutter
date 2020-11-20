import 'dart:convert';

List<Goods> goodsFromJson(String str) =>
    List<Goods>.from(json.decode(str).map((x) => Goods.fromJson(x)));

String goodsToJson(List<Goods> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Goods {
  Goods({
    this.barCode,
    this.numProduct,
    this.saleLot,
    this.pallet,
    this.partNum,
    this.number,
    this.weight,
  });

  String barCode;
  String numProduct;
  String saleLot;
  String pallet;
  String partNum;
  String number;
  String weight;

  factory Goods.fromJson(Map<String, dynamic> json) => Goods(
        barCode: json["barCode"],
        numProduct: json["numProduct"],
        saleLot: json["saleLot"],
        pallet: json["pallet"],
        partNum: json["partNum"],
        number: json["number"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "barCode": barCode,
        "numProduct": numProduct,
        "saleLot": saleLot,
        "pallet": pallet,
        "partNum": partNum,
        "number": number,
        "weight": weight,
      };
}
