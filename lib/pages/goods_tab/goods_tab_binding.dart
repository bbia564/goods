import 'package:get/get.dart';
import 'package:goods_storage/pages/goods_first/goods_first_logic.dart';
import 'package:goods_storage/pages/goods_second/goods_second_logic.dart';

import 'goods_tab_logic.dart';

class GoodsTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoodsTabLogic());
    Get.lazyPut(() => GoodsFirstLogic());
    Get.lazyPut(() => GoodsSecondLogic());
  }
}
