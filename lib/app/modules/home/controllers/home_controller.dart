import 'package:get/get.dart';
import 'package:homeward/app/modules/home/provider/home.dart';

class HomeController extends GetxController with StateMixin<List<dynamic>>{
  //TODO: Implement HomeController

  final count = 0.obs;

  @override
  void onInit() {
    PostProvider().getPosts().then((value) => {
      change(value, status: RxStatus.success())
    },
    onError: (err){
      change(null, status: RxStatus.error());
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;
}
