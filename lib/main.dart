import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plantscolorguide/Plans.dart';
import 'package:plantscolorguide/acceptreject_notification.dart';
import 'package:plantscolorguide/add_flowers.dart';
import 'package:plantscolorguide/add_nursery.dart';
import 'package:plantscolorguide/add_nursery_stock.dart';
import 'package:plantscolorguide/add_planflower.dart';
import 'package:plantscolorguide/admin_panel.dart';
import 'package:plantscolorguide/adminflower_display.dart';
import 'package:plantscolorguide/availibilty.dart';
import 'package:plantscolorguide/availibilty_details.dart';
import 'package:plantscolorguide/date_search.dart';
import 'package:plantscolorguide/nursery_display.dart';
import 'package:plantscolorguide/flower_display.dart';
import 'package:plantscolorguide/flower_full_details.dart';
import 'package:plantscolorguide/friendplan_display.dart';
import 'package:plantscolorguide/friendplan_flower_display.dart';
import 'package:plantscolorguide/friends_display.dart';
import 'package:plantscolorguide/loadingscreen.dart';
import 'package:plantscolorguide/main_screen.dart';
import 'package:get/get.dart';
import 'package:plantscolorguide/nursery.dart';
import 'package:plantscolorguide/nursery_stock.dart';
import 'package:plantscolorguide/plan_display.dart';
import 'package:plantscolorguide/plan_flowers.dart';
import 'package:plantscolorguide/register_user.dart';
import 'package:plantscolorguide/search_filter.dart';
import 'package:plantscolorguide/update_flowers.dart';
import 'package:plantscolorguide/user_login.dart';

import 'add_friends.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    //1-Register the all screen
    initialRoute: 'LoadingScreen',
    getPages: [
      GetPage(
          name: '/MainScreen',
          page: () => MainScreen(
                user: [],
              )),
      GetPage(name: '/AddFlowers', page: () => add_flower()),
      GetPage(
          name: '/FlowerDisplay',
          page: () => FlowerDisplay(
                flower: [],

              )),
      GetPage(name: '/LoadingScreen', page: () => LoadingScreen()),
      GetPage(
          name: '/flower_full_details',
          page: () => flower_full_details(
                data: [],
                index: [],

              )),
      GetPage(
          name: '/SearchFilter',
          page: () => SearchFilter(
                data: [],

              )),
      GetPage(name: '/RegisterUser', page: () => RegisterUser()),
      GetPage(name: '/UserLogin', page: () => UserLogin()),
      GetPage(name: '/AdminPanel', page: () => AdminPanel()),
      GetPage(
          name: '/UpdateFlowers',
          page: () => update_flower(
                id: "",
                name: "",
                color: "",
                startmonth: "",
                endmonth: "",
                month: "",
                season: "",
                growtime: "",
                height: "",
                minheight: "",
                maxheight: "",
                category: "",
                shape: "",
                fragrance: "",
                lifetime: "",
                altitude: "",
                minaltitude: "",
                area: "",
                maxaltitude: "",
                watering: "",
                sunlight: "",
                pesticide: " ",
                disease: "",
                soiltype: "",
                fertilizer: "",
              )),

      GetPage(
          name: '/AdminFlowerDisplay',
          page: () => AdminFlowerDisplay(
                flowers: [],
                index: 0,
              )),
      GetPage(name: '/PlanDisplay', page: () => PlanDisplay(planby: 0)),
      GetPage(name: '/Plans', page: () => Plans(userid:0)),
      GetPage(name: '/PlanFlowers', page: () => PlanFlowers(pid:0)),
      GetPage(name: '/AddPlanFlower', page: () => AddPlanFlower(pid:0)),
      GetPage(name: '/FriendsDisplay', page: () => FriendsDisplay(users:[])),
      GetPage(name: '/AddFriends', page: () => AddFriends(users:[])),
      GetPage(name: '/AcceptRejectNotification', page: () => AcceptRejectNotification(users:[])),
      GetPage(name: '/FriendPlanDisplay', page: () => FriendPlanDisplay(friendid: 0,)),
      GetPage(name: '/FriendPlanFlowerDisplay', page: () => FriendPlanFlowerDisplay(pid: 0,)),
      GetPage(name: '/Nursery', page: () => Nursery(user:[])),
      GetPage(name: '/AddNursery', page: () => AddNursery(user:[])),
      GetPage(name: '/NurseryDisplay', page: () => NurseryDisplay(user:[])),
      GetPage(name: '/NurseryStock', page: () => NurseryStock(nid: 0,userid: 0,)),
      GetPage(name: '/AddNurseryStock', page: () => AddNurseryStock(nid: 0,)),
      GetPage(name: '/Availibility', page: () => Availibilty(fid: 0,)),
      GetPage(name: '/AvailibilityDetails', page: () => AvailibiltyDetails(nursery:[],index:0)),
      GetPage(name: '/DateSearch', page: () => DateSearch()),

    ],
  ));
}
