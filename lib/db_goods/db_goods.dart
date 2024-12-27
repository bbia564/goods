import 'dart:convert';

import 'package:get/get.dart';
import 'package:goods_storage/db_goods/goods_entity.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBGoods extends GetxService {
  late Database dbBase;

  Future<DBGoods> init() async {
    await createGoodsDB();
    return this;
  }

  createGoodsDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'goods.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createGoodsTable(db);
          await createProductTable(db);
        });
  }

  createGoodsTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS goods (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, quantityMax INTEGER)');
  }

  createProductTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS product (id INTEGER PRIMARY KEY, createdTime TEXT, image BLOB, goods TEXT, name TEXT, quantity INTEGER)');
  }

  insertGoods(GoodsEntity entity) async {
    final id = await dbBase.insert('goods', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'quantityMax': entity.quantityMax,
    });
    return id;
  }

  insertProduct(ProductEntity entity) async {
    final id = await dbBase.insert('product', {
      'createdTime': entity.createdTime.toIso8601String(),
      'image': entity.image,
      'goods': jsonEncode(entity.goods),
      'name': entity.name,
      'quantity': entity.quantity,
    });
    return id;
  }

  updateProduct(ProductEntity entity) async {
    await dbBase.update('product', {
      'image': entity.image,
      'goods': jsonEncode(entity.goods),
      'name': entity.name,
      'quantity': entity.quantity,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  deleteProduct(ProductEntity entity) async {
    await dbBase.delete('product', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanAllData() async {
    await dbBase.delete('goods');
    await dbBase.delete('product');
  }

  Future<List<GoodsEntity>> getGoodsAllData() async {
    var result = await dbBase.query('goods', orderBy: 'createdTime DESC');
    return result.map((e) => GoodsEntity.fromJson(e)).toList();
  }

  Future<List<ProductEntity>> getProductsAllData() async {
    var result = await dbBase.query('product', orderBy: 'createdTime DESC');
    return result.map((e) => ProductEntity.fromJson(e)).toList();
  }
}
