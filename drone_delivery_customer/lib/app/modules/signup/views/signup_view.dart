import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/config.dart';
import '../../../widgets/input_widgets.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AppTheme.appColorTheme.colorBackground,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 90, horizontal: 30),
              color: AppTheme.appColorTheme.colorBackground,
              width: double.infinity,
              child: Column(
                children: [
                  Image.asset(
                    "lib/assets/images/png/logo.png",
                    width: 100,
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Drone Customer",
                        style: GoogleFonts.poppins(
                            textStyle: AppTheme.appTextTheme.txt40blue),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        "Register",
                        style: GoogleFonts.montserrat(
                            textStyle: AppTheme.appTextTheme.txt18grey),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  inputField(
                      icon: Icons.person,
                      title: "Name",
                      controller: controller.name),
                  SizedBox(height: SizeConfig.blockSizeVertical * 1),
                  inputField(
                      icon: Icons.numbers,
                      title: "Age",
                      isPhoneNumber: true,
                      controller: controller.age),
                  SizedBox(height: SizeConfig.blockSizeVertical * 1),
                  inputField(
                      icon: Icons.email,
                      title: "Email Address",
                      controller: controller.email),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  longButton(
                      name: "Register", onClick: () => controller.onRegister()),
                  SizedBox(height: SizeConfig.blockSizeVertical * 8),
                  SizedBox(height: SizeConfig.blockSizeVertical * 12),
                  Text(
                    "2022_IBM_Code_Challenge_Drone_Delivery",
                    style: GoogleFonts.montserrat(
                        textStyle: AppTheme.appTextTheme.txt12grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
