
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/services/api_service.dart';

import 'config/app_theme_config.dart';

class flower_full_details extends StatelessWidget {
  final List data;

  final index;

  flower_full_details({required this.data,required this.index});
  final apiService= Get.find<ApiService>();


  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Flowers Plantation & Color Guide',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemeConfig.green,
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: SingleChildScrollView(


        child: Column(children: [  SizedBox(height: 20,),
          CircleAvatar(
            backgroundImage: NetworkImage(
                "http://${apiService
                    .ip}/flowers/Uploads/${data[index]['image']
                    .toString()}")
            , radius: 80,),

          SizedBox(height: 20,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [

            Text( "${data[index]['name']}" ,style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold), ),
          ],),
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Colors" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,     SizedBox(width: 10,),
              Text( "${data[index]['color']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],)
,
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Month" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['month']}"+"\n"
                  +" ${   data[index]['startmonth']  } "
                  +"\t\t"  +"to"+"\t\t"
                  +"${   data[index]['endmonth']  }"   ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Season" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,     SizedBox(width: 10,),
              Text( "${data[index]['season']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],)
          ,
          Divider(height: 20,color: Colors.green,),


          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Growth" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['growtime']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Height" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['minheight']}"+   "\t\t to \t\t"      +"${data[index]['maxheight']}           " ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),


          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Category" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['category']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),





          Divider(height: 20,color: Colors.green,), Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Shape" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['shape']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),





          Divider(height: 20,color: Colors.green,), Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Fragrance" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['fragrance']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),





          Divider(height: 20,color: Colors.green,),


          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "LifeTime" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['lifetime']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),

          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Altitude" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${  data[index]['minaltitude'].toString()}"+" \t to \t"  + "${     data[index]['maxaltitude'].toString()}"+ "\t metre" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Area" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "${data[index]['area']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),
          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Watering" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "  ${data[index]['watering']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),

          Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Sunlight" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,
              ), )  ,
              SizedBox(width: 10,),
              Text( "  ${data[index]['sunlight']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),
          Divider(height: 20,color: Colors.green,),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Diseases" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "  ${data[index]['disease']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],), Divider(height: 20,color: Colors.green,),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "Pesticides" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Expanded(child: Text( "  ${data[index]['pesticide']}" ,style: TextStyle(color: Colors.black,fontSize: 16), )),
            ],),
          Divider(height: 20,color: Colors.green,),

          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text( "SoilType" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "  ${data[index]['soiltype']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),

       Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Divider(height: 20,color: Colors.green,),
              Text( "Fertilzer" ,style: TextStyle(color: Colors.green,fontSize: 16,fontWeight: FontWeight.bold,

              ), )  ,
              SizedBox(width: 10,),
              Text( "  ${data[index]['fertilizer']}" ,style: TextStyle(color: Colors.black,fontSize: 16), ),
            ],),

          Divider(height: 20,color: Colors.green,),




        ],),


        ),
      ),
    );
  }
}
