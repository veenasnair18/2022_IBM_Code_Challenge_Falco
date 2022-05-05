import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();

  int pageIndex = 0;
  bool isDialogOpen = false;

  void changePage(int index) {
    pageIndex = index;
    update();
  }

  void dialogControl(bool open) {
    isDialogOpen = open;
    update();
  }
}
