import 'package:get/get.dart';

import '../controllers/frontscreen_controller.dart';

class FrontscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FrontscreenController>(
      () => FrontscreenController(),
    );
  }
}
