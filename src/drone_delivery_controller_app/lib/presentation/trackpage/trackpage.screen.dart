import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/trackpage.controller.dart';

class TrackpageScreen extends GetView<TrackpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Center(child: Container(
       height: Get.height,
       child: Image.asset("assets/map.jpg",fit:BoxFit.fill,))),
    );
  }
}
