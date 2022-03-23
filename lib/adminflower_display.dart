import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:plantscolorguide/services/api_service.dart';

class AdminFlowerDisplay extends StatelessWidget {

 late List flowers;
 late int index;
 final apiService = Get.find<ApiService>();




   AdminFlowerDisplay( { required this.flowers ,required this.index});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        backgroundColor: Colors.green,

      ),
      body: SingleChildScrollView(


      child:  Column(children: [  SizedBox(height: 20,),
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://${apiService
                          .ip}/flowers/Uploads/${flowers[index]['image']
                          .toString()}")
                  , radius: 80,),

                SizedBox(height: 20,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Text( "Name" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,
                    //
                    // ), )  ,
                    // SizedBox(width: 10,),
                    Text( "${flowers[index]['name']}" ,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold), ),
                  ],),
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Colors" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,     SizedBox(width: 10,),
                    Text( "${flowers[index]['color']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],)
                ,
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Month" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['month']}"+"\n"
                        +" ${   flowers[index]['startmonth']  } "
                        +"\t\t"  +"to"+"\t\t"
                        +"${   flowers[index]['endmonth']  }"   ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Season" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,     SizedBox(width: 10,),
                    Text( "${flowers[index]['season']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],)
                ,
                Divider(height: 20,color: Colors.green,),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Growth" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['growtime']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Height" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['minheight']}"+   "\t\t to \t\t"      +"${flowers[index]['maxheight']}           " ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),


                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "flowers" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['category']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),





                Divider(height: 20,color: Colors.green,), Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Shape" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['shape']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),





                Divider(height: 20,color: Colors.green,), Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Fragrance" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['fragrance']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),





                Divider(height: 20,color: Colors.green,),


                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "LifeTime" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['lifetime']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),

                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Altitude" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${  flowers[index]['minaltitude'].toString()}"+" \t to \t"  + "${     flowers[index]['maxaltitude'].toString()}"+ "\t metre" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Area" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "${flowers[index]['area']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),
                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Watering" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "  ${flowers[index]['watering']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),

                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Sunlight" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,
                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "  ${flowers[index]['sunlight']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),
                Divider(height: 20,color: Colors.green,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Diseases" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "  ${flowers[index]['disease']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],), Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "Pesticides" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Expanded(child: Text( "  ${flowers[index]['pesticide']}" ,style: TextStyle(color: Colors.black,fontSize: 16), )),
                  ],),
                Divider(height: 20,color: Colors.green,),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text( "SoilType" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

                    ), )  ,
                    SizedBox(width: 10,),
                    Text( "  ${flowers[index]['soiltype']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
                  ],),

                Divider(height: 20,color: Colors.green,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [

                    Expanded(
                      child: Text( "Fertilizer" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,
                      ), ),
                    )  ,

                    Expanded(
                      child: SingleChildScrollView(

                        scrollDirection: Axis.vertical,
                        child: Text(

                          "  ${flowers[index]['fertilizer']}" ,


                          style: TextStyle(color: Colors.black,fontSize: 16), ),
                      ),
                    ),
                  ],),



              ],)







    ),



    ));
  }
}
