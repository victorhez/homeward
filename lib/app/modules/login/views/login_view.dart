import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeward/app/data/Theme.dart'; 
import 'package:homeward/app/modules/login/controllers/login_controller.dart';
import 'package:homeward/app/modules/login/provider/login.dart';
import 'package:homeward/app/widgets/input.dart';
import 'package:homeward/app/widgets/navbar.dart';

class LoginView extends GetView<LoginController> {
   final double height = Get.height;
  TextEditingController _email = new TextEditingController();
  final formKey = GlobalKey<FormState>();
  TextEditingController _password = new TextEditingController();

  @override
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          transparent: true,
          title: "",
          reverseTextcolor: true,
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imgs/register-bg.png"),
                      fit: BoxFit.cover)),
            ),
            SafeArea(
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16.0, right: 16.0, bottom: 32),
                  child: Card(
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.60,
                          color: NowUIColors.bgColorScreen,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 24.0, bottom: 8),
                                      child: Center(
                                          child: Text("Sign In",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600))),
                                    ),
                                    SizedBox(height: 30,),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Input(
                                              placeholder: "Email...",
                                              controller: _email,
                                              password: false,
                                              prefixIcon:
                                                  Icon(Icons.email, size: 20)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0,
                                              left: 8.0,
                                              right: 8.0,
                                              bottom: 0),
                                          child: Input(
                                              password: true,
                                              placeholder: "Password...",
                                              controller: _password,
                                              
                                              prefixIcon:
                                                  Icon(Icons.lock, size: 20)),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 30,),
                                    Center(
                                      // ignore: deprecated_member_use
                                      child: RaisedButton(
                                        textColor: NowUIColors.white,
                                        color: NowUIColors.primary,
                                        onPressed: () {
                                          // Respond to button press
                                          if(formKey.currentState.validate()){
                                            LoginProvider().login(email: _email.toString(), password: _password.toString());
                                          }
                                         
                                        },
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32.0),
                                        ),
                                        child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 32.0,
                                                right: 32.0,
                                                top: 12,
                                                bottom: 12),
                                            child: Text("Get Started",
                                                style:
                                                    TextStyle(fontSize: 14.0))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))),
                ),
              ]),
            )
          ],
        ));
  }
}
  