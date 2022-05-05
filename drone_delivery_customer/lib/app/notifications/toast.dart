import 'package:fluttertoast/fluttertoast.dart';

import '../theme/app_theme.dart';

void showToast(String text) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      backgroundColor: AppTheme.appColorTheme.primaryColor.withOpacity(0.7),
      fontSize: 18.0);
}
