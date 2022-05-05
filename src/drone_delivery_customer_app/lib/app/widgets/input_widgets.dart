import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../theme/app_theme.dart';
import '../utils/config.dart';

Widget inputField(
    {required String title,
    required IconData icon,
    TextEditingController? controller,
    bool? isPhoneNumber,
    bool? isPassword,
    int? maxChar}) {
  return Container(
    child: TextField(
      controller: controller,
      maxLength: maxChar ?? 20,
      obscureText: isPassword ?? false,
      keyboardType: isPhoneNumber ?? false
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      style: GoogleFonts.poppins(
          fontSize: 20,
          color: Color.fromARGB(255, 255, 255, 255),
          letterSpacing: 0.24,
          fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 3),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        counterText: "",
        hintText: title,
        hintStyle: TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        fillColor: AppTheme.appColorTheme.primaryColor,
        filled: true,
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: AppTheme.appColorTheme.colorWhite.withOpacity(0.7),
          ),
        ),
      ),
    ),
  );
}

Widget longButton({required String name, required Function onClick}) {
  // ignore: deprecated_member_use
  return FlatButton(
    onPressed: () => onClick(),
    padding: EdgeInsets.symmetric(
        vertical: 20, horizontal: SizeConfig.safeBlockHorizontal * 15),
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
    child: Text(
      name,
      style: GoogleFonts.montserrat(
          fontSize: 20,
          color: AppTheme.appColorTheme.primaryColor,
          letterSpacing: 0.168,
          fontWeight: FontWeight.w500),
    ),
    color: AppTheme.appColorTheme.colorWhite,
  );
}

Widget dialogBox(
    {required String title,
    required Widget description,
    required String negetive,
    required String positive,
    required Function onNegetive,
    required Function onPositive}) {
  return Container(
    alignment: Alignment.center,
    margin: EdgeInsets.symmetric(
        vertical: SizeConfig.blockSizeVertical * 30,
        horizontal: SizeConfig.safeBlockHorizontal * 10),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: AppTheme.appColorTheme.colorBlack.withOpacity(0.06),
              offset: Offset(0, 0),
              blurRadius: 10)
        ]),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              textStyle: AppTheme.appTextTheme.txt40primary),
        ),
        SizedBox(
          height: 20,
        ),
        description,
        SizedBox(
          height: 40,
        ),
        smallButton(
            name: positive,
            onClick: onPositive,
            color: AppTheme.appColorTheme.primaryColor),
        SizedBox(
          height: 10,
        ),
        smallButton(
            name: negetive,
            onClick: onNegetive,
            color: AppTheme.appColorTheme.colorGrey),
      ],
    ),
  );
}

Widget smallButton(
    {required String name, required Function onClick, required Color color}) {
  // ignore: deprecated_member_use
  return FlatButton(
    onPressed: () => onClick(),
    padding: EdgeInsets.symmetric(
        vertical: 15, horizontal: SizeConfig.safeBlockHorizontal * 12),
    shape: new RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(20.0),
    ),
    child: Text(
      name,
      style: GoogleFonts.montserrat(
          fontSize: 20,
          color: AppTheme.appColorTheme.colorWhite,
          letterSpacing: 0.168,
          fontWeight: FontWeight.w500),
    ),
    color: color,
  );
}

Widget retryAction(
    {required String description,
    required String action,
    required Function onTap}) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          description,
          style: GoogleFonts.montserrat(
              fontSize: 20,
              color: AppTheme.appColorTheme.primaryColor.withOpacity(0.4)),
        ),
        Material(
          child: InkWell(
            child: Text(
              "  " + action,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.appColorTheme.primaryColor),
            ),
            onTap: () => onTap(),
          ),
        )
      ],
    ),
  );
}
