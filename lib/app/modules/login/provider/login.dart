import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeward/app/data/Theme.dart';
import 'package:homeward/app/data/api.dart';
import 'package:homeward/app/routes/app_pages.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends GetConnect {
  Future<String> login({
    String email,
    String password,
  }) async {
    final pref = await SharedPreferences.getInstance();
    ProgressDialog pr;
    BuildContext context = Get.context;
    pr = new ProgressDialog(
      context,
      showLogs: true,
      isDismissible: false,
    );
    pr.style(
        progressWidget: Container(
          width: 50,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        message: 'Please wait...');
    pr.show();
  

    String url = BASEURL + LOGIN;
    Map body = {
      "email": email,
      "password": password,
    };
    final response = await post(url, body);

    if (response.hasError) {
      pr.hide();
      Get.snackbar(
        "Error",
       response.statusText,
        duration: Duration(milliseconds: 5000),
        backgroundColor: NowUIColors.bgColorScreen,
        colorText: Colors.black,
      );
      return Future.error(response.statusCode);
    } else {
      pref.setString("token", response.body["token"]);

      Get.snackbar(
        "Successful",
        response.statusText,
        duration: Duration(milliseconds: 5000),
        backgroundColor: NowUIColors.bgColorScreen,
        colorText: Colors.black,
      );
      Future.delayed(Duration(milliseconds: 1000), () {
        Get.offAllNamed(Routes.HOME);
      });
      pr.hide();
    }
  }
}
