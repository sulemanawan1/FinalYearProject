import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/nursery_display.dart';

GlobalKey<FormState> key = GlobalKey<FormState>();


class AddNursery extends StatefulWidget {

  List? user;
  AddNursery({required this.user});



  @override
  _AddNurseryState createState() => _AddNurseryState(user);
}

class _AddNurseryState extends State<AddNursery> {
List? user;
int? userid;

  _AddNurseryState(user)

  {
    this.user=user;
    this.userid= user[0]['id'];

  }
  TextEditingController nname = new TextEditingController();
  TextEditingController naddress = new TextEditingController();
  TextEditingController ncontact = new TextEditingController();


void validater() {
  if (key.currentState!.validate()) {

    nurseryservice.addnursery(nname.text, naddress.text, ncontact.text, userid!);


    print("add successfully");

  } else {
    print("please fill all field");
  }
}




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(

              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.back();
                },
              ),
              backgroundColor: Colors.green,
            ),
            body: Form(
              key: key,
              child: Center(
                child: SingleChildScrollView(
                  child: Container(

                    child: Column(


                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.yard,size: 120,color: Colors.green,),
                          Container(

                            width: 300,
                            child: TextFormField(
                              controller: nname,
                              validator: emptyfield,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.filter_vintage,color: Colors.green,),
                                hintText: 'Enter your Nursery Name',
                                labelText: 'Nursery Name *',
                              ),
                            ),
                          ),
                          Container(     width: 300,
                            child: TextFormField(
                              controller:naddress,
                              validator: emptyfield,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.location_on,color: Colors.green,),
                                hintText: 'Enter Nursery Address',
                                labelText: 'Address *',
                              ),
                            ),
                          ),

                          Container(     width: 300,
                            child: TextFormField(
                              keyboardType:TextInputType.phone ,
                              controller: ncontact,
                              validator: emptyfield,
                              decoration: const InputDecoration(
                                icon: Icon(Icons.call,color: Colors.green,),
                                hintText: ' Contact',
                                labelText: 'Contact *',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(width: 200,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: Colors.green),
                              child: Text("Create Nursery"),
                              onPressed: () {
                                print(user);

                                validater();},
                            ),
                          )
                          ,InkWell(onTap: (){

                            Get.to(NurseryDisplay(user: user,));


                          },
                              child: Text("View Existing Nurseries",style: TextStyle(color:Colors.green),))
                        ]),
                  ),
                ),
              ),
            )));
  }
}
String? emptyfield(String? val) {
  if (val!.isEmpty) {
    return "required";
  } else {
    return null;
  }
}

