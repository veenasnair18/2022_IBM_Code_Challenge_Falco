import 'package:get/get.dart';

import '../../../../presentation/trackpage/controllers/trackpage.controller.dart';

class TrackpageControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TrackpageController>(
      () => TrackpageController(),
    );
  }
}
