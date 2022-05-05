import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../notifications/toast.dart';

class LoginController extends GetxController {
  //Controllers
  TextEditingController phoneNumberController = TextEditingController();

  //Data
  String phoneNumber = "";
  @override
  void onInit() {
    phoneNumberController.addListener(() {
      phoneNumber = phoneNumberController.text;
    });
    super.onInit();
  }

  void onLoginClicked() {
    if (phoneNumber.length < 10 && phoneNumber.isPhoneNumber)
      showToast("Phone Number is Incorrect");
    else {
      Get.toNamed('/otp', arguments: phoneNumber);
    }
  }
}
