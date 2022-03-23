
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/nursery_display.dart';
import 'package:plantscolorguide/nursery_stock.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/services/nursery_service.dart';

final apiservice= Get.put(ApiService());
final nurseryservice= Get.put(NurseryService());
class AddNurseryStock extends StatefulWidget {

  int nid;

 AddNurseryStock({required this.nid});












  @override
  State<AddNurseryStock> createState() => _AddNurseryStockState(nid);
}

class _AddNurseryStockState extends State<AddNurseryStock> {

  int? nid;
  int? fid;
String? quantity;

int count=0;

  final  List<TextEditingController> _controllers = [];

  Future? list;

  _AddNurseryStockState(nid)
  {
    this.nid=nid;
    list=apiservice.getData();



  }




  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme:ThemeData(),
        home: Scaffold(
          appBar: AppBar(title: Text('Add Stock'),
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.back();
              },
            ),
              backgroundColor: Colors.green, ),
    body: FutureBuilder(
    future: list,
    builder: (BuildContext context, AsyncSnapshot snapshot) {

    if (snapshot.hasData) {
    return ListView.builder(   itemCount:snapshot.data.length,itemBuilder: (context,index) {
      _controllers.add(new TextEditingController());
      return Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
           ListTile(
             trailing: ElevatedButton(
                 style: ElevatedButton.styleFrom(primary: Colors.green),
                 onPressed: (){

                   // Get.to(()=>NurseryStock(nid: ni,));


fid=snapshot.data[index]['id'];
quantity=_controllers[index].text;
print(nid);
print(fid);
print(_controllers[index].text);

nurseryservice.addnurserystock(nid!, fid!, quantity!);

                 }, child: Text("ADD")),
              leading: Icon(Icons.local_florist,color: Colors.lightGreen ,size: 50,),
              title:  Text('${snapshot.data[index]['name']}'),
              subtitle: Container(width: 20,
                  child: TextFormField(

                    controller: _controllers[index],

                      decoration: InputDecoration(labelText: 'Enter Seedling  Quantity',
                          hintText: "Quantity"))),
            ),

          ],
        ),
      );
    });
    } else if (snapshot.hasError) {
    return Icon(Icons.error_outline);
    } else {
    return CircularProgressIndicator();
    }
    })
    ));
  }
}
