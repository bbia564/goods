import 'package:get/get.dart';

import 'add_product_logic.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddProductLogic());
  }
}
