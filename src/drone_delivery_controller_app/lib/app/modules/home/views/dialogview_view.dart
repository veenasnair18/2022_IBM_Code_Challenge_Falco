import 'package:drone_delivery/app/modules/order_assign/views/order_assign_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DialogviewView extends GetView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                  
                SizedBox(height: 15,),
                 droneCardWidget("1.jpg", "Feiyu","Kochi","1.25",),
                        droneCardWidget("2.jpg", "HX 750","Kottayam","1.75",),
                         droneCardWidget("3.jpeg", "aerial","Kochi","1.35",),
                        droneCardWidget("4.jpeg", "F949","Vyttila","1.75",),
                        droneCardWidget("5.jpg", "Uxavi","Pala","1.75",),
                         droneCardWidget("1.jpg", "MX64","Adavi","1.75",),
                           droneCardWidget("2.jpg", "IMX66","Velloor","1.75",),
                           droneCardWidget("1.jpg", "Feiyu","Kochi","1.25",),
                        droneCardWidget("2.jpg", "HX 750","Kottayam","1.75",),
                         droneCardWidget("3.jpeg", "aerial","Kochi","1.35",),
                        droneCardWidget("4.jpeg", "F949","Vyttila","1.75",),
                        droneCardWidget("5.jpg", "Uxavi","Pala","1.75",),
                         droneCardWidget("1.jpg", "MX64","Adavi","1.75",),
                           droneCardWidget("2.jpg", "IMX66","Velloor","1.75",),
                           droneCardWidget("1.jpg", "Feiyu","Kochi","1.25",),
                        droneCardWidget("2.jpg", "HX 750","Kottayam","1.75",),
                         droneCardWidget("3.jpeg", "aerial","Kochi","1.35",),
                        droneCardWidget("4.jpeg", "F949","Vyttila","1.75",),
                        droneCardWidget("5.jpg", "Uxavi","Pala","1.75",),
                         droneCardWidget("1.jpg", "MX64","Adavi","1.75",),
                           droneCardWidget("2.jpg", "IMX66","Velloor","1.75",),
              ],
            ),
          ),
         
        ),
      ),
    );
  }
}


class droneCardWidget extends StatelessWidget {  
  droneCardWidget(@required  this.image, @required this.droneName, @required this.place,@required this.capacity); 
  final String  image;
  final String droneName;
  final String place;
  final String capacity;
 

  void openDialog() {
  Get.dialog(
    AlertDialog(
      contentPadding: EdgeInsets.all(15),
      insetPadding: EdgeInsets.symmetric(vertical:170,horizontal:40),
      title: const Text('Order Confirmation',textAlign:TextAlign.center, style: TextStyle(fontSize: 18),),
      content: Column(
        children: [
          Container(child:
           Container(
            
             child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
               child: Image.asset("assets/${image}",fit: BoxFit.cover,))),),
          SizedBox(height: 20,),
          Row(children: [
            Text("Maximum Capacity",style: TextStyle(),),
            Spacer(),
            Text("2.5 KG")
          ],),
          SizedBox(height: 5,),
          Row(children: [
            Text("Order Weight",style: TextStyle(),),
            Spacer(),
            Text("${capacity}")
          ],),
          SizedBox(height: 5,),
           Row(children: [
            Text("Dstance to travel",style: TextStyle(),),
            Spacer(),
            Text(("17 KM"))
          ],),
          SizedBox(height: 5,),
        
         
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Assign Order"),
          onPressed: (){
            
            Get.to(OrderAssignView());}
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
      child: InkWell(
        onTap:openDialog,
        child: Container(  
          width: Get.width* 0.9,  
          height: Get.height* 0.17,  
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
                  padding: const EdgeInsets.only(left: 5,right: 12,top: 10),
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
                      SizedBox(width: 10,),
                      
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(droneName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                           
                            SizedBox(height: 6,),
                            Text(place,style: TextStyle(fontSize: 14),),
                            
                            SizedBox(height: 6,),
                            Text("Capacity :${capacity} KG",style: TextStyle(fontSize: 14),),
                           
                          ],
                      )
                    ],
                  ),
                )
              ]
            ),  
          ),  
        ),
      )  
    );  
  }  
} 
