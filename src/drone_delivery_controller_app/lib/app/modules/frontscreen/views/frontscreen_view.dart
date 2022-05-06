import 'package:drone_delivery/app/modules/drone_list/views/drone_list_view.dart';
import 'package:drone_delivery/app/modules/home/views/dialogview_view.dart';
import 'package:drone_delivery/app/modules/home/views/home_view.dart';
import 'package:drone_delivery/app/modules/order_assign/views/order_assign_view.dart';
import 'package:drone_delivery/app/modules/settings/views/settings_view.dart';
import 'package:drone_delivery/presentation/trackpage/trackpage.screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/frontscreen_controller.dart';

class FrontscreenView extends GetView<FrontscreenController> {
  final TextStyle unselectedLabelStyle = TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontWeight: FontWeight.w500,
      fontSize: 12);

  final TextStyle selectedLabelStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12);

  buildBottomNavigationMenu(context, frontscreenController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: SizedBox(
          height: 56,
          
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: BottomNavigationBar(
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: frontscreenController.changeTabIndex,
              currentIndex: frontscreenController.tabIndex.value,
              backgroundColor: Color.fromARGB(255, 157, 97, 199),
              unselectedItemColor: Colors.white.withOpacity(0.5),
              selectedItemColor: Colors.white,
              unselectedLabelStyle: unselectedLabelStyle,
              selectedLabelStyle: selectedLabelStyle,
              items: [
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.inventory,
                      size: 20.0,
                    ),
                  ),
                  label: 'Orders',
                  backgroundColor: Color.fromARGB(255, 139, 58, 198),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.flight,
                      size: 20.0,
                    ),
                  ),
                  label: 'Drones',
                  backgroundColor: Color.fromARGB(255, 139, 58, 198),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.map,
                      size: 20.0,
                    ),
                  ),
                  label: 'Track',
                  backgroundColor:Color.fromARGB(255, 139, 58, 198),
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Icon(
                      Icons.settings,
                      size: 20.0,
                    ),
                  ),
                  label: 'Settings',
                 backgroundColor: Color.fromARGB(255, 139, 58, 198),
                ),
              ],
            ),
          ),
        )));
  }

  @override
  Widget build(BuildContext context) {
    final FrontscreenController frontscreenController =
        Get.put(FrontscreenController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0x000000),
        elevation: 0,
        leading: Icon(Icons.menu,color: Color.fromARGB(255, 157, 97, 199),size: 35,),
        
        centerTitle: true,
        title: Text(
          "App",
          style: TextStyle( color: Color.fromARGB(255, 157, 97, 199,),fontSize: 25),
        ),
      ),
      bottomNavigationBar:
          buildBottomNavigationMenu(context, frontscreenController),
      body: Obx(() => IndexedStack(
            index: frontscreenController.tabIndex.value,
            children: [
              HomeView(),
              DroneListView(),
              TrackpageScreen(),
              SettingsView(),
            ],
          )),
    );
  }
}
