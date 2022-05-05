import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController



  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;

  List<Widget> itemsData = [];

    static const FOOD_DATA = [
  {
    "name":"Feiyu",
    "brand":"Delhi",
    "price":2.99,
    "image":"1.jpg"
  },{
    "name":"HX 750",
    "brand":"Delhi",
    "price":4.99,
    "image":"2.jpg"
  },
  {
    "name":"aerial",
    "brand":"Delhi",
    "price":1.49,
    "image":"3.jpeg"
  },
  {
    "name":"F949",
    "brand":"Delhi",
    "price":2.99,
    "image":"4.jpeg"
  },
  {
    "name":"Uxavi",
    "brand":"Delhi",
    "price":9.49,
    "image":"2.jpg"
  },
  {
    "name":"ZLRC",
    "brand":"Delhi",
    "price":4.49,
    "image":"5.jpg"
  },
  {
    "name":"MX64",
    "brand":"Delhi",
    "price":17.99,
    "image":"4.jpeg"
  },
  {
    "name":"ZEROZE",
    "brand":"Delhi",
    "price":2.99,
    "image":"2.jpg"
  },
  {
    "name":"Cheers",
    "brand":"Delhi",
    "price":6.99,
    "image":"2.jpg"
  }
];

  void getPostsData() {
    List<dynamic> responseList = FOOD_DATA;
    List<Widget> listItems = [];
    responseList.forEach((post) {
      listItems.add(Container(
          height: 150,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20.0)), color: Colors.white, boxShadow: [
            BoxShadow(color: Colors.black.withAlpha(100), blurRadius: 10.0),
          ]),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      post["name"],
                      style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      post["brand"],
                      style: const TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "\ ${post["price"]}KM",
                      style: const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Image.asset(              
                  "assets/${post["image"]}",
                  height: 125,
                  width: 125,
                
                  fit: BoxFit.fill,
                )
              ],
            ),
          )));
    });



   itemsData = listItems;
   update();
  }

 



  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getPostsData();

    controller.addListener(() {

      double value = controller.offset/119;

     
      topContainer = value;
        closeTopContainer = controller.offset > 50;
        update();
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  
}
