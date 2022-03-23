import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/plan_flowers.dart';
import 'package:plantscolorguide/services/plans_service.dart';
final planService = Get.put(PlanServices());
class AddPlanFlower extends StatefulWidget {
  int? pid;
  AddPlanFlower({required this.pid });

  @override
  State<AddPlanFlower> createState() => _AddPlanFlowerState(pid);
}

class _AddPlanFlowerState extends State<AddPlanFlower> {
  int? pid;
  _AddPlanFlowerState(pid)
  {this.pid=pid;}

  List<bool> b=[];
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(home: Scaffold(appBar: AppBar(backgroundColor: Colors.green,),

    body: Column(children: [FutureBuilder(
        future: planService.PlanbyMonths(pid!)  ,

        builder: (BuildContext context, AsyncSnapshot snapshot) {


          if (snapshot.hasData) {


            for(int i=0;i<snapshot.data.length;i++)
            {
              b.add(false);
            }

            return  Expanded(

              child: Container( height: 400,
                child: ListView.builder(itemCount:snapshot. data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                          leading: Checkbox(

                              value: b[index],
                              onChanged: (bool? val) {

                                if (val!) {
                                  b[index] = true;


                                }
                                else {
                                  b[index] = false;
                                  b.clear();

                                }
                                setState(() {
                                  b;












                                });
                              }),
                          title: Text(snapshot.data![index]['name'].toString()),
                          subtitle: Text(  "Grow Time"+" "  +   snapshot.data![index]['growtime'].toString()+ "months"+ "\t \t "+"Life Time"+" "  +   snapshot.data![index]['lifetime'].toString()+ "months"),
                          trailing: ElevatedButton(    style:ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: () {
int fid;
fid=snapshot.data![index]['id'];
                            print(snapshot.data![index]['id'].toString());
                            print(pid);
                            planService.addplanflowers(pid!,fid );
                            Get.to(PlanFlowers(pid: pid));
                            },
                            child: Text("ADD"),)

                      );
                    }),
              ),
            );
          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return CircularProgressIndicator();
          }
        }),],),),);



    ;}}

