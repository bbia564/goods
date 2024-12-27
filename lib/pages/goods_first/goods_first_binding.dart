import 'package:get/get.dart';

import 'goods_first_logic.dart';

class GoodsFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoodsFirstLogic());
  }
}
