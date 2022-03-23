import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'package:plantscolorguide/services/users_services.dart';
import 'api_service.dart';
final apiService= Get.find<ApiService>();
class PlanServices

{


  Future<List> PlanFlowerDisplay(int pid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse("http://${apiService.ip}/flowers/api/plans/planflowerdisplay?pid=${pid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }













  Future<List> getData(int planby) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse("http://${apiService.ip}/flowers/api/plans/allplans?userid=${planby}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }


  Future<List> getPlan() async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse("http://${apiService.ip}/flowers/api/plans/getplans"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }







  Future<List> PlanbyMonths(int pid ) async {



    http.Response response;
    List data;

    response =
    await http.get(Uri.parse("http://${apiService.ip}/flowers/api/plans/planbymonth?pid=${pid}"));
    data = jsonDecode(response.body);

    print(data);

    return data;
  }












  Future addplans(
      String  planname,
      int userid ,
  String startmonth,

      String plantype,


      ) async {

    print(startmonth);


    final String url = "http://${apiService.ip}/flowers/api/plans/addplan";
    try {


      dynamic myli = {

          "planname": planname,
          "userid": userid,
          "startmonth": startmonth.toLowerCase(),
          "plantype": plantype,


      };



      var response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      return response.statusCode;
    } catch (exp) {
      print(exp);
    }
  }






  Future addplanflowers(
      int  pid,
      int fid ,



      ) async {




    final String url = "http://${apiService.ip}/flowers/api/plans/addplanflowers";
    try {


      dynamic myli = {

      "pid":pid,
      "fid":fid


      };



      var response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      return response.statusCode;
    } catch (exp) {
      print(exp);
    }
  }



}