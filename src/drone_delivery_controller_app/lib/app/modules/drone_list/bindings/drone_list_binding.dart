import 'package:get/get.dart';

import '../controllers/drone_list_controller.dart';

class DroneListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DroneListController>(
      () => DroneListController(),
    );
  }
}
