import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  List? mydata = [];
  List? user = [];
  String? fileName;
  String ip ="192.168.0.103";

  Dio dio = new Dio();



//GET ALL FLOWERS DATA
  Future<List> getDataWithCity(String city) async {
    print(city);
    http.Response response;
    List data;

    response = await http.get(Uri.parse(
        "http://${ip}/flowers/api/flower/allflowersbycity?area=${city}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }

  //GET ALL FLOWERS DATA
  Future<List> getData() async {
    http.Response response;
    List data;

    response =
        await http.get(Uri.parse("http://${ip}/flowers/api/flower/allflowers"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }

  Future<List> search(String q) async {
    http.Response response;
    List data;

    response = await http
        .get(Uri.parse("http://${ip}/flowers/api/flower/search?q=${q}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }

  Future<List> deleteData(int id) async {

    http.Response response;
    List data;
    response = await http.get(
        Uri.parse("http://${ip}/flowers/api/flower/deleteflower?id=${id}"));

print("iam here");
      data = jsonDecode(response.body) ;
    print(data);
      return data;

  }


  // Post Image
  void upload(String name,
      String color,
  String startmonth,
      String endmonth,
  String month,
      String season,
  String growtime,
      String height,
  String minheight,
      String maxheight,
  String category,
      String shape,
  String fragrance,
      String lifetime,
  String altitude,
      String minaltitude,
  String maxaltitude,
      String area,
  String watering,
      String sunlight,
  String pesticide,
      String disease,
  String soiltype,
      String fertilizer,File file) async {

    var request =  http.MultipartRequest(
        'POST', Uri.parse("http://${ip}/flowers/api/image/UploadFiles")

    );
    fileName = file.path.split('/').last;

    request.fields['name'] = name;
    request.fields['color'] = color;
    request.fields['startmonth'] = startmonth;
    request.fields['endmonth'] =endmonth;
    request.fields['month'] = month;
    request.fields['season'] = season;
    request.fields['growtime'] = growtime;
    request.fields['height'] = height;
    request.fields['minheight'] = minheight;
    request.fields['maxheight'] = maxheight;
    request.fields['category'] = category;
    request.fields['shape'] = shape;
    request.fields['fragrance'] = fragrance;
    request.fields['lifetime'] = lifetime;
    request.fields['altitude'] = altitude;
    request.fields['minaltitude'] =  minaltitude;
    request.fields['maxaltitude'] = maxaltitude;
    request.fields['area'] = area;
    request.fields['watering'] = watering;
    request.fields['sunlight'] = sunlight;
    request.fields['pesticide'] = pesticide;
    request.fields['disease'] = disease;
    request.fields['soiltype'] = soiltype;
    request.fields['fertilizer'] =fertilizer;
    request.fields['status'] ;






    request.files.add(await http.MultipartFile.fromPath(
        'ImagePaths',
        file.path
    )
    );



    var response = await request.send();


    final res = await http.Response.fromStream(response);
    print(res.body);




  }

  Future fetchflowers() async {
    print("fetching data");
     mydata = await getData();
    Get.toNamed('/UserLogin');
    print(mydata);

  }

  //update flowers

  Future updateflower(
      String id,
      String name,
      String color,
      String startmonth,
      String endmonth,
      String month,
      String season,
      String growtime,
      String height,
      String minheight,
      String maxheight,
      String category,
      String shape,
      String fragrance,
      String lifetime,
      String altitude,
      String minaltitude,
      String maxaltitude,
      String area,
      String watering,
      String sunlight,
      String pesticide,
      String disease,
      String soiltype,
      String fertilizer) async {
    final String url = "http://${ip}/flowers/api/flower/updateflower";
    try {
      dynamic myli = {
        "id": int.parse(id),
        "name": name,
        "color": color,
        "startmonth": int.parse(startmonth),
        "endmonth": int.parse(endmonth),
        "month": month,
        "season": season,
        "growtime": growtime,
        "height": height,
        "minheight": int.parse(minheight),
        "maxheight": int.parse(maxheight),
        "category": category,
        "shape": shape,
        "fragrance": fragrance,
        "lifetime": int.parse(lifetime),
        "altitude": altitude,
        "minaltitude": int.parse(minaltitude),
        "maxaltitude": int.parse(maxaltitude),
        "area": area,
        "watering": watering,
        "sunlight": sunlight,
        "pesticide": pesticide,
        "disease": disease,
        "soiltype": soiltype,
        "fertilizer": fertilizer,
      };
      var response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      print(response.statusMessage.toString());
      return response.statusCode;
    } catch (exp) {
      print(exp);
    }
  }
}
