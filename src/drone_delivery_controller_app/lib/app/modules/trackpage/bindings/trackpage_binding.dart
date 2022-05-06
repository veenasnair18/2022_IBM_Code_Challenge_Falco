import 'package:get/get.dart';

import '../controllers/trackpage_controller.dart';

class TrackpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackpageController>(
      () => TrackpageController(),
    );
  }
}
