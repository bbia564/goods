import 'package:get/get.dart';

import 'goods_second_logic.dart';

class GoodsSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GoodsSecondLogic());
  }
}
