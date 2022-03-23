import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'api_service.dart';

class FilterService

{
  List? data=[];
  final apiService = Get.find<ApiService>();






  Future<List?> compundsearch(String colorval,String monthval ,String categoryval,int minaltitudeValue,int maxaltitudeValue

      ,int minHeight,int maxHeight) async {

    print(colorval);
    print(monthval);
    print(categoryval);
    print(minaltitudeValue);
    print(maxaltitudeValue);
    print(minHeight);
    print(maxHeight);
    http.Response response1;

    try {
      response1 = await http.get(Uri.parse(
          "http://${apiService.ip}/flowers/api/flower/searchbycolors?color=${colorval}&minaltitude=${minaltitudeValue}&maxaltitude=${maxaltitudeValue}&category=${categoryval}&minheight=${minHeight}&maxheight=${maxHeight}"));
      if (response1.statusCode == 200) {

        data=jsonDecode(response1.body);
        print("im here");
        print(data);
        return data;
      }
      else if (response1.statusCode == 404 ) {
        Get.snackbar(
            "Filter error  ", " error occur in search by color filter   ");
      } else {
        data = jsonDecode(response1.body);

        return data;
      }
    } catch (e) {
      print(e);
    }
  }




}