import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/services/nursery_service.dart';

import 'nursery_stock.dart';

final ap = Get.put(ApiService());
final nurseryservice= Get.put(NurseryService());

class NurseryDisplay extends StatefulWidget {

  List? user;



  NurseryDisplay({required this.user});

  @override
  _NurseryDisplayState createState() => _NurseryDisplayState(user);
}

class _NurseryDisplayState extends State<NurseryDisplay> {

  List? user;
  int? userid ;
  int? nid=0;

  _NurseryDisplayState(user)
  {
    this.user=user;
    this.userid= user[0]['id'];

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.lightGreen,
        appBar: AppBar(backgroundColor: Colors.green,
          title: Text("Nursery"),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Get.back();
            },
          ),
        ),
        body: FutureBuilder(
            future: nurseryservice.AllNurseries(userid!),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return GridView.count(

            crossAxisSpacing:10,
                  mainAxisSpacing:20,
                  crossAxisCount:3,
                  children: List.generate(snapshot.data.length, (index) {

                    return
                        InkWell(

                          onTap: (){
                                         nid=snapshot.data[index]['nid'];
print(userid);
                            Get.to(NurseryStock(nid: nid,userid: userid,));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),

                            ),
                            width: 100,
                            height: 10,
                            child: Column(
                              children: [


                              Icon(Icons.yard,
                              size: 40,color: Colors.green,),

                              Text("${snapshot.data[index]['nname']}",style:

                                TextStyle(fontSize: 15 ,),),
                              SizedBox(height: 5,),


                                Icon(Icons.location_on,
                                size: 20,color: Colors.redAccent,),

                                  Expanded(child: Text("${snapshot.data[index]['naddress']}",textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 12),)),

Row( mainAxisAlignment: MainAxisAlignment.center,
  children: [ Icon(Icons.call,
  size: 20,color: Colors.black,),
SizedBox(width: 10,),
  Text("${snapshot.data[index]['ncontact']}", textAlign: TextAlign.center,style: TextStyle(fontSize: 14,),),
],)




                            ],),
                          ),
                        );

                  }),
                );
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
