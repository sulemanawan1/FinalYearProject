import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/plan_flowers.dart';
import 'package:plantscolorguide/services/plans_service.dart';

import 'Plans.dart';
final planservice = Get.put(PlanServices());
class PlanDisplay extends StatefulWidget {
  int planby;

  PlanDisplay({required this.planby});

  @override
  _PlanDisplayState createState() => _PlanDisplayState(planby);
}

class _PlanDisplayState extends State<PlanDisplay> {
  int? planby;
bool flag= false;
late Future _list;
  _PlanDisplayState(planby)

  {this.planby=planby;

    _list=planservice.getData(planby!) ;


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _list=planservice.getData(planby!) ;
    });

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
appBar: AppBar(centerTitle: true,  title: Text('MY PLANS'),
  leading: GestureDetector(
    child: Icon(Icons.arrow_back),
    onTap: () {
      Get.back();
    },
  ),
backgroundColor: Colors.green,
actions: [Row(children: [ Text("Add Plan",style: TextStyle(fontWeight: FontWeight.bold),),
  IconButton(onPressed: (){
    print(planby);
    Get.to(Plans(userid: planby,));


  }, icon: Icon(Icons.add),color: Colors.white,)],),

 ],),

      body: FutureBuilder(
          future:_list,
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
                           print( snapshot.data[index]['pid']);
                           print(snapshot.data[index]['fid']);

                         Get.to(PlanFlowers(  pid:snapshot.data[index]['pid']));
                          },// title: Text("${snapshot.data[index]['planname']}"),
                          leading: Text(" ${
                              snapshot.data[index]['planname'].toString().toUpperCase()}",
                              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
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
          })

    ),)



    ;
  }
}
