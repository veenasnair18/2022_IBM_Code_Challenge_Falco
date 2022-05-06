import 'package:drone_delivery/app/modules/home/views/dialogview_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {

  

  @override
  Widget build(BuildContext context) {
    final HomeController homeController =
        Get.put(HomeController(), permanent: false);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        

        body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 8.0,
                            color: Color.fromARGB(255, 157, 97, 199)),
                      ),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Pending Orders",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
                  orderCardWidget(
                      "res1.jpg", "Kerala Cafe", "Kochi", "2.5", "Ramesh",5),
                  orderCardWidget(
                      "res2.jpg", "Mahe Cafe", "Kottayam", "1.75", "Sumesh",8),
                       Container(
                    margin:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                            width: 8.0,
                            color: Color.fromARGB(255, 157, 97, 199)),
                      ),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Current Orders",
                      style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),
                    ),
                  ),
                  orderCardWidgetH(
                      "res3.jpg", "Madras Cafe", "Munnar", "1.55", "Shivani"),
                  orderCardWidgetH(
                      "res4.jpg", "Cafe Mamre", "Pala", "1.35", "Ram"),
                  orderCardWidgetH(
                      "res1.jpg", "Foodnotes", "Velloor", "1.85", "Isa")
                ],
              ),
            ),
        //         bottomNavigationBar: BottomNavigationBar(
        //   items: const <BottomNavigationBarItem>[
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.call),
        //       label: 'Calls',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.camera),
        //       label: 'Camera',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.chat),
        //       label: 'Chats',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}

class orderCardWidget extends StatelessWidget {
  orderCardWidget(@required this.image, @required this.resName,
      @required this.place, @required this.weight, @required this.customerName,@required this.distance);
  final String image;
  final String resName;
  final String place;
  final String weight;
  final String customerName;
  final int distance;

  void openDialog() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(15),
        insetPadding: EdgeInsets.symmetric(vertical: 170, horizontal: 40),
        title: const Text(
          'Order Confirmation',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        content: Column(
          children: [
            Container(
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/${image}"))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "John Abraham",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("15:20 PM")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Kakkanad",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("11-09-20")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Chicken Biriyani",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x1")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Mexican Pizza",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x2")
              ],
            ),
          ],
        ),
        actions: [

          
          TextButton(
              child: const Text("Select Drone"),
              onPressed: () => Get.to(DialogviewView())),
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  void openDialogH() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(15),
        insetPadding: EdgeInsets.symmetric(vertical: 170, horizontal: 40),
        title: const Text(
          'Order Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        content: Column(
          children: [
            Container(
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/${image}"))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "John Abraham",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("15:20 PM")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Kakkanad",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("11-09-20")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Chicken Biriyani",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x1")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Mexican Pizza",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x2")
              ],
            ),
          ],
        ),
        actions: [
         
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: Get.width * 0.98,
      height: Get.height * 0.21,
      padding: new EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 12, top: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/${image}",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      resName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500,color: Color.fromARGB(255, 157, 97, 199)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Customer: ${customerName}",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${place} (${distance} Kms)",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "${weight} Kg (Drones Available)",
                      style: TextStyle(fontSize: 14,color: Colors.green),
                    ),
                    Row(
                      children: [
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue.withOpacity(0.04);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return Colors.blue.withOpacity(0.12);
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: openDialog,
                            child: Text(
                              'view order',
                              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 157, 97, 199)),
                            )),
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue.withOpacity(0.04);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return Colors.blue.withOpacity(0.12);
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: () {},
                            child: Text(
                              'cancel',
                              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 157, 97, 199)),
                            )),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}


class orderCardWidgetH extends StatelessWidget {
  orderCardWidgetH(@required this.image, @required this.resName,
      @required this.place, @required this.weight, @required this.customerName);
  final String image;
  final String resName;
  final String place;
  final String weight;
  final String customerName;

  void openDialog() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(15),
        insetPadding: EdgeInsets.symmetric(vertical: 170, horizontal: 40),
        title: const Text(
          'Order Confirmation',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        content: Column(
          children: [
            Container(
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/${image}"))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "John Abraham",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("15:20 PM")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Kakkanad",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("11-09-20")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Chicken Biriyani",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x1")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Mexican Pizza",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x2")
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
              child: const Text("Select Drone"),
              onPressed: () => Get.to(DialogviewView())),
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  void openDialogH() {
    Get.dialog(
      AlertDialog(
        contentPadding: EdgeInsets.all(15),
        insetPadding: EdgeInsets.symmetric(vertical: 170, horizontal: 40),
        title: const Text(
          'Order Details',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
        content: Column(
          children: [
            Container(
              child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("assets/${image}"))),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "John Abraham",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("15:20 PM")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Kakkanad",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("11-09-20")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Chicken Biriyani",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x1")
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "Mexican Pizza",
                  style: TextStyle(),
                ),
                Spacer(),
                Text("x2")
              ],
            ),
          ],
        ),
        actions: [
         
          TextButton(
            child: const Text("Close"),
            onPressed: () => Get.back(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: Get.width * 0.98,
      height: Get.height * 0.20,
      padding: new EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Color.fromARGB(255, 255, 255, 255),
        elevation: 10,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 12, top: 8),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      "assets/${image}",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      resName,
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Customer: ${customerName}",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      place,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${weight} KG",
                      style: TextStyle(fontSize: 14),
                    ),
                    Row(
                      children: [
                        TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              overlayColor:
                                  MaterialStateProperty.resolveWith<Color?>(
                                (Set<MaterialState> states) {
                                  if (states.contains(MaterialState.hovered))
                                    return Colors.blue.withOpacity(0.04);
                                  if (states.contains(MaterialState.focused) ||
                                      states.contains(MaterialState.pressed))
                                    return Colors.blue.withOpacity(0.12);
                                  return null; // Defer to the widget's default.
                                },
                              ),
                            ),
                            onPressed: openDialogH,
                            child: Text(
                              'view order',
                              style: TextStyle(fontSize: 16,color: Color.fromARGB(255, 157, 97, 199)),
                            )),
                       
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    ));
  }
}

