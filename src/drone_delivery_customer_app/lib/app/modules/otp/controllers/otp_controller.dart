import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../../data/drone_user.dart';
import '../../../firebase/firebase_auth.dart';
import '../../../notifications/toast.dart';

class OtpController extends GetxController {
  TextEditingController d1 = TextEditingController();
  TextEditingController d2 = TextEditingController();
  TextEditingController d3 = TextEditingController();
  TextEditingController d4 = TextEditingController();
  TextEditingController d5 = TextEditingController();
  TextEditingController d6 = TextEditingController();

  late String phoneNumber;
  late String verificationId;
  late String otp;

  late DroneUser user;

  @override
  void onInit() {
    phoneNumber = Get.arguments;
    Authentication.loginWithPhone(phoneNumber, onFailed: (String? msg) {
      showToast(msg.toString());
    }, onComplete: (DroneUser user) {
      enterCode("******");
      Timer(Duration(milliseconds: 500), () {
        onVerified(user);
      });
    }, getCode: ((verificationId, smsCode) {
      this.verificationId = verificationId;
    }));
    super.onInit();
  }

  void enterCode(String code) {
    d1.text = code[0];
    d2.text = code[1];
    d3.text = code[2];
    d4.text = code[3];
    d5.text = code[4];
    d6.text = code[5];
  }

  void onVerifyClicked() {
    otp = d1.text + d2.text + d3.text + d4.text + d5.text + d6.text;
    Authentication.verifyOTP(otp, verificationId, onFailed: (String? msg) {
      showToast(msg.toString());
    }, onComplete: onVerified);
  }

  void onVerified(DroneUser user) {
    this.user = user;
    if (this.user.isNewUser)
      Get.offAndToNamed('/signup', arguments: this.user);
    else {
      showToast("Logged In");
      Get.offAndToNamed('/location', arguments: this.user);
    }
  }
}
