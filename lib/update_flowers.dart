
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'services/api_service.dart';
final apiService = Get.put(ApiService());

class update_flower extends StatefulWidget {
  String id;
  String name;
 String  color;
 String startmonth;
  String endmonth;
 String month;
String  season;
 String growtime;
 String height;
String minheight;
String maxheight;
String  category;
 String shape;
 String fragrance;
 String lifetime;
 String altitude;
 String minaltitude;
String  maxaltitude;
String  area;
String  watering;
 String sunlight;
String  pesticide;
String  disease;
 String soiltype;
 String fertilizer;




















  @override
  State<update_flower> createState() => _update_flowerState(id,name,color,startmonth,endmonth,month,season,growtime,height
  ,minheight,maxheight,category,shape,fragrance,lifetime,altitude,minaltitude,maxaltitude,area,watering, sunlight,pesticide,
  disease,soiltype,fertilizer);

  update_flower(
  { required  this.id,
  required    this.name,
  required    this.color,
    required  this.startmonth,
  required    this.endmonth,
  required    this.month,
  required    this.season,
 required     this.growtime,
 required     this.height,
 required     this.minheight,
 required     this.maxheight,
  required    this.category,
 required     this.shape,
 required     this.fragrance,
  required    this.lifetime,
 required     this.altitude,
 required     this.minaltitude,
 required     this.maxaltitude,
 required     this.area,
 required     this.watering,
 required     this.sunlight,
 required     this.pesticide,
 required     this.disease,
required      this.soiltype,
    required  this.fertilizer});
}

class _update_flowerState extends State<update_flower> {
String id;
String name;
String  color;
String startmonth;
String endmonth;
String month;
String  season;
String growtime;
String height;
String  minheight;
String maxheight;
String  category;
String shape;
String fragrance;
String lifetime;
String altitude;
String minaltitude;
String  maxaltitude;
String  area;
String  watering;
String sunlight;
String  pesticide;
String  disease;
String soiltype;
String fertilizer;


_update_flowerState(


      this.id,
      this.name,
      this.color,
      this.startmonth,
      this.endmonth,
      this.month,
      this.season,
      this.growtime,
      this.height,
      this.minheight,
      this.maxheight,
      this.category,
      this.shape,
      this.fragrance,
      this.lifetime,
      this.altitude,
      this.minaltitude,
      this.maxaltitude,
      this.area,
      this.watering,
      this.sunlight,
      this.pesticide,
      this.disease,
      this.soiltype,
      this.fertilizer,
      );



GlobalKey<FormState> formkey = GlobalKey<FormState>();
static final TextEditingController idController = new TextEditingController();
static final TextEditingController nameController = new TextEditingController();
static TextEditingController colorController = new TextEditingController();
static TextEditingController startmonthController = new TextEditingController();
static TextEditingController endmonthController = new TextEditingController();
static final TextEditingController monthController = new TextEditingController();
static TextEditingController seasonController = new TextEditingController();
static TextEditingController growtimeController = new TextEditingController();
static TextEditingController heightController = new TextEditingController();
static TextEditingController minheightController = new TextEditingController();
static TextEditingController maxheightController = new TextEditingController();
static TextEditingController categoryController = new TextEditingController();
static TextEditingController shapeController = new TextEditingController();
static TextEditingController fragranceController = new TextEditingController();
static TextEditingController lifetimeController = new TextEditingController();
static TextEditingController altitudeController = new TextEditingController();
static TextEditingController minaltitudeController = new TextEditingController();
static TextEditingController maxaltitudeController = new TextEditingController();
static TextEditingController areaController = new TextEditingController();
static TextEditingController wateringController = new TextEditingController();
static TextEditingController sunlightController = new TextEditingController();
static TextEditingController pesticideController = new TextEditingController();
static TextEditingController diseaseController = new TextEditingController();
static TextEditingController soiltypeController = new TextEditingController();
static TextEditingController fertilizerController = new TextEditingController();





  void validate() {
    if (formkey.currentState!.validate()) {
      apiService.updateflower(
          idController.text.toString(),
        nameController.text.toString(),
        colorController.text.toString(),
        startmonthController.text.toString(),
        endmonthController.text.toString(),
        monthController.text.toString(),
        seasonController.text.toString(),
        growtimeController.text.toString(),
        heightController.text.toString(),
        minheightController.text.toString(),
        maxheightController.text.toString(),
        categoryController.text.toString(),
        shapeController.text.toString(),
        fragranceController.text.toString(),
        lifetimeController.text.toString(),
        altitudeController.text.toString(),
        minaltitudeController.text.toString(),
        maxaltitudeController.text.toString(),
        areaController.text.toString(),
        wateringController.text.toString(),
        sunlightController.text.toString(),
        pesticideController.text.toString(),
        diseaseController.text.toString(),
        soiltypeController.text.toString(),
        fertilizerController.text.toString(),);
    } else {
      print("please fill all field");
    }
  }




@override
  void initState() {
    // TODO: implement initState
    super.initState();
       idController.text=id ;
    nameController.text=name;
    colorController.text=color;
    startmonthController.text=startmonth;
    endmonthController.text=endmonth;
    monthController.text=month;
    seasonController.text=season;
     growtimeController.text=growtime;
     heightController.text=height;
    minheightController.text=minheight;
     maxheightController.text=maxheight;
     categoryController.text=category;
     shapeController.text=shape;
    fragranceController.text=fragrance;
    lifetimeController.text=lifetime;
    altitudeController.text=altitude;
    minaltitudeController.text=minaltitude;
    maxaltitudeController.text=maxaltitude;
    areaController.text=area;
    wateringController.text=watering;
    sunlightController.text=sunlight;
    pesticideController.text=pesticide;
    diseaseController.text=disease;
    soiltypeController.text=soiltype;
    fertilizerController.text=fertilizer;




}








  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar( title: Text("Update Flowers"),

          backgroundColor: AppThemeConfig.green,
        ),
        body: Form(

          key: formkey,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: 400,
                margin: EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Name',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),




                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: colorController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Color',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: startmonthController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Start Month',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: endmonthController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'End Month',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: monthController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Month',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: seasonController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Season',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      controller: growtimeController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Grow Time',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: heightController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Height',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: minheightController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Min height',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: maxheightController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Max Height',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: categoryController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Category',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: shapeController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Shape',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: fragranceController,
                      validator: emptyfield,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Fragrance',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      controller: lifetimeController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Life Time',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),




                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: altitudeController,
                      validator: emptyfield,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Altitude',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: minaltitudeController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Min Altitude',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(   keyboardType: TextInputType.number,
                      validator: emptyfield,
                      controller: maxaltitudeController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Max Altitude',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      controller: areaController,
                      validator: emptyfield,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                          labelText: 'Area',
                          labelStyle: TextStyle(color: AppThemeConfig.green)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: wateringController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Watering',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: sunlightController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Sun Light',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: pesticideController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Pesticide',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: diseaseController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Disease',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: soiltypeController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Soil Type',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ), Container(
                    width: 400,
                    height: 60,
                    child: TextFormField(
                      validator: emptyfield,
                      controller: fertilizerController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppThemeConfig.green,
                            )),
                        labelText: 'Fertilizer',
                        labelStyle: TextStyle(color: AppThemeConfig.green),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeConfig.green,
                        minimumSize: const Size(200, 40)),
                    onPressed: () {

                      setState(() {
                        validate();
                      });


                    },
                    child: const Text(
                      "Update Flowers",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? emptyfield(String? val) {
    if (val!.isEmpty) {
      return "required";
    } else {
      return null;
    }
  }
}
