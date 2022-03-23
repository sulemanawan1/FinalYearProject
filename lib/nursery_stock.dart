import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/add_nursery_stock.dart';
import 'package:plantscolorguide/services/nursery_service.dart';

final nurseryservice= Get.put(NurseryService());
class NurseryStock extends StatefulWidget {
  int? nid;
  int? userid;
  NurseryStock({required this.nid,required this.userid});

  @override
  State<NurseryStock> createState() => _NurseryStockState(nid,userid);
}

class _NurseryStockState extends State<NurseryStock> {
late Future  _list;
  TextEditingController seedlingquantity= new TextEditingController();
  TextEditingController subseedlingquantity= new TextEditingController();
  int? nid;
  int? id;
  int? fid;
  int? flowerquantity;
  int? userid;


  _NurseryStockState(nid,userid)

  {
    this.nid=nid;
    this.userid=userid;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _list=nurseryservice.NurseryFlowerQuantity(userid!, nid!);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(
        appBar: AppBar(title: Text('Nursery Stock'),
            leading: GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Get.back();
              },
            ),
            backgroundColor: Colors.green,
            actions: [Row(children: [ Text("Add Stock",style: TextStyle(fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                print(nid);
Get.to(AddNurseryStock(nid: nid!,));

              }, icon: Icon(Icons.add),color: Colors.white,)],),
            ]),

      body: Column(children: [FutureBuilder(
          future:_list,

          builder: (BuildContext context, AsyncSnapshot snapshot) {


            if (snapshot.hasData) {



              return  Expanded(

                child: Container( height: 400,
                  child: ListView.builder(itemCount:snapshot. data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                trailing:


                                    Container(width: 200,

                                      child: Row(
mainAxisAlignment:     MainAxisAlignment.spaceAround,
                                      children: [

                                      ElevatedButton(onPressed: (){
setState(() {
  Get.defaultDialog(
      title: ' how many seedling you want ?',content:
  Container(

      width: 200,
      child:Column(children: [

        TextField(

          decoration: InputDecoration(



          ),
          controller: seedlingquantity,
          keyboardType:TextInputType.number ,
        ),SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(onPressed: (){

              setState(() {



                fid=snapshot.data[index]['fid'];
                id=snapshot.data[index]['id'];
                flowerquantity=snapshot.data[index]['flowerquantity'];
                int count;
                print( flowerquantity);
                print(nid);
                print(fid);
                print(seedlingquantity.text);
                print(id);
                count=   int.parse(seedlingquantity.text);
                _list=     nurseryservice.addseedlingstock(nid!, fid!,flowerquantity!,id! ,count);
                seedlingquantity.text="";
              });



              Get.back();
              Get.snackbar("e","${seedlingquantity.text}"+"add to stock");


            }, child:Text("purchase"),style: ElevatedButton.styleFrom(

                primary: Colors.green

            ),),SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              Get.back();
            }, child:Text("Cancel "),style: ElevatedButton.styleFrom(

                primary: Colors.grey

            ),)],),


      ],))


  );

});


                                      }, child: Text("purchase"),style: ElevatedButton.styleFrom(primary: Colors.green),),

                                      ElevatedButton(onPressed: (){

setState(() {
  Get.defaultDialog(
      title: ' how many seedling you want to sale?',content:
  Container(

      width: 200,
      child:Column(children: [

        TextField(

          decoration: InputDecoration(



          ),
          controller: subseedlingquantity,
          keyboardType:TextInputType.number ,
        ),SizedBox(height: 10,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [ ElevatedButton(onPressed: (){

            print( flowerquantity);
            print(nid);
            print(fid);
            print(subseedlingquantity.text);
            print(id);

            setState(() {

              fid=snapshot.data[index]['fid'];
              id=snapshot.data[index]['id'];
              flowerquantity=snapshot.data[index]['flowerquantity'];
              int count;
              count=   int.parse(subseedlingquantity.text);
              _list=nurseryservice.subseedlingstock(nid!, fid!, flowerquantity!, id!, count);

              subseedlingquantity.text="";


            });

            Get.back();
            Get.snackbar("⛔","${seedlingquantity.text}"+"sale");



          }, child:Text("sale"),style: ElevatedButton.styleFrom(

              primary: Colors.redAccent

          ),),SizedBox(width: 20,),
            ElevatedButton(onPressed: (){
              Get.back();
            }, child:Text("Cancel "),style: ElevatedButton.styleFrom(

                primary: Colors.grey

            ),)],),


      ],))


  );
});





                                      }, child: Text("sale"),style: ElevatedButton.styleFrom(primary: Colors.redAccent),),

                                    ],),),



                                leading: Icon(Icons.local_florist,color: Colors.lightGreen ,size: 60,),
                                title:  Text('${snapshot.data[index]['name']}'),
                                subtitle: Text( 'Seedlings Quanity'   +           '         '
                                    ' ${snapshot.data[index]['flowerquantity']}'),
                              ),

                            ],
                          ),
                        );
                      }),
                ),
              );
            } else if (snapshot.hasError) {
              return Icon(Icons.error_outline);
            } else {
              return CircularProgressIndicator();
            }
          }),],),),);;
  }
}
