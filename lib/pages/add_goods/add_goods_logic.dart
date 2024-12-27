import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:goods_storage/db_goods/db_goods.dart';

import '../../db_goods/goods_entity.dart';

class AddGoodsLogic extends GetxController {

  DBGoods dbGoods = Get.find<DBGoods>();

  String name = '';
  var quantityMax = 1.obs;

  void subAdd({bool isAdd = true}) {
    if (isAdd) {
      quantityMax.value++;
    } else {
      if (quantityMax.value == 1) {
        return;
      }
      quantityMax.value--;
    }
  }

  void addGoods() async {
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the name of the goods');
      return;
    }
    GoodsEntity entity = GoodsEntity(
      id: 0,
      createdTime: DateTime.now(),
      name: name,
      quantityMax: quantityMax.value,
    );
    await dbGoods.insertGoods(entity);
    Get.back();
  }

}
