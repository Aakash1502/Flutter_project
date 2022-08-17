import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/books.dart';
import 'package:reconnect_front_end/views/journal.dart';
import 'package:reconnect_front_end/views/music_info.dart';
import 'package:reconnect_front_end/views/notifications.dart';
import 'package:reconnect_front_end/views/profile.dart';
import 'package:reconnect_front_end/views/questionnaire.dart';
import 'package:reconnect_front_end/views/sleep_stories.dart';
import 'package:reconnect_front_end/views/therapist_profile.dart';
import 'package:reconnect_front_end/views/video_info.dart';
import 'package:reconnect_front_end/date_picker_time/date_picker_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      info = jsonDecode(value);
    });
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
                    onTap: (){
                      Get.to(()=>Profile());
                    },
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/user_img.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Good Afternoon", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),),
                                Text("John!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),)
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ),
                  Expanded(child: Container()),
                  InkWell(
                      onTap: (){
                        Get.to(()=>Notifications());
                      },
                      child: Icon(Icons.notifications_none_outlined, size: 35,)),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 3
                        // red as border color
                        ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.only(left: 20, top: 15, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Quote of the day",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Expanded(child: Container()),
                            Icon(
                              Icons.star_outlined,
                              size: 40,
                              color: Color(0XffFAA596),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 17, left: 25),
                          child: Text(
                            "You are enough\nA thousand times enough",
                            style: TextStyle(fontSize: 27, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  )),
              SizedBox(
                height: 30,
              ),
              Container(
                child: DatePicker(
                    DateTime.now(),
                  height: 100,
                  width: 45,
                  initialSelectedDate: DateTime.now(),
                  selectionColor: Color(0xff4A53EC),
                  activeDates: [DateTime.now()],
                )
              ),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                Text(
                  "Peace Corner",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle),
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/2.6,
                                height: 170,
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFFFF),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),

                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/home_icon/med.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(children: [
                                          Text("Meditate", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                          Expanded(child: Container()),
                                          InkWell(
                                              onTap: (){
                                                Get.to(()=>videoInfo());
                                              },
                                              child: Icon(Icons.arrow_forward_ios_rounded, size: 40,)
                                          )

                                        ] ),
                                      ),
                                      Container(
                                        child: Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text("14+ sessions", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
                                            ]),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                width: MediaQuery.of(context).size.width/2.6,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffFFFFFF),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/home_icon/music.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(children: [
                                          Text("Music", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                          Expanded(child: Container()),
                                          InkWell(
                                              onTap: (){
                                                Get.to(()=>musicInfo());
                                              },
                                              child: Icon(Icons.arrow_forward_ios_rounded, size: 40,)
                                          )

                                        ] ),
                                      ),
                                      Container(
                                        child: Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text("200+ tunes", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
                                            ]),
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 160,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffFFFFFF),
                                ),
                                margin: EdgeInsets.only(left: 10),
                                width: MediaQuery.of(context).size.width/2.6,
                                height: 170,
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/home_icon/books.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(children: [
                                          Text("Books", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                          Expanded(child: Container()),
                                          InkWell(
                                              onTap: (){
                                                Get.to(()=>Books_home());
                                              },
                                              child: Icon(Icons.arrow_forward_ios_rounded, size: 40,))

                                        ] ),
                                      ),
                                      Container(
                                        child: Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text("100+ books", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
                                            ]),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                width: MediaQuery.of(context).size.width/2.6,
                                height: 170,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xffFFFFFF),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage("assets/home_icon/sleep.png"),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        child: Row(children: [
                                          Text("Sleep Stories", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                                          Expanded(child: Container()),
                                          InkWell(
                                              onTap: (){
                                                Get.to(()=>Sleep_stories());
                                              },
                                              child: Icon(Icons.arrow_forward_ios_rounded, size: 40,))

                                        ] ),
                                      ),
                                      Container(
                                        child: Row(
                                            children: [
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text("90+ stories", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),))
                                            ]),
                                      )
                                    ],
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.book_rounded,
                      color: Colors.white,
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>Journal_home());
                      },
                      child: Container(
                          margin: EdgeInsets.only(left: 3),
                          child: Text(
                            "Journal your thoughts",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          )),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    color: Color(0xffAB87FF),
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Text(
                  "Recommendations",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle),
                ),
                Expanded(child: Container()),
                Text(
                  "View all",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle),
                ),
                Icon(Icons.keyboard_arrow_right)
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                  child: Row(
                children: [
                  Container(
                      width: (MediaQuery.of(context).size.width) / 2.5,
                      height: 240,
                      margin: EdgeInsets.only(left: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage("assets/backgrounds/recommendation_back1.png"),
                            fit: BoxFit.fill
                      ),
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Journal_home());
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Journal your \nthoughts",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Lorem ipsum...",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.black),
                                        ))
                                  ],
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.keyboard_arrow_right)
                              ])),
                        ),
                      )),
                  Container(
                      width: (MediaQuery.of(context).size.width) / 2.5,
                      height: 240,
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                           image: DecorationImage(
                             image: AssetImage("assets/backgrounds/recommendation_back2.png"),
                             fit: BoxFit.fill
                         )
                      ),
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        margin:
                            EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            Get.to(() => Sleep_stories());
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Row(children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sleep stories",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 7),
                                        child: Text(
                                          "Lorem ipsum...",
                                          style: TextStyle(
                                              fontSize: 12, color: Colors.black),
                                        ))
                                  ],
                                ),
                                Expanded(child: Container()),
                                Icon(Icons.keyboard_arrow_right)
                              ])),
                        ),
                      ))
                ],
              )),
              SizedBox(
                height: 20,
              ),
              Row(children: [
                Text(
                  "Talk to Therapist",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle),
                ),
                Expanded(child: Container()),
                Text(
                  "View all",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColor.homePageTitle),
                ),
                Icon(Icons.keyboard_arrow_right)
              ]),
              SizedBox(
                height: 20,
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 90),
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffFFFFFF),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 160),
                      height: 110,
                      margin: EdgeInsets.only(left: 10),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: (MediaQuery.of(context).size.width / 4),
                              margin: EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage("assets/therapist/therapist1_home.png")),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 17, top: 20, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. John Doe",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Psychologist",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Icon(
                                              Icons.star,
                                              color: Color(0xffFFC738),
                                              size: 13,
                                            ),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "4.5 rating",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width - 358,
                      margin: EdgeInsets.only(top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff6264FC).withOpacity(0.5)),
                            child: Text(
                              "Rs.950/hr",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6264FC).withOpacity(0.9)),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => Therapist_profile());
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: (MediaQuery.of(context).size.width - 90),
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xffFFFFFF),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Container(
                      width: (MediaQuery.of(context).size.width - 160),
                      height: 110,
                      margin: EdgeInsets.only(left: 10),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              width: (MediaQuery.of(context).size.width / 4),
                              margin: EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5,),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(
                                    image: AssetImage("assets/therapist/therapist2_home.png")),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 17, top: 20, bottom: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Dr. Jane Rojas",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Text(
                                        "Psychologist",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      )),
                                  Container(
                                      margin: EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Color(0xffFFC738),
                                            size: 13,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: Text(
                                                "3.5 rating",
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ))
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width - 358,
                      margin: EdgeInsets.only(top: 2, bottom: 2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Color(0xff6264FC).withOpacity(0.5)),
                            child: Text(
                              "Rs.750/hr",
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff6264FC).withOpacity(0.9)),
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                              margin: EdgeInsets.only(bottom: 10),
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => Therapist_profile());
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 17,
                                ),
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  Get.to(() => Questionnaire());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width/1.1,
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Color(0xff6264FC), width: 2),
                    color: Color(0xffFFFFFF),
                  ),
                  alignment: Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.only(left: 25),
                    width: MediaQuery.of(context).size.width - 80,
                    height: 130,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Take weekly Questionnaire",
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.w700),
                                )),
                            Container(
                                margin: EdgeInsets.only(left: 18),
                                child: Text(
                                  "Lorem ipsum dolor sit amet,\nconsectetur adipiscing elit",
                                  style: TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                        Container(
                            width: 40,
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xff6264FC),
                            ),
                            child: InkWell(
                              onTap: (){
                                Get.to(() => Questionnaire());
                              },
                              child: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 17,
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
