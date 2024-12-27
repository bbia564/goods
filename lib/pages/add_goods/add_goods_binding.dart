import 'package:get/get.dart';

import 'add_goods_logic.dart';

class AddGoodsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddGoodsLogic());
  }
}
