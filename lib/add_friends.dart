import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/acceptreject_notification.dart';
import 'package:plantscolorguide/friends_display.dart';
import 'package:plantscolorguide/register_user.dart';
import 'package:plantscolorguide/services/friends_services.dart';
import 'package:plantscolorguide/services/plans_service.dart';
import 'package:plantscolorguide/services/users_services.dart';

import 'config/app_theme_config.dart';
final planService = Get.put(PlanServices());
final friendService= Get.put(FriendService());
class AddFriends extends StatefulWidget {
  List users;


  AddFriends({required this.users});

  @override
  _AddFriendsState createState() => _AddFriendsState(users);
}

class _AddFriendsState extends State<AddFriends> {

  List? users;
  int sender=0;
  int reciever=0;

  _AddFriendsState(users)

  {this.users=users;
  this.sender=users[0]['id'];
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(

        appBar: AppBar

          (
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Get.back();
            },
          ),
          backgroundColor: Colors.green,title: Text("People"),),

      body: Column(children: [FutureBuilder(
          future: friendService.UsersList(sender) ,

          builder: (BuildContext context, AsyncSnapshot snapshot) {


            if (snapshot.hasData) {





    return Expanded(

    child: Container( height: 400,
    child: ListView.builder(
        itemCount: snapshot.data.length,

        itemBuilder: (context,index)

    {
      return ListTile(
        leading:Text("${snapshot.data[index]['username'].toString()}",style: TextStyle(fontSize: 16),) ,
        subtitle:Text("${snapshot.data[index]['city']}") ,
        trailing:ElevatedButton(
          style: ElevatedButton.styleFrom(primary: AppThemeConfig.green),
          onPressed: (){
            reciever=snapshot.data[index]['id'];
            print ("friends");

            print ( sender);
            print(reciever);
            friendService.sendrequest(sender, reciever);






          },
          child: Text("Send Request"),

        ),);



    })));}

            else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),],),),);;
  }
}
