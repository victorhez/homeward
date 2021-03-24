import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:homeward/app/data/Theme.dart';
import 'package:homeward/app/modules/home/controllers/home_controller.dart';
import 'package:homeward/app/modules/home/provider/home.dart';
import 'package:homeward/app/modules/home/views/detail.dart';
import 'package:homeward/app/widgets/card-square.dart';
import 'package:homeward/app/widgets/navbar.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Navbar(
          title: "Home",
          searchBar: true,
          categoryOne: "Landlord",
          categoryTwo: "Tenants",
        ),
        backgroundColor: NowUIColors.bgColorScreen,
        body: Container(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: FutureBuilder(
                future: PostProvider().getPosts(),
                builder: (context, snapshot) {
                  return controller.obx((data) => data.length == 0
                      ? Center(
                          child: Text("No Data yet"),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          padding: EdgeInsets.only(top: 10),
                          itemBuilder: (_, index) {
                            return Padding(
                                padding: const EdgeInsets.only(bottom: 32.0),
                                
                              child:  CardSquare(
                                    cta:
                                        "Published: ${data[index]['createdAt'].toString().substring(0, 10)}",
                                    title: data[index]['title']
                                        .toString()
                                        .capitalize,
                                    img: data[index]['imageUrl'],
                                    tap: () {
                                       Get.to(HomeDetailScreen(
                                  title: data[index]['title']
                                      .toString()
                                      .capitalize,
                                  date: data[index]['createdAt']
                                      .toString()
                                      .substring(0, 10),
                                  imageUrl: data[index]['imageUrl'].toString(),
                                ));
                                    }),
                              )
                            ;
                          }));
                })));
  }
}
