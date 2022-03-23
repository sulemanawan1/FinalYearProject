import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:plantscolorguide/add_friends.dart';
import 'package:plantscolorguide/register_user.dart';
import 'package:plantscolorguide/services/friends_services.dart';
import 'package:plantscolorguide/services/plans_service.dart';
import 'package:plantscolorguide/services/users_services.dart';

import 'config/app_theme_config.dart';


final planService = Get.put(PlanServices());
final  friendservice = Get.put(FriendService());

class AcceptRejectNotification extends StatefulWidget {

List? users;

  AcceptRejectNotification({required this.users});


  @override
  State<AcceptRejectNotification> createState() => _AcceptRejectNotificationState(users);
}

class _AcceptRejectNotificationState extends State<AcceptRejectNotification> {
  List? users;
  int? friend1;
  int? friend2;
  _AcceptRejectNotificationState(users)
  {  this.users=users;
  friend1 = users![0]['id'];
  }
  late Future reqlist;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    reqlist=friendservice.GetSendRequest(friend1!);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Friend Requests',),),
      body: FutureBuilder(
          future: reqlist ,

          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                  itemBuilder:(context,index)

              {

                return Row(children: [

                  Container(
                    width: 200,
                    child: Row(  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [


                      Text("${snapshot.data[index]['username'].toString()}",style: TextStyle(fontSize: 16),) ,
                      Text("${snapshot.data[index]['city']}") ,
]),
                  )
               ,
                  Container(
                    width: 200,
                    child: Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: AppThemeConfig.green),
                        onPressed: () async{

                          friend2=snapshot.data[index]['id'];
                          print(friend1);
                          print(friend2);
             await   friendservice.Friends(friend1!, friend2!);

                        },
                        child: Text("Accept"),

                      ),
                        SizedBox(width: 10,),
                        Expanded(

                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () async{

                            friend2=snapshot.data[index]['id'];
                            print(friend1);
                            print(friend2);
                          await  friendservice.UnFriends(friend1!, friend2!);

                          },
                          child: Text("Reject"),


                      ),
                        )],),
                  )
                ],);

              });
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),),
    );
  }
}
