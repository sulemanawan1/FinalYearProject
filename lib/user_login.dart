import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plantscolorguide/services/users_services.dart';
import 'services/api_service.dart';
import 'config/app_theme_config.dart';
// final userservice= Get.find<UserController>();
final apiservice = Get.put(ApiService());
final userservice = Get.put(UserController());


class UserLogin extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  UserLogin({Key? key}) : super(key: key);
  void validate() {
    if (formkey.currentState!.validate()) {
      userservice.getUser(usernameController.text.toString(),
          passwordController.text.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: AppThemeConfig.green,
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Center(
                child: Form(
                  key: formkey,
                  child: Column(
                    children: [
                      Text(
                        "Welcome Back",
                        style: TextStyle(fontSize: 30),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        child: Icon(
                          Icons.account_circle_sharp,
                          size: 100,
                          color: AppThemeConfig.green,
                        ),
                      ), SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        height: 80,
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "required";
                            } else {
                              return null;
                            }
                          },
                          controller: usernameController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                              labelText: 'User Name',
                              hintText: 'User Name'),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: 300,
                        height: 80,
                        child: TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "required";
                            } else {
                              return null;
                            }
                          },
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: AppThemeConfig.green,
                              )),
                              labelText: 'Password',
                              hintText: 'password'),
                        ),
                      ),

                      SizedBox(
                        height: 5,
                      ),
                      Text("Forgot Password?"),
                      SizedBox(
                        height: 5,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: AppThemeConfig.green,
                            minimumSize: const Size(300, 40)),
                        onPressed: () {


                          validate();
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),  Divider(height:20,) ,
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New User? "),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.toNamed('/RegisterUser');
                              },
                              child: Text(
                                "Signup Here",
                                style: TextStyle(
                                    color: AppThemeConfig.green, fontSize: 15),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
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
