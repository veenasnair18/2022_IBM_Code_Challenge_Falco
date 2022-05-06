import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/trackpage.controller.dart';

class TrackpageScreen extends GetView<TrackpageController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TrackpageScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TrackpageScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
