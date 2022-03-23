
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/add_nursery.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/nursery_display.dart';
import 'package:plantscolorguide/user_login.dart';


class Nursery extends StatefulWidget {

 List? user;

 Nursery({required this .user});

  @override
  State<Nursery> createState() => _NurseryState(user);
}

class _NurseryState extends State<Nursery> {


  List? user;

  _NurseryState(user)
  {
    this.user=user;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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

        appBar: AppBar(title: Text(""),backgroundColor: AppThemeConfig.green,

        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.yard,size: 140,color: Colors.green,),

              SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppThemeConfig.green,
                    minimumSize: const Size(200, 40)),
                onPressed: (){
                  print(user);

                  Get.to(AddNursery(user: user,));

                },
                child: const Text(
                  "Create Nursery",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

              SizedBox(height: 10,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: AppThemeConfig.green,
                    minimumSize: const Size(200, 40)),
                onPressed: (){

                  Get.to(NurseryDisplay(user: user,));

                },
                child: const Text(
                  "View Nursery",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),

            ],
          ),
        ),
      ));

  }
}


