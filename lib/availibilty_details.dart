
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AvailibiltyDetails extends StatefulWidget {
 List? nursery;
 int? index;

 AvailibiltyDetails({required this.nursery,required this.index});



  @override
  _AvailibiltyDetailsState createState() => _AvailibiltyDetailsState(nursery,index);
}

class _AvailibiltyDetailsState extends State<AvailibiltyDetails> {
  List? nursery;
  int? index;
  _AvailibiltyDetailsState(nursery,index)
  {


    this.nursery=nursery;
    this.index=index;
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(appBar: AppBar(

backgroundColor: Colors.green,

      ),


      body: Center(
        child: Container(

          width: 400,
          height: 400,

          child: Column(mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Text("Nursery Information",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),),
Divider(height: 20,color:Colors. grey,thickness: 0.2,),
SizedBox(height: 18,),
Row(

  children: [SizedBox(width: 18,) ,Icon(Icons.info,size: 18,), SizedBox(width: 18,)    ,       Text("${nursery![index!]['name']}",style: TextStyle(fontSize: 18),),],),
Row(  children: [SizedBox(width: 18,) ,Icon(Icons.local_florist,size: 18,),SizedBox(width: 18,) , Text("${nursery![index!]['flowerquantity']}" ,style: TextStyle(fontSize: 18) ,textAlign: TextAlign.left, ),],),
Row(  children: [SizedBox(width: 18,) ,Icon(Icons.place,size: 18,), SizedBox(width: 18,) ,Text("${nursery![index!]['naddress']}",style: TextStyle(fontSize: 18)   ,textAlign: TextAlign.left),],),
Row(children: [SizedBox(width: 18,) ,Icon(Icons.store,size: 18,),SizedBox(width: 18,) , Text("${nursery![index!]['nname']}",style: TextStyle(fontSize: 18)   ,textAlign: TextAlign.center),],),
Row(  children: [SizedBox(width: 18,) ,Icon(Icons.call,size: 18,),SizedBox(width: 18,) , Text("${nursery![index!]['ncontact']}",style: TextStyle(fontSize: 18),textAlign: TextAlign.center),],),

    ]


          )

          ,),
      ),


      ) );
  }
}
