import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../theme/app_theme.dart';
import '../../../utils/config.dart';
import '../controllers/track_controller.dart';

class TrackView extends GetView<TrackController> {
  late GoogleMapController mapController;
  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        body: Container(
            padding: EdgeInsets.only(top: 60, left: 15, right: 15),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Icon(
                  Icons.menu,
                  color: AppTheme.appColorTheme.primaryColor,
                ),
                Text(
                  "Falco",
                  style: GoogleFonts.poppins(
                      color: AppTheme.appColorTheme.primaryColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.search,
                  color: AppTheme.appColorTheme.primaryColor,
                ),
              ]),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Track My Order",
                      style: GoogleFonts.poppins(
                          color: AppTheme.appColorTheme.colorBlack
                              .withOpacity(0.7),
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: SizeConfig.safeBlockHorizontal * 40,
                      height: 5,
                      color: AppTheme.appColorTheme.primaryColor,
                    ),
                  ],
                ),
              ),
              Container(
                  width: SizeConfig.blockSizeHorizontal * 100,
                  height: SizeConfig.blockSizeVertical * 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                          color: AppTheme.appColorTheme.primaryColor,
                          width: 3)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: GoogleMap(
                      onMapCreated: onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: controller.center,
                        zoom: 11.0,
                      ),
                    ),
                  ))
            ])));
  }
}
