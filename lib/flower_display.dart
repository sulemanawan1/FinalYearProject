
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:plantscolorguide/availibilty.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/date_search.dart';
import 'package:plantscolorguide/flower_full_details.dart';
import 'package:plantscolorguide/search_filter.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/services/nursery_service.dart';
//sulemnangittmmi
final apiservice= Get.put(ApiService());
final nurseryservice= Get.put(NurseryService());
class FlowerDisplay extends StatefulWidget {
  List? flower;

  FlowerDisplay({required this.flower});



  @override
  State<FlowerDisplay> createState() => _FlowerDisplayState(flower);


}




class _FlowerDisplayState extends State<FlowerDisplay> {
int? fid;
TextEditingController duration = TextEditingController();
DateTime? d;
DateTime? f;
final DateFormatter=DateFormat('dd');




















  List? flower;
bool flag = false;

List <bool> flags= [];

_FlowerDisplayState(flower)

  {this.flower=flower;
for ( int i=0;i<flower.length;i++)

{
  flags.add(false);
}

  }
  @override
  void initState() {
    super.initState();

  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        appBar: AppBar(

            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.back();
              },
            ),
            backgroundColor: AppThemeConfig.green,
            actions: [



              IconButton(
                icon: Icon(Icons.calendar_today_outlined),
                onPressed: () {

Get.to(DateSearch());
// setState(() {
//   Get.defaultDialog(
//       title: ' how many seedling you want ?',content:
//   Container(
//
//       width: 200,
//       child:Column(children: [
//
//         Text( d==null? "Pick Datae !": DateFormatter.format(d!)),
//         IconButton(onPressed: (){
//
//
//
//           showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2022), lastDate: DateTime(2030)).then((value) {
//
//
//
//
//
//
//
//
//
//
//             d=value;
//
//
//             DateFormatter.format(d!);
//             // print(d);
//             print(  DateFormatter.format(d!));
//             print(duration.text);
//           });
//
//
//
//
//
//         }, icon: Icon(Icons.calendar_today_outlined)),
//
//         TextField(
//           decoration: InputDecoration(
//
//               labelText: "Enter duration",
//               hintText: "Duration"
//           ),
//           controller:duration,
//           keyboardType:TextInputType.number ,
//         ),SizedBox(height: 10,),
//         Row(mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//
//             ElevatedButton(onPressed: (){
//               Get.back();
//
//             }, child:Text("Search"),style: ElevatedButton.styleFrom(
//                 primary: Colors.green
//
//             ),),SizedBox(width: 20,),
//             ElevatedButton(onPressed: (){
//               setState(() {
//                 duration.text="";
//               });
//
//               Get.back();
//             }, child:Text("Cancel "),style: ElevatedButton.styleFrom(
//
//                 primary: Colors.grey
//
//             ),)],),
//
//
//       ],))
//
//
//   );
// });
//




                },
              ),



              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {

                  flag = true;
                  Get.to(SearchFilter(
                    data:flower

                  ));
                },
              ),
            ]),
        body:
                GridView.count(
                  scrollDirection: Axis.vertical,
                  padding: EdgeInsets.all(2),
                  crossAxisCount: 2,
                  children: List.generate(flower!.length, (index) {

                  List <String> mycolor;

                mycolor= flower![index]['color'].toString().split(",");








                  if (flower![index]['status']==1)



{
  flags[index]=true;

}


                    return InkWell(
                        onTap: () {
                          Get.to(flower_full_details(
                            data: flower!,
                            index: index,
                          ));
                        },
                        child: Container(
                            child: Card(


                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color:Colors.green[500],
                              child: Column(children: <Widget>[
                                Container(
                                  margin: EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                  Row(children: [





                                  ],),
                                      // Row(children: [   FavoriteButton(iconSize: 32,
                                      //     isFavorite: flags[index],
                                      //     valueChanged: (fav){
                                      // print(flags);
                                      //
                                      //
                                      //     }),],),


                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "http://${apiservice.ip}/flowers/Uploads/${flower![index]['image'].toString()}"),
                                        radius: 30,
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        InkWell(
                                          child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [Text("Availibility",style: TextStyle(color: Colors.yellowAccent,fontSize: 13)),
                                              SizedBox(width: 4,),
                                              Icon(Icons.circle,size: 10,color: Colors.lightGreenAccent,)

                                            ],),

                                          onTap: (){

                                      print(index);

                                            print(flags.length);
                                         fid=   flower![index]['id'];

                                            Get.to(Availibilty(fid: fid!,));


                                          },
                                        ),

                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          "${flower![index]['name'].toString().toUpperCase()}",
                                          style: TextStyle(

                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color:Colors.white)
                                        ),

SizedBox(height: 6,),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // Text(
                                            //   "Color",
                                            //   style: TextStyle(
                                            //       fontSize: 12,
                                            //       fontWeight: FontWeight.bold,
                                            //       color: AppThemeConfig.white),
                                            // ),
                                            SizedBox(
                                              height: 4,
                                            ),

                                            // Text("${flower![index]['color'].toString()}",textAlign: TextAlign.center,
                                            //     style: TextStyle(
                                            //
                                            //         fontSize: 12,
                                            //         fontWeight: FontWeight.bold,
                                            //         color: AppThemeConfig.white)),
                                            for ( int i=0;i<mycolor.length;i++)

                                            // Icon(Icons.circle,
                                            //           color:  mycolor[0].isNotEmpty?  getColor(   mycolor[0].trim().toLowerCase()):getColor(  "red"   ), size: 10,),


                                              Icon(Icons.circle,
                                                color:  mycolor[i].isEmpty?getColor(  "red"   ) : getColor(   mycolor[i].trim().toLowerCase()), size: 14,),

                                          ],

                                        ),
                                        SizedBox(height: 6,),
                                        Column(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [

                                            Text(
                                              "Category".toString().toUpperCase(),
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: AppThemeConfig.white),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text(
                                              "${flower![index]['category'].toString()}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppThemeConfig.white),
                                            ),


                                          ],),
                                      ],
                                    ),

                                  ]),
                                ),
                              ]),
                            )));
                  }),
                ))







    );
  }
}
Color getColor(String color) {
  switch (color) {
  //add more color as your wish
    case "red":
      return Colors.red;
    case "blue":
      return Colors.blue;
    case "yellow":
      return Colors.yellow;
    case "orange":
      return Colors.orange;
    case "green":
      return Colors.lightGreenAccent;
    case "white":
      return Colors.white;

    case "pink":
      return Colors.pink;

    case "black":
      return Colors.black;
    case "purple":
      return Colors.purple;
    case "brown":
      return Colors.brown;
    case "":
      return Colors.grey;
    default:
      return Colors.transparent;

  }




}