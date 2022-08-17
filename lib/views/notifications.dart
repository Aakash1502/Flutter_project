import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/home_page.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/notification.json").then((value) {
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
                    "Notifications",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Clear all",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.withOpacity(0.5),
                        fontWeight: FontWeight.w500),
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
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.80,
                        child: MediaQuery.removePadding(
                            removeTop: true,
                            context: context,
                            child: ListView.builder(
                                itemCount: info.length,
                                itemBuilder: (_,i){
                                  return GestureDetector(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(width: 2, color: Colors.grey.withOpacity(0.4)),
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                      margin: EdgeInsets.only(top: 10),
                                                      child: Text(info[i]['title'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700))
                                                  ),
                                                  Expanded(child: Container()),
                                                  Container(
                                                      margin: EdgeInsets.only(top: 10),
                                                      child: Text(info[i]['time'], style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400, color: Colors.grey))
                                                  ),
                                                ]
                                              ),
                                              Container(
                                                  margin: EdgeInsets.only(top: 10),
                                                  child: Text(info[i]['desc'], style: TextStyle(fontSize: 15,))
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
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
