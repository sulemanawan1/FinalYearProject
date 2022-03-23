import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/flower_full_details.dart';

import 'acceptreject_notification.dart';


class FriendPlanFlowerDisplay extends StatefulWidget {
int pid=0;
  FriendPlanFlowerDisplay({required this.pid});
  @override
  _FriendPlanFlowerDisplayState createState() => _FriendPlanFlowerDisplayState(pid);
}

class _FriendPlanFlowerDisplayState extends State<FriendPlanFlowerDisplay> {
  int pid=0;
  _FriendPlanFlowerDisplayState(pid)
  {
    this.pid=pid;
    print(pid);
  }




  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: Scaffold(appBar: AppBar(backgroundColor: Colors.green,    leading: GestureDetector(
        child: Icon(Icons.arrow_back),
        onTap: () {
          Get.back();
        },
      ),),

        body: FutureBuilder(
            future:friendservice.FriendPlanFlowerDisplay(pid),
            builder: (BuildContext context, AsyncSnapshot snapshot) {


              if (snapshot.hasData) {
                return   ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                        child: Card(
                          child: ListTile(
                            tileColor: Colors.green,
                            onTap: () {
Get.to(flower_full_details(data: snapshot.data, index: index));
                            },
                            leading: Text("    ${
                                snapshot.data[index]['name'].toString().toUpperCase()}",style: TextStyle(color: Colors.white),
                                ),

                            trailing: Icon(Icons.local_florist,color: Colors.white,),
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),

      ),


    );;
  }
}
