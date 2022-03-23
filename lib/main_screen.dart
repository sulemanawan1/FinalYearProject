
import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/acceptreject_notification.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/flower_display.dart';
import 'package:plantscolorguide/friends_display.dart';
import 'package:plantscolorguide/plan_display.dart';
import 'package:plantscolorguide/services/friends_services.dart';
import 'package:plantscolorguide/services/users_services.dart';
import 'package:plantscolorguide/user_login.dart';

import 'services/api_service.dart';
final userservice = Get.put(UserController());
final friendservice = Get.put(FriendService());
class MainScreen extends StatefulWidget {
  List? user;

  MainScreen({required this.user});
  @override
  State<MainScreen> createState() => _MainScreenState(user);



}




class _MainScreenState extends State<MainScreen> {
  List? user;
List? reqCount;
late Future li;
int userid=0;

  _MainScreenState(user)
  {


      this.user=user;
      print (user);
      this.userid=user[0]['id'];
      print(userid);


      li=friendservice.GetSendRequestCount(userid);



  }


  int? planby ;


  final apiService = Get.put(ApiService());

  final userService = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(


        appBar: AppBar(


            actions: [
  Container(
  child:   Row(

    children: [
      GestureDetector(
      onTap: (){


        print("Notification tap successfully");

        Get.to(()=>AcceptRejectNotification(users: user,));
      },
      child:

      FutureBuilder(
                            future: friendservice.GetSendRequestCount(userid),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return  Badge(

                                  badgeContent: Text("${snapshot.data[0]['ob1']}"),
                                  padding: EdgeInsets.all(4),

                                  child: Icon(Icons.notifications,size: 30,),);
                              } else if (snapshot.hasError) {
                                return Icon(Icons.error_outline);
                              } else {
                                return CircularProgressIndicator();
                              }
                            })),
  SizedBox(width: 30,),
  ],

  ),
)],
            title: const Text(''),
            centerTitle: true,
            backgroundColor: AppThemeConfig.green),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
            items: [

              BottomNavigationBarItem(

              icon:
              InkWell(child: Icon(Icons.people,color: Colors.green,)
              ,onTap: (){


                print ("hello");
                },
              ),
              label: 'Friends',

            ),

      BottomNavigationBarItem(

            icon: Icon(Icons.favorite,color: Colors.red,),
              label: 'Favorite',
            ),



            ] ),


        drawer: Drawer(
            child: Column(
          children: [
            IconButton(
              onPressed: () {
                Get.off(() => UserLogin());
              },
              icon: Icon(Icons.logout),
            )
          ],
        ) // Populate the Drawer in the next step.
            ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

Icon(Icons.local_florist_rounded,size: 200,
color: Colors.green,),
                // CircleAvatar(
                //   child: Image.asset(
                //     "images/mainlogo.png",
                //     width: 500,
                //   ),
                //   radius: 100,
                //   backgroundColor: Colors.green[400],
                // ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeConfig.green,
                      minimumSize: const Size(200, 40)),
                  onPressed: () async {

                    final List<dynamic> flowercity;
                    final String city = widget.user![0]['city'];


                    flowercity = await apiService.getDataWithCity(city);
                    print(widget.user![0]['city']);


                    Get.to(
                        FlowerDisplay(
                      flower: flowercity,

                    ));
                  },
                  child: const Text(
                    "FLOWERS IN YOUR  AREA",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeConfig.green,
                      minimumSize: const Size(200, 40)),
                  onPressed: () async {
                    final List<dynamic> flower;


                     flower = apiService.mydata!;



                    Get.to(
                        FlowerDisplay(
                          flower: flower,

                        ));
                  },
                  child: const Text(
                    "VIEW ALL FLOWERS",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeConfig.green,
                      minimumSize: const Size(200, 40)),
                  onPressed: () {
                 //   Get.to(Plans(user: user));

                    Get.to(PlanDisplay(planby: planby!));
                  },
                  child: const Text(
                    "MY PLANS",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),

                SizedBox(height: 10,)
,


                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: AppThemeConfig.green,
                      minimumSize: const Size(200, 40)),
                  onPressed: () async {
Get.to(()=>FriendsDisplay(users: user!,));


                  },
                  child: const Text(
                    "Friends 👬",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    planby = user![0]['id'];


  }
}
