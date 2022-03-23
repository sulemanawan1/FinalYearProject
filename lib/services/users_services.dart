import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:plantscolorguide/nursery.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:http/http.dart' as http;
import '../admin_panel.dart';
import '../main_screen.dart';
final apiService= Get.put(ApiService());
Dio dio = new Dio();
class UserController {

  List? user = [];


  Future<List> UsersList(int userid) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/user/userslist?id=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }


  Future<List?> getUser(String username, String password) async {
    http.Response response1;
    List user;

    try {
      response1 = await http.get(Uri.parse(
          "http://${apiService
              .ip}/flowers/api/user/loginuser?username=${username}&password=${password}"));

      if (response1.statusCode == 200) {
        print(username);
        print(password);
        print(response1.body);
        user = jsonDecode(response1.body);
        print(user);
        print(user[0]['role']);
        if (user[0]['role'].toString().trim() == 'user') {
          Get.to(() => MainScreen(user: user,));
        }
        else if (user[0]['role'].toString().trim() == "admin") {
          Get.to(AdminPanel());
        }
        else if (user[0]['role'].toString().trim() == "nuser") {
          Get.to(Nursery(    user: user,   ));
        }
      }
      else if (response1.statusCode == 404) {
        Get.snackbar(
            "Login Failed ", "please register your self to our system !");
      } else {
        user = jsonDecode(response1.body);
        print("login failed");

        return user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future adduser(String username, String password, String city,
      String roles) async {
    final String url = "http://${ apiService.ip}/flowers/api/user/adduser";
    var response;
    try {
      dynamic myli = {
        "username": username,
        "password": password,
        "role": roles,
        "city": city
      };
      response = await dio.post(url,
          data: myli,
          options: Options(
            headers: {'Content-Type': 'application/json; charset=UTF-8'},
          ));
      if (response.statusCode == 200) {
        print("user register");
        print(response.statusCode);
        return response.statusCode;
      }
      print('registration failed');
    } on Exception catch (exp) {
      print('registration failed' + exp.toString());
    }
  }


  Future sendrequest(int sender,
      int reciever,) async {
    final String url = "http://${apiService.ip}/flowers/api/user/sendrequest";
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
        "http://${apiService.ip}/flowers/api/user/GetSendRequest?userid=${userid}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }




  Future Friends(int friend1,
      int friend2,) async {
    final String url = "http://${apiService.ip}/flowers/api/user/friends";
    try {
      dynamic myli = {

        "friend1": friend1,
        "friend2": friend2
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

///// Admin Search Query /////


  Future<List> SearchQuery(String query) async {
    http.Response response;
    List data;

    response =
    await http.get(Uri.parse(
        "http://${apiService.ip}/flowers/api/user/AdminSearch?query=${query}"));
    data = jsonDecode(response.body);
    print(data);

    return data;
  }









}

