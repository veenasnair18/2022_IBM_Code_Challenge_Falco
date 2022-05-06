import 'package:get/get.dart';

import '../controllers/order_assign_controller.dart';

class OrderAssignBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderAssignController>(
      () => OrderAssignController(),
    );
  }
}
