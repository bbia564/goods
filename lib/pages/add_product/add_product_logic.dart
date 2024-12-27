import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:goods_storage/db_goods/goods_entity.dart';
import 'package:image_picker/image_picker.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../db_goods/db_goods.dart';

class AddProductLogic extends GetxController {
  DBGoods dbGoods = Get.find<DBGoods>();

  ProductEntity? productEntity = Get.arguments;

  List<GoodsEntity> allGoods = [];

  Uint8List? image;
  GoodsEntity? goodsEntity;
  String name = '';
  var quantityCount = 1.obs;

  void subAdd({bool isAdd = true}) {
    if (isAdd) {
      quantityCount.value++;
    } else {
      if (quantityCount.value == 1) {
        return;
      }
      quantityCount.value--;
    }
  }

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(
          imageQuality: 90, maxWidth: 1024, source: ImageSource.gallery);
      if (pickedFile != null) {
        final imageBytes = await pickedFile.readAsBytes();
        image = imageBytes;
        update();
      }
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Please check album permissions or select a new image');
      return;
    }
  }

  void showGoods() {
    Get.bottomSheet(Container(
      width: double.infinity,
      height: 300,
      child: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: allGoods.length,
              itemBuilder: (_, index) {
                final entity = allGoods[index];
                return Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: <Widget>[
                    Expanded(child: Text(entity.name)),
                    const SizedBox(width: 10,),
                    Text('QuantityMax: ${entity.quantityMax}')
                  ].toRow(),
                )
                    .decorated(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10))
                    .marginOnly(bottom: 10)
                    .gestures(onTap: () {
                  goodsEntity = allGoods[index];
                  update();
                  Get.back();
                });
              })),
    ).decorated(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20))));
  }

  void addProduct() async {
    if (image == null) {
      Fluttertoast.showToast(msg: 'Please select an image');
      return;
    }
    if (goodsEntity == null) {
      Fluttertoast.showToast(msg: 'Please select a storage area');
      return;
    }
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the name of the product');
      return;
    }
    if (quantityCount.value > goodsEntity!.quantityMax) {
      Fluttertoast.showToast(
          msg: 'The number of products exceeds the maximum number of products');
      return;
    }
    ProductEntity entity = ProductEntity(
      id: 0,
      createdTime: DateTime.now(),
      image: image!,
      goods: goodsEntity!,
      name: name,
      quantity: quantityCount.value,
    );
    await dbGoods.insertProduct(entity);
    Get.back();
  }

  @override
  void onInit() async {
    // TODO: implement onInit
    allGoods = await dbGoods.getGoodsAllData();
    if (productEntity != null) {
      image = productEntity!.image;
      goodsEntity = productEntity!.goods;
      name = productEntity!.name;
      quantityCount.value = productEntity!.quantity;
    }
    update();
    super.onInit();
  }
}
