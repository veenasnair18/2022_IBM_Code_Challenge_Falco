import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/drone_user.dart';
import '../../../firebase/firebase_auth.dart';
import '../../../notifications/toast.dart';

class SignupController extends GetxController {
  late DroneUser user;

  TextEditingController name = TextEditingController();
  TextEditingController age = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void onInit() {
    user = Get.arguments;
    super.onInit();
  }

  void onRegister() async {
    String name = this.name.text;
    String email = this.email.text;
    String age = this.age.text;
    if (email.isEmail && age.isNumericOnly && name.isNotEmpty) {
      user.name = name;
      user.age = int.parse(age);
      user.email = email;
      if (await Authentication.updateUserDetails(user)) {
        showToast("Logged In");
        Get.offAndToNamed('/home', arguments: user);
      }
    } else
      showToast("Invalid Details");
  }
}
