import 'package:get/get.dart';
import 'package:goods_storage/db_goods/db_goods.dart';
import 'package:goods_storage/db_goods/goods_entity.dart';

class GoodsFirstLogic extends GetxController {

  DBGoods dbGoods = Get.find<DBGoods>();

  var allCount = 0.obs;

  List<GoodsEntity> allGoods = [];

  void getData() async {
    final goods = await dbGoods.getGoodsAllData();
    final products = await dbGoods.getProductsAllData();
    allGoods.clear();
    for (var item in goods) {
      final goodsProducts = products.where((element) => element.goods.id == item.id).toList();
      item.products = goodsProducts;
      allGoods.add(item);
    }
    allCount.value = products.length;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
