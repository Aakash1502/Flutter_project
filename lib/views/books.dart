import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/books_main.dart';
import 'package:reconnect_front_end/views/home_page.dart';

import 'package:like_button/like_button.dart';

class Books_home extends StatefulWidget {
  const Books_home({Key? key}) : super(key: key);

  @override
  State<Books_home> createState() => _Books_homeState();
}

class _Books_homeState extends State<Books_home> {
  List info = [];
  List info2 = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/books_recommendations.json").then((value) {
      info = jsonDecode(value);
    });
    DefaultAssetBundle.of(context).loadString("json/books_most_read.json").then((value) {
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
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(children: [
              Row(children: [
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
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(),
                      );
                    },
                    icon: Icon(
                      Icons.search_sharp,
                      size: 30,
                    ))
              ]),
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
                    color: Color(0xffB4E1FF),
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
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 10, left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Escape Into Meaning", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
                                      Text("Evan Puschak", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                                      Container(
                                          margin: EdgeInsets.only(top: 10),
                                          child: Text("60 Pgs remaining", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),)),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          ),
                          Expanded(child: Container()),
                          Container(
                            margin: EdgeInsets.only(right: 15),
                            child: Icon(Icons.play_arrow,size: 30,),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.14,
                        height: 170,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: info.length,
                            itemBuilder: (_,i){
                            return GestureDetector(
                              onTap: () {
                                debugPrint(i.toString());
                              },
                              child: InkWell(
                                onTap: () {
                                  Get.to(() => Book_main());
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 10),
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(top: 5,left: 5, right: 5),
                                        width: MediaQuery.of(context).size.width,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(info[i]['thumbnail']),
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 15,
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                          ),
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            margin: EdgeInsets.only(left: 5),
                                            child: Text("${info[i]['pages']} Pages", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),),
                                          )
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5,left: 5, right: 5),
                                        width: MediaQuery.of(context).size.width,
                                        height: 60,
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                      child: Container(
                                                          margin: EdgeInsets.only(top: 10, left: 5),
                                                          child: Text(info[i]['title'],style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),))
                                                ),
                                                Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  alignment: Alignment.center,
                                                  child: LikeButton(
                                                    size: 15,
                                                    onTap: onLikeButtonTapped,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Expanded(child: Container()),
                                            Container(
                                              alignment: Alignment.center,
                                              width: MediaQuery.of(context).size.width,
                                              height: 18,
                                              decoration: BoxDecoration(
                                                  color: Color(0xffF6F6F6),
                                                borderRadius: BorderRadius.circular(20)
                                              ),
                                              child: Text("Self-Love", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
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
                height: 30,
              ),
              Row(children: [
                Text(
                  "Most Read",
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
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  margin: EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Color(0xffF6F6F6),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/1.14,
                        height: 170,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: info2.length,
                            itemBuilder: (_,i){
                              return GestureDetector(
                                onTap: () {
                                  debugPrint(i.toString());
                                },
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => Book_main());
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 90,
                                    height: 90,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFFFFFF),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 5,left: 5, right: 5),
                                          width: MediaQuery.of(context).size.width,
                                          height: 60,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(info2[i]['thumbnail']),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                                  Container(
                                                      margin: EdgeInsets.only(top: 3, left: 3),
                                                      width: 30,
                                                      height: 15,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius.circular(20)
                                                      ),
                                                      alignment: Alignment.centerLeft,
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Icon(Icons.remove_red_eye_outlined, size: 10,),
                                                          Container(
                                                            margin: EdgeInsets.only(left: 2),
                                                            child: Text("${info2[i]['read']}", style: TextStyle(color: Colors.black, fontSize: 8, fontWeight: FontWeight.w400),),
                                                          )
                                                        ],
                                                      )
                                                  ),
                                              Expanded(child: Container()),
                                              Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 15,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10))
                                                  ),
                                                  alignment: Alignment.centerLeft,
                                                  child: Container(
                                                    margin: EdgeInsets.only(left: 5),
                                                    child: Text("${info2[i]['pages']} Pages", style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400),),
                                                  )
                                              ),
                                            ],
                                          )
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5,left: 5, right: 5),
                                          width: MediaQuery.of(context).size.width,
                                          height: 60,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Container(
                                                          margin: EdgeInsets.only(top: 10, left: 5),
                                                          child: Text(info2[i]['title'],style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),))
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 10),
                                                    alignment: Alignment.center,
                                                    child: LikeButton(
                                                      size: 15,
                                                      onTap: onLikeButtonTapped,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Expanded(child: Container()),
                                              Container(
                                                alignment: Alignment.center,
                                                width: MediaQuery.of(context).size.width,
                                                height: 18,
                                                decoration: BoxDecoration(
                                                    color: Color(0xffF6F6F6),
                                                    borderRadius: BorderRadius.circular(20)
                                                ),
                                                child: Text("Self-Love", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, ),),
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
            ]
            )
        )
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerms = [
    'Apple',
    'Banana',
    'Pear',
    'Watermelons',
    'Oranges',
    'Blueberries',
    'Raspberries',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  IconButton buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  ListView buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  @override
  ListView buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
