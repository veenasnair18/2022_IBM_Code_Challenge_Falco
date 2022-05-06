import 'package:drone_delivery/app/modules/frontscreen/views/frontscreen_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/order_assign_controller.dart';

class OrderAssignView extends GetView<OrderAssignController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * 0.22,
            ),
            Lottie.asset('assets/order_Placed.json', repeat: false),
            SizedBox(
              height: Get.height * 0.14,
            ),
            FloatingActionButton.extended(
              label: Text('Home'), // <-- Text
              backgroundColor: Color.fromARGB(255, 157, 97, 199),
              icon: Icon(
                // <-- Icon
                Icons.inventory,
                size: 24.0,
              ),
              onPressed: () {
                Get.to(FrontscreenView());
              },
            ),
          ],
        ),
      ),
    );
  }
}
