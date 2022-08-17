import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/mood_calendar.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:reconnect_front_end/views/therapist_profile.dart';

import 'home_page.dart';
import 'notifications.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PageController _pageController = PageController(initialPage: 0);
  List info = [];
  double rating = 4;
  _initData() {
    DefaultAssetBundle.of(context)
        .loadString("json/therapy_session.json")
        .then((value) {
      info = jsonDecode(value);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }

  final isSelected = <bool>[false, false, false];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
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
                              color: Colors.white,
                            )),
                        Text(
                          "Home",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                            onTap: (){
                              Get.to(()=>Notifications());
                            },
                            child: Icon(Icons.notifications_none_outlined, size: 35, color: Colors.white,)),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 60),
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/user_img.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      child: Text("John Doe", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      child: Text("23 yrs old", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),),
                    )
                  ],
                ),
                height: 370,
                decoration: BoxDecoration(
                    color: Color(0xffAB87FF),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(180),
                        bottomRight: Radius.circular(180))),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                width: MediaQuery.of(context).size.width - 50,
                height: 140,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffFFFFFF)
                ),
                child: Container(
                  padding: EdgeInsets.only(top: 2, left: 20,right: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("21st june 2022", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400,color: Colors.grey.withOpacity(0.5)),),
                          Expanded(child: Container()),
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/moods_img/mood_profile2.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        child: Text("Feeling Happy today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        child: Text("3 Activities completed", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400,color: Colors.black),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 7),
                        alignment: Alignment.center,
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1
                          ),
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("View Journal Entry", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width - 50,
                child: Text("Mood Calendar", style: TextStyle(fontSize: 24)),
                alignment: Alignment.topLeft,
              ),
              ExpandablePageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: [DailyMood(), MoodBarChart(), MoodCalendar()],
              ),
              ToggleButtons(
                color: Colors.black.withOpacity(1),
                selectedColor: Colors.white,
                selectedBorderColor: Color(0xffAB87FF),
                fillColor: Color(0xffAB87FF).withOpacity(1),
                splashColor: Color(0xffAB87FF).withOpacity(0.12),
                hoverColor: Color(0xffAB87FF).withOpacity(0.04),
                borderRadius: BorderRadius.circular(100.0),
                constraints: BoxConstraints(minHeight: 36.0),
                isSelected: isSelected,
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    // isSelected[index] = !isSelected[index];
                    for (int i = 0; i < isSelected.length; i++) {
                      isSelected[i] = i == index;
                      _pageController.animateToPage(index,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.easeInToLinear);
                    }
                  });
                },
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Daily'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Weekly'),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text('Monthly'),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Exercises Done", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600,color: Colors.black),)),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width/1.1,

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 15, bottom: 15),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Books Read", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Container(
                                  child: Text("30 hrs meditation", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/moods_img/profile_arrow.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Books Read", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Container(
                                  child: Text("30 hrs meditation", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/moods_img/profile_arrow.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Books Read", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Container(
                                  child: Text("30 hrs meditation", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/moods_img/profile_arrow.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10, bottom: 10),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15, right: 15),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  child: Text("Books Read", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600,color: Colors.black),),
                                ),
                                Container(
                                  child: Text("30 hrs meditation", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: Colors.black),),
                                )
                              ],
                            ),
                            Expanded(child: Container()),
                            Container(
                              height: 25,
                              width: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/moods_img/profile_arrow.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child: Text("Exercises Done", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600,color: Colors.black),)),
                ],
              ),
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
                        height: 200,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: info.length,
                            itemBuilder: (_, i) {
                              return InkWell(
                                onTap: (){
                                  Get.to(() => Therapist_profile());
                                },
                                child: Container(
                                  padding: EdgeInsets.only(top: 20, left: 15, right: 15),
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  width: MediaQuery.of(context).size.width/2,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                              child: Text(info[i]["date"], style: TextStyle(color: Colors.grey.withOpacity(0.9)),)),
                                          Expanded(child: Container()),
                                          Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: Text("${info[i]["time"]} hrs", style: TextStyle(color: Colors.grey.withOpacity(0.9)),))
                                      ],
                                      ),
                                      Container(child: Text(info[i]["name"], style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),)),
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text("Online Session", style: TextStyle(color: Colors.grey.withOpacity(0.9), fontSize: 15, fontWeight: FontWeight.w400),)),
                                      Container(
                                        margin: EdgeInsets.only(top:5),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.only(right: 10, top: 5),
                                                width: 80,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: [
                                                    StarRating(
                                                      rating: 4,
                                                      onRatingChanged: (rating) => setState(() => this.rating = rating), color: Colors.black, size: 12,
                                                    ),
                                                  ],
                                                )
                                            ),
                                            Container(
                                                margin: EdgeInsets.only(top:5),
                                                child: Text("4 of 5 rating", style: TextStyle(fontSize: 10),))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10),
                                        alignment: Alignment.center,
                                        width: 100,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1
                                            ),
                                            borderRadius: BorderRadius.circular(20)
                                        ),
                                        child: Text("View Report", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400,color: Colors.black),),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  )),
            ],
          ),
        ));
  }
}
