import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/books_main.dart';
import 'package:reconnect_front_end/views/home_page.dart';

import 'package:like_button/like_button.dart';
import 'package:reconnect_front_end/views/music_player.dart';

class Sleep_stories extends StatefulWidget {
  const Sleep_stories({Key? key}) : super(key: key);

  @override
  State<Sleep_stories> createState() => _Sleep_storiesState();
}

class _Sleep_storiesState extends State<Sleep_stories> {
  List info = [];
  List info2 = [];
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/sleep_recommended.json")
        .then((value) {
      info = jsonDecode(value);
    });
    DefaultAssetBundle.of(context)
        .loadString("json/new_sleep.json")
        .then((value) {
      info2 = jsonDecode(value);
    });
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
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
        backgroundColor: Color(0xffF6F6F6),
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/backgrounds/main_back.png"),
                  fit: BoxFit.fill
              ),
            ),
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.to(() => HomePage());
                        },
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 35,
                        )),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColor.homePageTitle,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Text(
                      "Continue Last Read",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColor.homePageTitle),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 180,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/backgrounds/sleep_back.png"),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 12),
                        height: MediaQuery.of(context).size.height / 10,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            color: Color(0xffFFFFFF),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 10, left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "When the Stars Wrote Back",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          "Trista Mateer",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 10),
                                            child: Text(
                                              "12hrs left",
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: InkWell(
                                onTap: (){
                                  Get.to(() => MusicUI());
                                },
                                child: Icon(
                                  Icons.play_arrow,
                                  size: 30,
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text(
                    "Recommended",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.homePageTitle),
                  ),
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 250,
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.14,
                          height: 240,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: info.length,
                              itemBuilder: (_, i) {
                                return InkWell(
                                  onTap: (){
                                    Get.to(() => MusicUI());
                                  },
                                  child: InkWell(
                                    // onTap: () {
                                    //   Get.to(() => Book_main());
                                    // },
                                    child: Container(
                                      margin: EdgeInsets.only(right: 10),
                                      width: MediaQuery.of(context).size.width /
                                          2.3,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                7,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    info[i]['thumbnail']),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 5, right: 5),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 110,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            top: 10, left: 5),
                                                        child: Text(
                                                          info[i]['title'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700),
                                                        )),
                                                    Expanded(
                                                        child: Container()),
                                                    Container(
                                                      margin: EdgeInsets.only(
                                                          top: 10),
                                                      alignment:
                                                          Alignment.center,
                                                      child: LikeButton(
                                                        size: 25,
                                                        onTap:
                                                            onLikeButtonTapped,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 10, left: 5),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    "Anonymonus",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      top: 5, left: 5),
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 18,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  child: Text(
                                                    "${info[i]['time']} hrs",
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        )
                      ],
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(children: [
                  Text(
                    "New",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: AppColor.homePageTitle),
                  ),
                ]),
                Container(
                    width: MediaQuery.of(context).size.width,
                    constraints: BoxConstraints(
                      maxHeight: double.infinity,
                    ),
                    margin: EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                      color: Color(0xffF6F6F6),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: 390,
                          child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                                itemCount: info.length,
                                itemBuilder: (_, i) {
                                  return InkWell(
                                    onTap: (){
                                      Get.to(() => MusicUI());
                                    },
                                    child: InkWell(
                                      // onTap: () {
                                      //   Get.to(() => Book_main());
                                      // },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        height: 250,
                                        decoration: BoxDecoration(
                                          color: Color(0xffFFFFFF),
                                          borderRadius: BorderRadius.circular(15)
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 15),
                                              height: 220,
                                              width: MediaQuery.of(context).size.width / 2.6,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      info2[i]['thumbnail']),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width/2.8,
                                              decoration: BoxDecoration(
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Container(
                                                          width: MediaQuery.of(context).size.width / 4,
                                                          margin: EdgeInsets.only(top: 20, left: 8),
                                                          child: Text(info2[i]['title'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                                                          )
                                                      ),
                                                      Expanded(child: Container()),
                                                      LikeButton(size: 20,)
                                                    ],
                                                  ),
                                                  Container(
                                                      width: MediaQuery.of(context).size.width / 4,
                                                      margin: EdgeInsets.only(top: 5, left: 8),
                                                      child: Text(info2[i]['Artist'], style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                                                      )
                                                  ),
                                                  Container(
                                                      width: MediaQuery.of(context).size.width / 3,
                                                      margin: EdgeInsets.only(top: 9, left: 8),
                                                      child: Text(info2[i]['Description'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
                                                      )
                                                  ),
                                                  Container(
                                                      width: MediaQuery.of(context).size.width / 4,
                                                      margin: EdgeInsets.only(top: 15, left: 8),
                                                      child: Text("${info2[i]['time']} Hrs", style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
                                                      )
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        )
                      ],
                    )),
                SizedBox(height: 20,)
              ],
            ),
          ),
        ));
  }
}
