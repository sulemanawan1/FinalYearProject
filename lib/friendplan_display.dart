import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/friendplan_flower_display.dart';
import 'package:plantscolorguide/services/friends_services.dart';

final friendservice= Get.put(FriendService());
class FriendPlanDisplay extends StatefulWidget {
int friendid=0;
  FriendPlanDisplay({required this.friendid});
  @override
  _FriendPlanDisplayState createState() => _FriendPlanDisplayState(friendid);
}

class _FriendPlanDisplayState extends State<FriendPlanDisplay> {

  int friendid=0;
  int pid=0;
  _FriendPlanDisplayState(friendid)
  {this.friendid=friendid;


  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back),
          onTap: () {
            Get.back();
          },
        ),

        backgroundColor: Colors.green,),

      body: FutureBuilder(
          future:friendservice.FriendPlanDisplay(friendid),
          builder: (BuildContext context, AsyncSnapshot snapshot) {


            if (snapshot.hasData) {
              return   ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
                      child: Card(
                        child: ListTile(tileColor: Colors.green,
                          onTap: () {
                            pid=snapshot.data[index]['pid'];
           print(friendid);
           print(pid);
           Get.to(()=>FriendPlanFlowerDisplay(pid: pid,)   );


                          },
                          leading: Text("    ${
                              snapshot.data[index]['planname'].toString().toUpperCase()}",style: TextStyle(color: Colors.white),),
                          trailing: Icon(Icons.event_note,color: Colors.white,),
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


    );
  }
}
