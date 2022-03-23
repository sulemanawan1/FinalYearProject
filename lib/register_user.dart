import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:plantscolorguide/services/api_service.dart';
import 'package:plantscolorguide/config/app_theme_config.dart';
import 'package:plantscolorguide/services/users_services.dart';
import 'package:plantscolorguide/user_login.dart';
final userService= Get.put(UserController());
//final userService= Get.find<UserController>();

class RegisterUser extends StatefulWidget {

  RegisterUser({Key? key}) : super(key: key);


  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
GlobalKey<FormState> formkey = new GlobalKey<FormState>();

  final apiService = Get.find<ApiService>();


TextEditingController usernameController = new TextEditingController();

TextEditingController passwordController = new TextEditingController();


List<String> roles = ["user", "admin","nuser"];



List <String> cities =["Karachi", "Lahore", "Faisalabad", "Rawalpindi", "Gujranwala", "Peshawar", "Multan", "Saidu Sharif", "Hyderabad", "Islamabad", "Quetta", "Bahawalpur", "Sargodha", "Sialkot", "Sukkur", "Larkana", "Chiniot", "Shekhupura", "Jhang", "Dera Ghazi Khan", "Gujrat", "Rahimyar Khan", "Kasur", "Mardan", "Mingaora", "Nawabshah", "Sahiwal", "Mirpur Khas", "Okara", "Mandi Burewala", "Jacobabad", "Saddiqabad", "Kohat", "Muridke", "Muzaffargarh", "Khanpur", "Gojra", "Mandi Bahauddin", "Abbottabad", "Turbat", "Dadu", "Bahawalnagar", "Khuzdar", "Pakpattan", "Tando Allahyar", "Ahmadpur", "Vihari", "Jaranwala", "New Mirpur", "Kamalia", "Kot Addu", "Nowshera", "Swabi", "Khushab", "Dera Ismail Khan", "Chaman", "Charsadda", "Kandhkot", "Chishtian", "Hasilpur", "Attock Khurd", "Muzaffarabad", "Mianwali", "Jalalpur Jattan", "Bhakkar", "Zhob", "Dipalpur", "Kharian", "Mian Channun", "Bhalwal", "Jamshoro", "Pattoki", "Harunabad", "Kahror Pakka", "Toba Tek Singh", "Samundri", "Shakargarh", "Sambrial", "Shujaabad", "Hujra Shah Muqim", "Kabirwala", "Mansehra", "Lala Musa", "Chunian", "Nankana Sahib", "Bannu", "Pasrur", "Timargara", "Parachinar", "Chenab Nagar", "Gwadar", "Abdul Hakim", "Hassan Abdal", "Tank", "Hangu", "Risalpur Cantonment", "Karak", "Kundian", "Umarkot", "Chitral", "Dainyor", "Kulachi", "Kalat", "Kotli", "Gilgit", "Narowal", "Khairpur Mir’s", "Khanewal", "Jhelum", "Haripur", "Shikarpur", "Rawala Kot", "Hafizabad", "Lodhran", "Malakand", "Attock", "Batgram", "Matiari", "Ghotki", "Naushahro Firoz", "Alpurai", "Bagh", "Daggar", "Leiah", "Tando Muhammad Khan", "Chakwal", "Badin", "Lakki", "Rajanpur", "Dera Allahyar", "Shahdad Kot", "Pishin", "Sanghar", "Upper Dir", "Thatta", "Dera Murad Jamali", "Kohlu", "Mastung", "Dasu", "Athmuqam", "Loralai", "Barkhan", "Musa Khel Bazar", "Ziarat", "Gandava", "Sibi", "Dera Bugti", "Uthal", "Khuzdar", "Chilas", "Panjgur", "Gakuch", "Qila Saifullah", "Kharan", "Aliabad", "Awaran", "Dalbandin", "sawat", "shimsal", "duki", "skardu", "naran", "Babusar Pass", "washuk"];

String cityVal="Rawalpindi";

String roleValue = "user";

  void validate ()
{
  if (formkey.currentState!.validate())
  {


setState(() {
  userService.adduser(usernameController.text.toString().trim() , passwordController.text.toString().trim(),
      cityVal , roleValue.toString().trim());
  Get.to(()=> UserLogin());


});



}else {

    print ("something went wrong user not register");

  }


}

  @override
  Widget build(BuildContext context) {
    var items;
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemeConfig.green,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome 😉",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Signup into your Account",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("images/adminlogo.png",),
              radius: 50,
            ),
            Container(
              width: 400,
              child: Form(
                key: formkey,
                  child: Column(
                children: [
                  Container(
                    width: 300,
                    child: TextFormField(      validator: emptyfield,
                      controller: usernameController,
                        decoration: InputDecoration(
                            labelText: 'Username',
                            icon: Icon(Icons.person),
                            hintText: "Enter username")),
                  ),
                  Container(
                    width: 300,
                    child: TextFormField(obscureText: true,
                      validator: emptyfield,
                      controller: passwordController,
                        decoration: InputDecoration(
                            labelText: 'Password',
                            icon: Icon(Icons.password),
                            hintText: "Enter Password")),
                  ), SizedBox(height: 10,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.place,color: Colors.green,),
                      SizedBox(width: 20,),
                      Text("Select the City",style: TextStyle(fontSize: 20,color: Colors.green,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Container(
                   child:     DropdownButton(
                     value: cityVal,
                     icon: Icon(Icons.keyboard_arrow_down),
                     items: cities.map((String item) {
                       return DropdownMenuItem(
                           value: item, child: Text(item.toString()));
                     }).toList(),
                     onChanged: (String? newValue) {
                       setState(() {
                         cityVal = newValue!;
                       });

                       print(cityVal);
                     },
                   ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[


                      Text("Roles",style: TextStyle(fontSize: 18,color: Colors.green,fontWeight: FontWeight.bold),),
                      DropdownButton(
menuMaxHeight:100,
                      value: roleValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: roles.map((String item) {
                        return DropdownMenuItem(value: item, child: Text(item));
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          roleValue = newValue!;
                        });

                        print(roleValue);
                      },
                    ),]

                  ),

                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: const Size(250, 40),
                      ),
                      onPressed: () {
                        setState(() {
                          validate();

                        });


                      },
                      child: Text('Create an Account')),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already Register?"),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: (){

                          Get.toNamed('/UserLogin');
                        },
                        child: Text(
                          "Login Here",
                          style: TextStyle(color: AppThemeConfig.green,fontSize: 15),
                        )
                      )
                    ],
                  ),Text("$roleValue"),
                ],
              )),
            )
          ]),
        ),
      ),
    );
  }
}



String? emptyfield(String? val) {
  if (val!.isEmpty) {
    return "required";
  } else {
    return null;
  }
}