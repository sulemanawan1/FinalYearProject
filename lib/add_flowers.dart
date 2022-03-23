import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'services/api_service.dart';
final apiService = Get.put(ApiService());

class add_flower extends StatefulWidget {
  @override
  State<add_flower> createState() => _add_flowerState();
}

class _add_flowerState extends State<add_flower> {



  File _image = File("");

  String? path = "";
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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


  Future getImageFromGallery() async {
    final picker = await ImagePicker();

    var _pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50, // <- Reduce Image quality
        maxHeight: 500, // <- reduce the image size
        maxWidth: 500);
    if (_pickedFile != null) {
      setState(() {
        path = _pickedFile.name;
      });

      _image = File(_pickedFile.path);
      print(path);
    } else {
      print("no image selected form gallery");
    }
  }

  void validate() {
    if (formkey.currentState!.validate()) {
      print("flower add successfully");



      apiService.upload(   nameController.text.toString(),
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
          fertilizerController.text.toString(),_image);

    } else {
      print("please fill all field");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(Icons.arrow_back)),
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                    child: TextFormField(
                      keyboardType: TextInputType.number,
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
                  Container(width: 400, height: 60, child: Text('${path}')),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeConfig.green,
                        minimumSize: const Size(200, 40)),
                    onPressed: () async {
                      await getImageFromGallery();
                    },
                    child: const Text(
                      "Pick Image",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: AppThemeConfig.green,
                        minimumSize: const Size(200, 40)),
                    onPressed: () {
                      validate();
                      print(nameController.text);print(startmonthController.text);
                    },
                    child: const Text(
                      "Add Flowers",
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
