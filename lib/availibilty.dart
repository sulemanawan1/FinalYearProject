import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/availibilty_details.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/services/nursery_service.dart';

final apiservice= Get.put(ApiService());
final nurseryservice= Get.put(NurseryService());
class Availibilty extends StatefulWidget {
int? fid ;


Availibilty({required this.fid});

  @override
  State<Availibilty> createState() => _AvailibiltyState(fid);
}

class _AvailibiltyState extends State<Availibilty> {
  
  int? fid;
  _AvailibiltyState(fid)
  
  {
    this.fid=fid;
    
    
  }
  
  
  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(title: Text('Nursery Availibility'),
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.back();
                },
              ),
              backgroundColor: Colors.green,
            ),
          body: FutureBuilder(
              future:nurseryservice.FlowerAvailibility(fid!) ,
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
                            Get.to(AvailibiltyDetails(nursery: snapshot.data,index: index,));
                                // Get.to(PlanFlowers(  pid:snapshot.data[index]['pid']));
                              },// title: Text("${snapshot.data[index]['planname']}"),
                              leading: Text( snapshot.data[index]['nname'].toString().toUpperCase()  ,style: TextStyle(
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
