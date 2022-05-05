import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppTheme.lightTheme();
  runApp(
    GetMaterialApp(
      theme: ThemeData(),
      title: "Drone Delivery Customer",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
