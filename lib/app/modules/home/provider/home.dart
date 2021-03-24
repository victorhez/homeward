 import 'package:get/get_connect.dart';
import 'package:homeward/app/data/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
class PostProvider extends GetConnect{
  
Future<List<dynamic>> getPosts() async {
    String url = BASEURL + BLOG;
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString("token");
    final response = await get(url, headers: {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    });
    if (response.status.hasError) {
      return Future.error(response.statusText);
    } else {
      final _res = response.body;
     
      
      return _res;
    }
  }
}