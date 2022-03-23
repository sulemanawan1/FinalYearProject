import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/add_friends.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/friendplan_display.dart';
import 'package:plantscolorguide/services/friends_services.dart';
import 'package:plantscolorguide/services/users_services.dart';
final friendservice= Get.put(FriendService());
class FriendsDisplay extends StatefulWidget {

  List users;

  FriendsDisplay( {required this .users} );

  @override
  _FriendsDisplayState createState() => _FriendsDisplayState(users);
}

class _FriendsDisplayState extends State<FriendsDisplay> {
  List? users;
int userid=0;
int friendid=0;
  _FriendsDisplayState(users)
  {this.users=users;
  userid=users[0]['id'];

  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: 
    AppBar(

      actions: [Row(children: [ElevatedButton(
          style: ElevatedButton.styleFrom(primary: Color.fromRGBO(242,219,117,2)),
          onPressed: (){
            print ( "user data");
print(userid);
print(users);
           Get.to(()=>AddFriends(users: users!));
          }, child: Row(
        children: [ Text("Discover People" ,style: TextStyle(color: Colors.green),),
          Icon(Icons.add,color: Colors.green,)],
      ))],)
        
        ],
      backgroundColor: AppThemeConfig.green,

      title: Text('Freinds List'), ),body: FutureBuilder(
            future: friendservice.GetFriends(userid),

            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,

                    itemBuilder: (context,index)

                {
                  return ListTile(onTap: (){
                    friendid=snapshot.data[index]['friendid'];
                  print(friendid);
Get.to(   ()=>FriendPlanDisplay(friendid: friendid,));

                  },
                    leading:Icon(Icons.face,size: 30,) ,
                  subtitle:Text("${snapshot.data[index]['friend'].toString().toUpperCase()}") ,
                    trailing:Text("${snapshot.data[index]['friendcity'].toString()}",style: TextStyle(fontSize: 14),) ,
                 );


                });
              } else if (snapshot.hasError) {
                return Icon(Icons.error_outline);
              } else {
                return CircularProgressIndicator();
              }
            }),),);
  }
}
