import 'dart:convert';
import 'dart:typed_data';

class GoodsEntity {
  int id;
  DateTime createdTime;
  String name;
  int quantityMax;
  List<ProductEntity> products = [];

  GoodsEntity({
    required this.id,
    required this.createdTime,
    required this.name,
    required this.quantityMax
  });

  factory GoodsEntity.fromJson(Map<String, dynamic> json) {
    return GoodsEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      name: json['name'],
      quantityMax: json['quantityMax'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'name': name,
      'quantityMax': quantityMax,
    };
  }
}

class ProductEntity {
  int id;
  DateTime createdTime;
  Uint8List image;
  GoodsEntity goods;
  String name;
  int quantity;

  ProductEntity({
    required this.id,
    required this.createdTime,
    required this.image,
    required this.goods,
    required this.name,
    required this.quantity,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      image: json['image'],
      goods: GoodsEntity.fromJson(jsonDecode(json['goods'])),
      name: json['name'],
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
      'image': image,
      'goods': jsonEncode(goods.toJson()),
      'name': name,
      'quantity': quantity,
    };
  }
}