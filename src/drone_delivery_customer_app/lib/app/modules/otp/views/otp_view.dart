import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/config.dart';
import '../../../widgets/input_widgets.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
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
                        "Verify OTP",
                        style: GoogleFonts.montserrat(
                            textStyle: AppTheme.appTextTheme.txt18grey),
                      )
                    ],
                  ),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  OtpInput(),
                  SizedBox(height: SizeConfig.blockSizeVertical * 10),
                  longButton(
                      name: "Verify",
                      onClick: () => controller.onVerifyClicked()),
                  SizedBox(height: SizeConfig.blockSizeVertical * 8),
                  resentCode(),
                  SizedBox(height: SizeConfig.blockSizeVertical * 12),
                  Text(
                    "by Rit CSE Group 11",
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

class OtpInput extends GetView<OtpController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          OtpSingleInput(context, controller: controller.d1),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1,
          ),
          OtpSingleInput(context, controller: controller.d2),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1,
          ),
          OtpSingleInput(context, controller: controller.d3),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1,
          ),
          OtpSingleInput(context, controller: controller.d4),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1,
          ),
          OtpSingleInput(context, controller: controller.d5),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 1,
          ),
          OtpSingleInput(context, controller: controller.d6),
        ],
      ),
    );
  }
}

Widget OtpSingleInput(context, {required TextEditingController controller}) {
  return Container(
    width: SizeConfig.safeBlockHorizontal * 12,
    height: SizeConfig.safeBlockVertical * 8,
    alignment: Alignment.center,
    padding: EdgeInsets.only(left: 15, bottom: 10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.appColorTheme.colorGrey.withOpacity(0.4)),
    child: TextField(
      autofocus: true,
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 1,
      style: AppTheme.appTextTheme.txt40blue.copyWith(fontSize: 36),
      decoration: InputDecoration(border: InputBorder.none, counterText: ""),
      onChanged: (value) {
        FocusScope.of(context).nextFocus();
      },
    ),
  );
}

Widget resentCode() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text("I didn\'t receive the code ",
          style: GoogleFonts.montserrat(
              textStyle:
                  AppTheme.appTextTheme.txt12grey.copyWith(fontSize: 16))),
      InkWell(
        child: Text(
          "Resend",
          style: GoogleFonts.montserrat(
            color: AppTheme.appColorTheme.primaryColor,
            textStyle: AppTheme.appTextTheme.txt12grey.copyWith(fontSize: 17),
          ),
        ),
        onTap: () {},
      )
    ],
  );
}
