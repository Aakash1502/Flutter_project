import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/books.dart';
import 'package:reconnect_front_end/views/home_page.dart';

class Book_main extends StatefulWidget {
  const Book_main({Key? key}) : super(key: key);

  @override
  State<Book_main> createState() => _Book_mainState();
}

class _Book_mainState extends State<Book_main> {

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6F6F6),
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          child: Column(
            children: [
              Row(children: [
                InkWell(
                    onTap: () {
                      Get.to(() => Books_home());
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    )),
                Text(
                  "Books",
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
              ]
              ),
              Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 190),
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(20)

                    ),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 120),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width/5,
                            height: 18,
                            decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Self-Love", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("How to love", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text("by Gordon Livingston", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width/1.2,
                            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
                          ),
                          Container(
                            child: Text("Pages: 191", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width/2,
                            height: 28,
                            decoration: BoxDecoration(
                                color: Color(0xffAB87FF),
                                borderRadius: BorderRadius.circular(20)
                            ),
                            child: Text("Read Book", style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Colors.white),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 270),
                    width: MediaQuery.of(context).size.width/2.5,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: AssetImage("assets/books_thumb/book_home.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(bottom: 258,),
                    height: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 3,),
                      child: LikeButton(
                        size: 15,
                        onTap: onLikeButtonTapped,
                      ),
                    )
                  ),
                ],
              )
            ],
          ),
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
