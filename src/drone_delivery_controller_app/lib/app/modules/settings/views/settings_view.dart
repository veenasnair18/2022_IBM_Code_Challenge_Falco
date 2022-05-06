import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:settings_ui/settings_ui.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Center(
        child: SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {
                Get.changeTheme(
  Get.isDarkMode ? ThemeData.light() : ThemeData.dark(),
);
              },
              
              initialValue: false,
              leading: Icon(Icons.format_paint),
              title: Text('Swith Theme'),
            ),
          ],
        ),
      ],
    ),
      ),
    );
  }
}
