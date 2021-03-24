import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/state_manager.dart';
import 'package:homeward/app/data/Theme.dart';

class HomeDetailScreen extends GetView {
  final String title;
  final String imageUrl;
  final String date;
  HomeDetailScreen({this.title, this.imageUrl, this.date});
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
        body: Stack(
      children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(imageUrl),
                    fit: BoxFit.cover))),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                   right: 16.0, top: 16.0, ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
              
                children: [
                 Spacer(),
                  Container(
                      child: Center(
                          child: Column(
                           
                    children: [
                  
                      Container(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text.rich(TextSpan(
                                text:title,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 67,
                                    fontWeight: FontWeight.w600),
                                children: <InlineSpan>[
                                  WidgetSpan(
                                      child: Container(
                                          padding: EdgeInsets.all(2.0),
                                          margin: EdgeInsets.fromLTRB(
                                              0.0, 0.0, 0, 50.0),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(4.0),
                                              color: NowUIColors.black),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 0,
                                                bottom: 0,
                                                left: 4,
                                                right: 4),
                                            child: Text("Hot",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 19,
                                                )),
                                          ))),
                                ])),
                          ))
                    ],
                  ))),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                          "Published on $date",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: NowUIColors.white,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                     
                      SizedBox(height: 96.0),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ));
    
  }
}
