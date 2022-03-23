import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';

import 'config/app_theme_config.dart';

class DateSearch extends StatefulWidget {
  const DateSearch({Key? key}) : super(key: key);

  @override
  _DateSearchState createState() => _DateSearchState();
}

class _DateSearchState extends State<DateSearch> {

  TextEditingController duration = TextEditingController();
  DateTime? d;
  DateTime? f;
  final DateFormatter=DateFormat('dd');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Filter',
        home: Scaffold(
            appBar: AppBar(

              backgroundColor: AppThemeConfig.green,
              leading: GestureDetector(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.back();
                },
              ),
            ),
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Search By Date", style: TextStyle(fontSize: 20)),


                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(

                            width: 200,
                            child:Column(children: [

                              Text( d==null? "Pick Date !": DateFormatter.format(d!)),
                              IconButton(onPressed: (){



                                showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2030)).then((value) {








setState(() {
  d=value;
});




                                  DateFormatter.format(d!);
                                  // print(d);
                                  print(  DateFormatter.format(d!));
                                  print(duration.text);
                                });





                              }, icon: Icon(Icons.calendar_today_outlined),iconSize: 50,color: Colors.green,),

                              TextField(
                                decoration: InputDecoration(

                                    labelText: "Enter duration",
                                    hintText: "Duration"
                                ),
                                controller:duration,
                                keyboardType:TextInputType.number ,
                              ),SizedBox(height: 10,),
                              Row(mainAxisAlignment: MainAxisAlignment.center,
                                children: [

                                  ElevatedButton(onPressed: (){
                                    Get.back();

                                  }, child:Text("Search"),style: ElevatedButton.styleFrom(
                                      primary: Colors.green

                                  ),),SizedBox(width: 20,),
                                  ElevatedButton(onPressed: (){
                                    setState(() {
                                      duration.text="";
                                    });

                                    Get.back();
                                  }, child:Text("Cancel "),style: ElevatedButton.styleFrom(

                                      primary: Colors.grey

                                  ),)],),


                            ],))


                      ],
                    ),

                  ],
                ),
              ),
            )));;
  }
}
