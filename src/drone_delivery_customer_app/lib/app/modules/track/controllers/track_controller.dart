import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackController extends GetxController {
  final LatLng center = const LatLng(45.521563, -122.677433);

  //TODO: Implement TrackController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
