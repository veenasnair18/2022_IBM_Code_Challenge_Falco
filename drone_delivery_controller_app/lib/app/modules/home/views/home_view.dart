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
                Tab(icon: Icon(Icons.inventory),text: "Orders",),
                Tab(icon: Icon(Icons.flight),text: "drones",),
                Tab(icon: Icon(Icons.map_rounded),text: "track",),
              ],
            ),
            title:  Row(children: [Spacer(),Text("Drone Delivery System"),Spacer()],)
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    MyCardWidget("res1.jpg", "Kerala Cafe","Kochi","1.25","Ramesh"),
                    MyCardWidget("res1.jpg", "Kerala Cafe","Kochi","1.25","Ramesh"),
                    MyCardWidget("res1.jpg", "Kerala Cafe","Kochi","1.25","Ramesh"),
                    MyCardWidget("res1.jpg", "Kerala Cafe","Kochi","1.25","Ramesh"),
                    MyCardWidget("res1.jpg", "Kerala Cafe","Kochi","1.25","Ramesh")
                   
                  ],
                ),
              ),
             ListView.builder(
               controller: controller.controller,
                 itemCount:controller.itemsData.length,
                 physics: BouncingScrollPhysics(),
                 itemBuilder: (context, index) {
                   double scale = 1.0;
                  
                   return Opacity(
                     opacity: scale,
                     child: Transform(
                       transform:  Matrix4.identity()..scale(scale,scale),
                       alignment: Alignment.bottomCenter,
                       child: Align(
                           heightFactor: 0.7,
                           alignment: Alignment.topCenter,
                           child: InkWell(
                             
                             onTap: (){
                               print("tap");
                               
                             },
                             
                             child: controller.itemsData[index]),),
                     ),
                   );
                 }),
              
              Icon(Icons.map_rounded),
            ],
          ),
        ),
      ),
    );
  }
}

class MyCardWidget extends StatelessWidget {  
  MyCardWidget(@required  this.image, @required this.resName, @required this.place,@required this.weight,@required this.customerName); 
  final String  image;
  final String resName;
  final String place;
  final String weight;
  final String customerName;

  void openDialog() {
  Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.all(15),
      insetPadding: EdgeInsets.symmetric(vertical:130,horizontal:20),
      title: const Text('Order Confirmation',textAlign:TextAlign.center, style: TextStyle(fontSize: 18),),
      content: Column(
        children: [
          Container(child:
           Container(
            
             child: Image.asset("assets/${image}")),),
          SizedBox(height: 5,),
          Row(children: [
            Text("John Abraham",style: TextStyle(),),
            Spacer(),
            Text("15:20 PM")
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Text("Kakkanad",style: TextStyle(),),
            Spacer(),
            Text("11-09-20")
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Text("Chicken Biriyani",style: TextStyle(),),
            Spacer(),
            Text("x1")
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Text("Mexican Pizza",style: TextStyle(),),
            Spacer(),
            Text("x2")
          ],),   
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Select Drone"),
          onPressed: () => Get.back(),
        ),
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
        width: Get.width* 0.98,  
        height: Get.height* 0.20,  
        padding: new EdgeInsets.symmetric(horizontal: 10,vertical: 2),  
        child: Card(  
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(15.0),  
          ),  
          color: Color.fromARGB(255, 255, 255, 255),  
          elevation: 10,  
          child: Column(  
            mainAxisSize: MainAxisSize.min,  
            children: <Widget>[  
              Padding(
                padding: const EdgeInsets.only(left: 5,right: 12,top: 8),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Image.asset("assets/${image}",
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                      ),
                    ),
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(resName,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                          SizedBox(height: 2,),
                         
                          Text("customer: ${customerName}",style: TextStyle(fontSize: 14),),
                          SizedBox(height: 2,),
                          Text(place,style: TextStyle(fontSize: 14),),
                          
                          SizedBox(height: 2,),
                          Text("${weight} KG",style: TextStyle(fontSize: 14),),
                          Row(
                          children: [
                            TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
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
  onPressed:openDialog,

  child: Text('view order',style:TextStyle(fontSize: 16),)
),
   TextButton(
  style: ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
    overlayColor: MaterialStateProperty.resolveWith<Color?>(
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
  onPressed: () { },
  child: Text('cancel',style:TextStyle(fontSize: 16),)
),
                          ],
                        ),
                        ],
                    )
                  ],
                ),
              )
            ]
          ),  
        ),  
      )  
    );  
  }  
} 