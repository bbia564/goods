import 'package:get/get.dart';

import 'product_bind_logic.dart';

class ProductBindBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
