import 'package:homeward/app/modules/onboardin/views/onboardin_view.dart';
import 'package:homeward/app/modules/onboardin/bindings/onboardin_binding.dart';
import 'package:homeward/app/modules/login/views/login_view.dart';
import 'package:homeward/app/modules/login/bindings/login_binding.dart';
import 'package:homeward/app/modules/home/views/home_view.dart';
import 'package:homeward/app/modules/home/bindings/home_binding.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  
static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME, 
      page:()=> HomeView(), 
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.LOGIN, 
      page:()=> LoginView(), 
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.ONBOARDIN, 
      page:()=> OnboardinView(), 
      binding: OnboardinBinding(),
    ),
  ];
}