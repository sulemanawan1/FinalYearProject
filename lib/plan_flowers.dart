import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/add_planflower.dart';
import 'package:plantscolorguide/flower_full_details.dart';
import 'package:plantscolorguide/services/plans_service.dart';
//final planservice = Get.find<PlanServices>();
final planservice = Get.put(PlanServices());
class PlanFlowers extends StatefulWidget {
  int? pid;
  PlanFlowers( {required this.pid});

  @override
  State<PlanFlowers> createState() => _PlanFlowersState(pid);
}

class _PlanFlowersState extends State<PlanFlowers> {
  int? pid;
  _PlanFlowersState(pid)
  {

    this.pid=pid;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Plan a flower'),
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.back();
              },
            ),
        backgroundColor: Colors.green,
        actions: [Row(children: [ Text("Add Flower",style: TextStyle(fontWeight: FontWeight.bold),),
        IconButton(onPressed: (){
Get.to(AddPlanFlower(pid: pid,));

        }, icon: Icon(Icons.add),color: Colors.white,)],),
    ]),
        body: FutureBuilder(
          future:planservice.PlanFlowerDisplay(pid!) ,
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
                            print(snapshot.data);
Get.to(flower_full_details(data: snapshot.data, index: index));
                            // Get.to(PlanFlowers(  pid:snapshot.data[index]['pid']));
                          },// title: Text("${snapshot.data[index]['planname']}"),
                          leading: Text( snapshot.data[index]['name'].toString().toUpperCase()  ,style: TextStyle(
                            color: Colors.white
                          ), ),
trailing: Icon(Icons.local_florist,color: Colors.white,),
                          // trailing: Text("${snapshot.data[index]['name']}"),
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

    )
    );
  }
}
