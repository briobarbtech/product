import 'dart:convert';

import 'package:proy_productos_v1/features/product/domain/entities/product.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel implements Product {
  ProductModel(
      {required this.id,
      required this.name,
      required this.price,
      required this.quantity});

  @override
  int id;
  @override
  String name;
  @override
  String price;
  @override
  String quantity;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
      id: json["id"],
      name: json["name"],
      price: json["price"].toString(),
      quantity: json["quantity"].toString());

  Map<String, dynamic> toJson() =>
      {"name": name, "price": price, "quantity": quantity};
}
