import 'dart:convert';

List<Order> orderFromJson(String str) =>
    List<Order>.from(json.decode(str).map((x) => Order.fromJson(x)));

String orderToJson(List<Order> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Order {
  Order({
    this.numBuy,
    this.returnDate,
    this.goodsCode,
    this.goodsName,
    this.number,
    this.weight,
    this.unit,
  });

  String numBuy;
  String returnDate;
  String goodsCode;
  String goodsName;
  String number;
  String weight;
  String unit;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        numBuy: json["numBuy"],
        returnDate: json["returnDate"],
        goodsCode: json["goodsCode"],
        goodsName: json["goodsName"],
        number: json["number"],
        weight: json["weight"],
        unit: json["unit"],
      );

  Map<String, dynamic> toJson() => {
        "numBuy": numBuy,
        "returnDate": returnDate,
        "goodsCode": goodsCode,
        "goodsName": goodsName,
        "number": number,
        "weight": weight,
        "unit": unit,
      };
}
