import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:http/http.dart' as http;


final apiService= Get.put(ApiService());
Dio dio = new Dio();

class FriendService {

  List? user = [];


  Future<List> UsersList(int userid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/userslist?id=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }







  Future sendrequest(int sender,
      int reciever,) async {
    final String url = "http://${apiService.ip}/flowers/api/friend/sendrequest";
    try {
      dynamic myli = {

        "sender": sender,
        "reciever": reciever
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


  Future<List> GetSendRequest(int userid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/GetSendRequest?userid=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }
  Future<List> GetFriends(int userid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/Getfriends?userid=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }




  Future<List> GetSendRequestCount(int userid) async {
    http.Response response;
 var data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/GetSendRequestCount?userid=${userid}"));
    data = jsonDecode(response.body) ;
    print(data);

    return data;
  }







  Future Friends(int friend1,int friend2,) async {
    final String url = "http://${apiService.ip}/flowers/api/friend/friends";
    try {
      dynamic myli = {
        "friend1": friend1,
        "friend2": friend2 };
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

  Future UnFriends(int friend1,int friend2,) async {
    final String url = "http://${apiService.ip}/flowers/api/friend/Unfriends";
    try {
      dynamic myli = {
        "friend1": friend1,
        "friend2": friend2 };
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



//////////////// Friend Plan Display ///////////////////////////







  Future<List> FriendPlanDisplay(int friendid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/FriendPlanDisplay?friendid=${friendid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }




  Future<List> FriendPlanFlowerDisplay(int pid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/friend/FriendPlanFlowerDisplay?pid=${pid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }





















}

