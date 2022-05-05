import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/config.dart';
import '../../../widgets/input_widgets.dart';
import '../controllers/login_controller.dart';

import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

class LoginView extends GetView<LoginController> {
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
                        "Login",
                        style: GoogleFonts.montserrat(
                            textStyle: AppTheme.appTextTheme.txt18grey),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 12),
                  inputField(
                      controller: controller.phoneNumberController,
                      icon: Icons.phone,
                      title: "Phone Number",
                      isPhoneNumber: true,
                      maxChar: 10),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  SizedBox(height: SizeConfig.blockSizeVertical * 3),
                  longButton(
                      name: "Login",
                      onClick: () => controller.onLoginClicked()),
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
