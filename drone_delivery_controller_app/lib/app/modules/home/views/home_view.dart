import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.inventory)),
                Tab(icon: Icon(Icons.flight)),
                Tab(icon: Icon(Icons.map_rounded)),
              ],
            ),
            title:  Row(children: [Spacer(),Text("Drone Delivery System"),Spacer()],)
          ),
          body: TabBarView(
            children: [
              Icon(Icons.flight),
             Expanded(
                  child: ListView.builder(
                    controller: controller.controller,
                      itemCount:controller.itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (controller.topContainer > 0.5) {
                          scale = index + 0.5 - controller.topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform:  Matrix4.identity()..scale(scale,scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: controller.itemsData[index]),
                          ),
                        );
                      })),
              
              Icon(Icons.map_rounded),
            ],
          ),
        ),
      ),
    );
  }
}


