import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:drone_delivery_customer/app/widgets/input_widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/config.dart';
import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold();
  }
}
