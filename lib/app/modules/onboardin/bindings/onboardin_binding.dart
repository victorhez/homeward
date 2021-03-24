import 'package:get/get.dart';

import 'package:homeward/app/modules/onboardin/controllers/onboardin_controller.dart';

class OnboardinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardinController>(
      () => OnboardinController(),
    );
  }
}
