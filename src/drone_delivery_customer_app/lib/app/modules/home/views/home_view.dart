import 'dart:ui';

import 'package:blur/blur.dart';
import 'package:drone_delivery_customer/app/theme/app_theme.dart';
import 'package:drone_delivery_customer/app/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<HomeController>(
        init: controller,
        builder: (controller) {
          return Scaffold(
            extendBody: true,
            bottomNavigationBar: DotNavigationBar(
              selectedItemColor: AppTheme.appColorTheme.primaryColor,
              unselectedItemColor: Colors.grey,
              boxShadow: [
                BoxShadow(
                    blurRadius: 5,
                    spreadRadius: 3,
                    color:
                        AppTheme.appColorTheme.primaryColor.withOpacity(0.08))
              ],
              currentIndex: controller.pageIndex,
              onTap: (index) {
                controller.dialogControl(false);
                controller.changePage(index);
                controller.pageController.jumpToPage(index);
              },
              dotIndicatorColor:
                  AppTheme.appColorTheme.primaryColor.withOpacity(0.6),
              enableFloatingNavBar: true,
              items: [
                DotNavigationBarItem(icon: Icon(Icons.home)),
                DotNavigationBarItem(icon: Icon(Icons.shopping_cart)),
                DotNavigationBarItem(icon: Icon(Icons.notifications))
              ],
            ),
            body: Stack(children: [
              Container(
                padding: EdgeInsets.only(top: 60, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                      ],
                    ),
                    Container(
                      width: SizeConfig.screenWidth * 0.99,
                      height: SizeConfig.screenHeight * 0.86,
                      child: PageView(
                        onPageChanged: (index) => controller.changePage(index),
                        controller: controller.pageController,
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Today's Deals",
                                        style: GoogleFonts.poppins(
                                            color: AppTheme
                                                .appColorTheme.colorBlack
                                                .withOpacity(0.7),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 40,
                                        height: 5,
                                        color:
                                            AppTheme.appColorTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return restaurantCard();
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Top Deals",
                                        style: GoogleFonts.poppins(
                                            color: AppTheme
                                                .appColorTheme.colorBlack
                                                .withOpacity(0.7),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 40,
                                        height: 5,
                                        color:
                                            AppTheme.appColorTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return restaurantCard();
                                      }),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Great Deals",
                                        style: GoogleFonts.poppins(
                                            color: AppTheme
                                                .appColorTheme.colorBlack
                                                .withOpacity(0.7),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 40,
                                        height: 5,
                                        color:
                                            AppTheme.appColorTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 150,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return restaurantCard();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            height: SizeConfig.screenHeight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(vertical: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "My Orders",
                                        style: GoogleFonts.poppins(
                                            color: AppTheme
                                                .appColorTheme.colorBlack
                                                .withOpacity(0.7),
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        width:
                                            SizeConfig.safeBlockHorizontal * 40,
                                        height: 5,
                                        color:
                                            AppTheme.appColorTheme.primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: SizeConfig.safeBlockVertical * 76,
                                  child: ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: 10,
                                      itemBuilder: (context, index) {
                                        return ordersCard();
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Container()
                        ],
                      ),
                    )
                  ],
                ),
              ),
              controller.isDialogOpen
                  ? Stack(children: [
                      Blur(
                          blur: 2,
                          blurColor: Colors.white,
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                          )),
                      Stack(children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(
                              horizontal: 40, vertical: 200),
                          child: Column(
                            children: [
                              Container(
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  child: InkWell(
                                    onTap: () {},
                                    borderRadius: BorderRadius.circular(20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          child: Image.network(
                                            "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
                                            height: 200,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Container(
                                          padding: EdgeInsets.only(
                                              left: 30, top: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Veg Bazinga",
                                                style: GoogleFonts.poppins(
                                                    color: AppTheme
                                                        .appColorTheme
                                                        .primaryColor,
                                                    fontSize: 28,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                "Delivering to Home Address.",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.poppins(
                                                  color: Color.fromARGB(
                                                      255, 101, 104, 101),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              Text(
                                                "Cash On Delivery",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.poppins(
                                                  fontStyle: FontStyle.italic,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 101, 104, 101),
                                                  fontSize: 16,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Text(
                                                "Drone Id : 214078",
                                                textAlign: TextAlign.start,
                                                style: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(
                                                      255, 101, 104, 101),
                                                  fontSize: 28,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 40,
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 0),
                                          color: Colors.black.withOpacity(0.05),
                                          spreadRadius: 5,
                                          blurRadius: 5)
                                    ]),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                            top: 180,
                            left: 310,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppTheme.appColorTheme.colorWhite),
                              child: Material(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () => controller.dialogControl(false),
                                  child: Container(
                                    margin: EdgeInsets.all(15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.close,
                                          color: Colors.black,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )),
                        Positioned(
                            top: 560,
                            left: 110,
                            child: Container(
                              width: 160,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  color: AppTheme.appColorTheme.primaryColor),
                              child: Material(
                                borderRadius: BorderRadius.circular(40),
                                color: Colors.transparent,
                                child: InkWell(
                                  borderRadius: BorderRadius.circular(40),
                                  onTap: () => Get.toNamed("/track"),
                                  child: Container(
                                    margin: EdgeInsets.all(15),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.location_pin,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "Live Tracking",
                                          textAlign: TextAlign.start,
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ]),
                    ])
                  : Container(),
            ]),
          );
        });
  }
}

class restaurantCard extends StatelessWidget {
  const restaurantCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: Image.network(
                          "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI="),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cafe Mamre",
                            style: GoogleFonts.poppins(
                                color: AppTheme.appColorTheme.primaryColor,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "40% Offer",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              color: Colors.green,
                              fontSize: 10,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            itemSize: 10,
                            initialRating: 2,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            width: 100,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 5,
                      blurRadius: 5)
                ]),
          )
        ],
      ),
    );
  }
}

class ordersCard extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            child: Material(
              borderRadius: BorderRadius.circular(10),
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                onTap: () {
                  controller.dialogControl(true);
                },
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      child: Image.network(
                        "https://media.istockphoto.com/photos/table-top-view-of-spicy-food-picture-id1316145932?b=1&k=20&m=1316145932&s=170667a&w=0&h=feyrNSTglzksHoEDSsnrG47UoY_XX4PtayUPpSMunQI=",
                        width: 100,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.all(28),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cafe Mamre",
                            style: GoogleFonts.poppins(
                                color: AppTheme.appColorTheme.primaryColor,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "₹150/-",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(179, 139, 139, 139),
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "Product On The Way",
                            textAlign: TextAlign.start,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            width: SizeConfig.blockSizeHorizontal * 90,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: Colors.black.withOpacity(0.05),
                      spreadRadius: 5,
                      blurRadius: 5)
                ]),
          )
        ],
      ),
    );
  }
}
