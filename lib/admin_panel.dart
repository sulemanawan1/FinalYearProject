import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/adminflower_display.dart';
import 'package:plantscolorguide/update_flowers.dart';
import 'package:plantscolorguide/user_login.dart';
import 'config/app_theme_config.dart';
import 'services/api_service.dart';

final apiService = Get.find<ApiService>();

class AdminPanel extends StatefulWidget {
  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  late Future _flowerslist;



  TextEditingController searchfield= new TextEditingController();
  bool flag=false;
  @override
  void initState() {
    super.initState();
    _flowerslist=apiService.getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        home: Scaffold(
            drawer: Drawer(
                child: Column(
              children: [
                IconButton(
                  onPressed: () {
                    Get.off(()=>UserLogin());
                  },
                  icon: Icon(Icons.logout),
                )
              ],
            ) // Populate the Drawer in the next step.
                ),
            appBar: AppBar(


                actions: [
                  // Navigate to the Search Screen
                  IconButton(
                      onPressed: () {


                        setState(() {
                          this.flag=!this.flag;

                          _flowerslist=apiService.getData();
                        });
                      },
                      icon: Icon(Icons.search))
                ],

                title: !flag ? Text('Admin Panel') :  TextField(controller: searchfield,

                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.lightGreenAccent),
                    hintText: 'search'
                    ,
                    icon: Icon(Icons.search,color: Colors.lightGreenAccent,)),
                onChanged:(query) {
                  print(query);
         setState(() {
           _flowerslist=   userservice.SearchQuery(query);
         });

                },
                ),
                centerTitle: true,
                backgroundColor: Colors.green),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.white,
              onPressed: () {
                Get.toNamed('/AddFlowers');
              },
              child: Icon(
                Icons.add,
                color: AppThemeConfig.green,
              ),
            ),
            body:

               FutureBuilder(
                  future: _flowerslist,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [

                                    Text("${snapshot.data[index]['name']}"),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                          ),
                                          iconSize: 30,
                                          color: Colors.blue,
                                          splashColor: Colors.purple,
                                          onPressed: () {
                                            print(snapshot.data);

                                            setState(() {});
                                            Get.to(update_flower(
                                                id: snapshot.data[index]['id']
                                                    .toString(),
                                                name: snapshot.data[index]['name']
                                                    .toString(),
                                                color: snapshot.data[index]
                                                        ['color']
                                                    .toString(),
                                                startmonth: snapshot.data[index]
                                                        ['startmonth']
                                                    .toString(),
                                                endmonth: snapshot.data[index]
                                                        ['endmonth']
                                                    .toString(),
                                                month: snapshot.data[index]
                                                        ['month']
                                                    .toString(),
                                                season: snapshot.data[index]
                                                    ['season'],
                                                growtime: snapshot.data[index]['growtime'].toString(),
                                                height: snapshot.data[index]['height'],
                                                minheight: snapshot.data[index]['minheight'].toString(),
                                                maxheight: snapshot.data[index]['maxheight'].toString(),
                                                category: snapshot.data[index]['category'],
                                                shape: snapshot.data[index]['shape'],
                                                fragrance: snapshot.data[index]['fragrance'],
                                                lifetime: snapshot.data[index]['lifetime'].toString(),
                                                altitude: snapshot.data[index]['altitude'],
                                                minaltitude: snapshot.data[index]['minaltitude'].toString(),
                                                maxaltitude: snapshot.data[index]['maxaltitude'].toString(),
                                                area: snapshot.data[index]['area'],
                                                watering: snapshot.data[index]['watering'],
                                                sunlight: snapshot.data[index]['sunlight'],
                                                pesticide: snapshot.data[index]['pesticide'],
                                                disease: snapshot.data[index]['disease'],
                                                soiltype: snapshot.data[index]['soiltype'],
                                                fertilizer: snapshot.data[index]['fertilizer']));
                                          },
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                          ),
                                          iconSize: 30,
                                          color: Colors.red,
                                          splashColor: Colors.purple,
                                          onPressed: ()  async {
print(snapshot
    .data[index]['id']);
                                              Get.defaultDialog(
                                                  title: " WARNING ⚠   ",
                                                  middleText:
                                                      "Do you want to delete this flower?",
                                                  onCancel: () {},
                                                  textConfirm: "yes",
                                                  textCancel: "no",
                                                  onConfirm: () {
                                                    // int id = ;


                                                setState(() {

                                                  apiService.deleteData(snapshot
                                                      .data[index]['id']);
                                                   _flowerslist= apiService.getData()  ;


                                                });


                                                    // print(id);

                                                     Get.back();
                                                  });
                                            }
                                          ,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.info,
                                          ),
                                          hoverColor: Colors.indigoAccent,
                                          iconSize: 30,
                                          color: Colors.blue,
                                          splashColor: Colors.purple,
                                          onPressed: () {
                                            Get.to(AdminFlowerDisplay(
                                              flowers: snapshot.data,
                                              index: index,
                                            ));
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                Divider(
                                  height: 12,
                                )
                              ],
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Icon(Icons.error_outline);
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            ));
  }


}
