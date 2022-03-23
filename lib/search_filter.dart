import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/services/filters_service.dart';

import 'flower_display.dart';

final filterService = Get.put(FilterService());


class SearchFilter extends StatefulWidget {
  List? data;





  @override
  State<SearchFilter> createState() => _SearchFilterState(data);
  SearchFilter({required this.data});
}

class _SearchFilterState extends State<SearchFilter> {
  List? data;



  _SearchFilterState(data) {



    this.data = data;

  }

  List <String> Fragrances=["sweet scent","clove scent","honey scent","pineapple scent","Grape fragrance","floral scent",
    "Rosey scent","fruity scent","heady fragrance","lemony scent"];
String fragranceVal="sweet scent";
  List <String> cities =["Karachi", "Lahore", "Faisalabad", "Rawalpindi", "Gujranwala", "Peshawar", "Multan", "Saidu Sharif", "Hyderabad", "Islamabad", "Quetta", "Bahawalpur", "Sargodha", "Sialkot", "Sukkur", "Larkana", "Chiniot", "Shekhupura", "Jhang", "Dera Ghazi Khan", "Gujrat", "Rahimyar Khan", "Kasur", "Mardan", "Mingaora", "Nawabshah", "Sahiwal", "Mirpur Khas", "Okara", "Mandi Burewala", "Jacobabad", "Saddiqabad", "Kohat", "Muridke", "Muzaffargarh", "Khanpur", "Gojra", "Mandi Bahauddin", "Abbottabad", "Turbat", "Dadu", "Bahawalnagar", "Khuzdar", "Pakpattan", "Tando Allahyar", "Ahmadpur", "Vihari", "Jaranwala", "New Mirpur", "Kamalia", "Kot Addu", "Nowshera", "Swabi", "Khushab", "Dera Ismail Khan", "Chaman", "Charsadda", "Kandhkot", "Chishtian", "Hasilpur", "Attock Khurd", "Muzaffarabad", "Mianwali", "Jalalpur Jattan", "Bhakkar", "Zhob", "Dipalpur", "Kharian", "Mian Channun", "Bhalwal", "Jamshoro", "Pattoki", "Harunabad", "Kahror Pakka", "Toba Tek Singh", "Samundri", "Shakargarh", "Sambrial", "Shujaabad", "Hujra Shah Muqim", "Kabirwala", "Mansehra", "Lala Musa", "Chunian", "Nankana Sahib", "Bannu", "Pasrur", "Timargara", "Parachinar", "Chenab Nagar", "Gwadar", "Abdul Hakim", "Hassan Abdal", "Tank", "Hangu", "Risalpur Cantonment", "Karak", "Kundian", "Umarkot", "Chitral", "Dainyor", "Kulachi", "Kalat", "Kotli", "Gilgit", "Narowal", "Khairpur Mir’s", "Khanewal", "Jhelum", "Haripur", "Shikarpur", "Rawala Kot", "Hafizabad", "Lodhran", "Malakand", "Attock", "Batgram", "Matiari", "Ghotki", "Naushahro Firoz", "Alpurai", "Bagh", "Daggar", "Leiah", "Tando Muhammad Khan", "Chakwal", "Badin", "Lakki", "Rajanpur", "Dera Allahyar", "Shahdad Kot", "Pishin", "Sanghar", "Upper Dir", "Thatta", "Dera Murad Jamali", "Kohlu", "Mastung", "Dasu", "Athmuqam", "Loralai", "Barkhan", "Musa Khel Bazar", "Ziarat", "Gandava", "Sibi", "Dera Bugti", "Uthal", "Khuzdar", "Chilas", "Panjgur", "Gakuch", "Qila Saifullah", "Kharan", "Aliabad", "Awaran", "Dalbandin", "sawat", "shimsal", "duki", "skardu", "naran", "Babusar Pass", "washuk"];

  String cityVal="Rawalpindi";


  List <int> minaltitude=[10,50,100,500,1000,2000,2500,3000,3500,4000,4500,5000,5500,6000];
  int minaltitudeValue=10;
  List <int> maxaltitude=[10,50,100,500,1000,2000,2500,3000,3500,4000,4500,5000,5500,6000];
  int maxaltitudeValue=3000;
  List <int> minheight =[6,12,24,36,48,60,72];
  int minheightValue=6;
  List <int> maxheight =[6,12,24,36,48,60,72];
  int maxheightValue=48;


  List<String> Shapes =
  [ "star shape" ,   "bell shape",    "round shape",    "oval shape"    ,"heart shape" ,"funnel shape" ,
    "cup shape","fan shape","spherical shape"
  ];
  String shapeVal="round shape";


  List<String> Seasons =
  ["summer","autumn","winter","spring"];
  String seasonVal = "summer";

  List<String> Colorss = [

    "Red",
    "Blue",
    "Yellow",
    "Pink",
    "Purple",
    "Grey",
    "Green",
    "White",
    "Orange",
  ];
  List<String> category = ["indoor", "outdoor", "both"];
  static String colorVal = "Red";

  String categoryVal = "both";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Filter',
        home: Scaffold(

            appBar: AppBar(
backgroundColor: Colors.green,
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
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Filters",
                      style: TextStyle(fontSize: 30,color: Colors.green),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("Search by Color", style: TextStyle(fontSize: 18)),
                        DropdownButton(
                          value: colorVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: Colorss.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              colorVal = newValue!;
                            });

                            print(colorVal);
                          },
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Search by Season",
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: seasonVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: Seasons.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              seasonVal = newValue!;
                            });

                            print(seasonVal);
                          },
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Search by Shape",
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: shapeVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: Shapes.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              shapeVal = newValue!;
                            });

                            print(shapeVal);
                          },
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Search by Fragrances",
                          style: TextStyle(fontSize: 20),
                        ),
                        DropdownButton(
                          value: fragranceVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: Fragrances.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              fragranceVal = newValue!;
                            });

                            print(fragranceVal);
                          },
                        ),

                      ],
                    ),

          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceAround,
          //             children: [
          //             Text(
          //                 "MinAltitude",
          //                 style: TextStyle(fontSize: 16),
          //               ),
          //               DropdownButton(
          //                 value: minaltitudeValue,
          //                 icon: Icon(Icons.keyboard_arrow_down),
          //                 items: minaltitude.map((int item) {
          //                   return DropdownMenuItem(
          //                       value: item, child: Text(item.toString()));
          //                 }).toList(),
          //                 onChanged: (int? newValue) {
          //                   setState(() {
          //                     minaltitudeValue = newValue!;
          //                   });
          //
          //                   print(minaltitudeValue);
          //                 },
          //               ),   Text(
          //     "MaxAltitude",
          //     style: TextStyle(fontSize: 16),
          //   ),
          // DropdownButton(
          //   value: maxaltitudeValue,
          //   icon: Icon(Icons.keyboard_arrow_down),
          //   items: maxaltitude.map((int item) {
          //     return DropdownMenuItem(
          //         value: item, child: Text(item.toString()));
          //   }).toList(),
          //   onChanged: (int? newValue) {
          //     setState(() {
          //       maxaltitudeValue = newValue!;
          //     });
          //
          //     print(maxaltitudeValue);
          //   },
          // ),
          //
          //             ],
          //           ) ,


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "MinHeight",
                          style: TextStyle(fontSize: 18),
                        ),
                        DropdownButton(
                          value: minheightValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: minheight.map((int item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item.toString()));
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                              minheightValue = newValue!;
                            });

                            print(minheightValue);
                          },
                        ),   Text(
                          "MaxHeight",
                          style: TextStyle(fontSize: 18),
                        ),
                        DropdownButton(
                          value: maxheightValue,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: maxheight.map((int item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item.toString()));
                          }).toList(),
                          onChanged: (int? newValue) {
                            setState(() {
                             maxheightValue = newValue!;
                            });

                            print(maxheightValue);
                          },
                        ),

                      ],
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          " Category",
                          style: TextStyle(fontSize: 18),
                        ),
                        DropdownButton(
                          value: categoryVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: category.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              categoryVal = newValue!;
                            });

                            print(categoryVal);
                          },
                        ),

                      ],

                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Area",
                          style: TextStyle(fontSize: 18),
                        ),
                        DropdownButton(
                          value: cityVal,
                          icon: Icon(Icons.keyboard_arrow_down),
                          items: cities.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                             cityVal = newValue!;
                            });

                            print(cityVal);
                          },
                        ),

                      ],

                    ),


                    ElevatedButton(
                       style: ElevatedButton.styleFrom(
                            primary: Colors.green),
                        onPressed: () {
                          compundsearch();
                        },
                        child: Text("Search",style: TextStyle(color: Colors.white),))
                  ],
                ),
              ),
            )));
  }



  Future compundsearch() async {
    data= await filterService.compundsearch( colorVal,seasonVal, categoryVal,minaltitudeValue,maxaltitudeValue,
    minheightValue,maxheightValue);

    Get.to(FlowerDisplay(
      flower: data!,

    ));
  }


}
