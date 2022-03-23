import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;
import 'api_service.dart';
import 'friends_services.dart';
final apiService= Get.find<ApiService>();
class NurseryService {

  Future addnursery(String nname,
      String naddress,
      String ncontact,
      int userid) async {
    final String url = "http://${apiService.ip}/flowers/api/nursery/addnursery";
    try {
      dynamic myli = {
        "nname": nname,
        "naddress": naddress,
        "ncontact": ncontact,
        "userid": userid
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


  Future addnurserystock(int nid,
      int fid,
      String quantity,) async {
    final String url = "http://${apiService
        .ip}/flowers/api/nursery/addnurserystock";
    try {
      dynamic myli = {
        "nid": nid,
        "fid": fid,
        "flowerquantity": int.parse(quantity)
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












  Future<List> AllNurseries(int userid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService
            .ip}/flowers/api/nursery/allnurseries?userid=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }





  Future<List> FlowerAvailibility(int fid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService
            .ip}/flowers/api/nursery/ShowAllNursery?fid=${fid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }









  Future<List> NurseryFlowerQuantity(int userid, int nid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService
            .ip}/flowers/api/nursery/nurseryflowerquantity?userid=${userid}&nid=${nid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }


  Future <List?> addseedlingstock(int nid, int fid, int flowerquantity, int id,
      int count) async {
    final String url = "http://${apiService
        .ip}/flowers/api/nursery/AddSeedlingStock?count=${count}";
    try {
      List data = [];
      dynamic myli =

      {"nid": nid,
        "fid": fid,
        "flowerquantity": flowerquantity,
        "id": id
      };
      var response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      print('iam here');
      data = response.data;
      print(data);
      print(response.statusMessage.toString());
      return data;
    } catch (exp) {
      print(exp);
    }
  }


  Future <List?> subseedlingstock(int nid, int fid, int flowerquantity, int id,
      int count) async {
    final String url = "http://${apiService
        .ip}/flowers/api/nursery/subSeedlingStock?count=${count}";
    try {
      List data = [];
      dynamic myli =

      {"nid": nid,
        "fid": fid,
        "flowerquantity": flowerquantity,
        "id": id
      };
      var response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      print('iam here');
      data = response.data;
      print(data);
      print(response.statusMessage.toString());
      return data;
    } catch (exp) {
      print(exp);
    }
  }


}
