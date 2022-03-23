import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/plan_display.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/services/plans_service.dart';

final planService = Get.put(PlanServices());
final apiService = Get.find<ApiService>();

class Plans extends StatefulWidget {

  int? userid;

  Plans({required this.userid });

  @override
  _PlansState createState() => _PlansState(userid);
}

class _PlansState extends State<Plans> {
  late List? flowerlist;
  int? userid;


  _PlansState(userid)
  {this.userid=userid;}

  ListGroupController controller = ListGroupController();



  List<String> StartSeasons = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];

  String StartVal = "Jan";


  List<String> plantypes = ["public", "private"];
  String planvalue = "public";

  TextEditingController plannameController = new TextEditingController();


  int? flowers;
  String? planame;
  String? plantype;
  var mydata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(),
        home: Scaffold(
            appBar: AppBar(backgroundColor: Colors.green),
            body:
            Center(
              child: Container(width: 400,
                height: 500,
               
                child: SingleChildScrollView(
                  child: Column(



                    children: [
                      Icon(Icons.event_note,size: 100,color: Colors.green,),

                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Container(
                          child: TextFormField(
                            controller: plannameController,
                            decoration: InputDecoration(
                                hintText: "Plan Name", labelText: "Enter Plan Name"),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Select Start Month of Plan",
                            style: TextStyle(fontSize: 18),
                          ),
                          DropdownButton(
                            value: StartVal,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: StartSeasons.map((String item) {
                              return DropdownMenuItem(value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                StartVal = newValue!;
                              });
print(plannameController.text);
                              print(StartVal);
                              print(userid);
                            },
                          ),
                        ],
                      ), Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Select the Plan Type",
                            style: TextStyle(fontSize: 18),
                          ),
                          DropdownButton(
                            value: planvalue,
                            icon: Icon(Icons.keyboard_arrow_down),
                            items: plantypes.map((String item) {
                              return DropdownMenuItem(value: item, child: Text(item));
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                               planvalue = newValue!;
                              });
                              print(plannameController.text);
                              print(StartVal);
                              print(userid);
                              print(planvalue);
                            },
                          ),
                        ],
                      ),

                      Container(width: 200,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(primary: Colors.green),
                            onPressed: (){

                          print(userid);
                          print("hello");
planService.addplans(plannameController.text, userid!, StartVal, planvalue);
Get.to(PlanDisplay(planby: userid!));



                        }, child: Text("Add Plan")),
                      )
                    ],
                  ),
                ),
              ),
            )));
  }
}
