import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:like_button/like_button.dart';
import 'package:reconnect_front_end/views/music_player.dart';
import 'package:reconnect_front_end/views/podcast_info.dart';

import 'home_page.dart';

class musicInfo extends StatefulWidget {
  const musicInfo({Key? key}) : super(key: key);

  @override
  State<musicInfo> createState() => _musicInfoState();
}

class _musicInfoState extends State<musicInfo> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/music.json").then((value) {
      info = jsonDecode(value);
    });
  }
  Future<bool> onLikeButtonTapped(bool isLiked) async{
    return !isLiked;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/main_back.png"),
                fit: BoxFit.fill
            ),
          ),
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          child:  Column(
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: (){
                        Get.to(()=>HomePage());
                      },

                      child: Icon(Icons.arrow_back_ios, size: 35,)
                  ),
                  Text(
                      "Tunes",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),

                  Text(
                    "Podcasts",
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                  InkWell(
                      onTap: (){
                        Get.to(()=>podcastInfo());
                      },

                      child: Icon(Icons.arrow_forward_ios, size: 22,)
                  ),
                ],
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                    boxShadow: [
                    BoxShadow(
                    blurRadius: 5,
                    offset: Offset(9, 9),
                    color: AppColor.gradientSecond
                        .withOpacity(0.5)),
                  BoxShadow(
                      blurRadius: 5,
                      offset: Offset(-9, -9),
                      color: AppColor.gradientSecond
                          .withOpacity(0.5))
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height*0.80,
                        child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                                itemCount: info.length,
                                itemBuilder: (_,i){
                                  return InkWell(
                                    onTap: (){
                                      Get.to(()=>MusicUI());
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(top: 15),
                                      width: MediaQuery.of(context).size.width,
                                      height: 80,
                                      decoration: BoxDecoration(

                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width/4,
                                            height: 70,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                image: AssetImage(info[i]['thumbnail']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 10),
                                            width: MediaQuery.of(context).size.width/1.7,
                                            decoration: BoxDecoration(

                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(height: 10,),
                                                Text(info[i]['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                                SizedBox(height: 6,),
                                                Row(
                                                    children: [
                                                      Text(info[i]['Artist'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),),
                                                      Expanded(child: Container()),
                                                      Container(
                                                        margin: EdgeInsets.only(right: 10),
                                                        child: LikeButton(
                                                          size: 21,
                                                          onTap: onLikeButtonTapped,
                                                        ),
                                                      ),
                                                    ]
                                                ),
                                                SizedBox(height: 6,),
                                                Text(info[i]['time'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),)
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                  );
                                })),
                      ),
                    ),

                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );
  }
}
