import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/home_page.dart';

import 'journal.dart';

class NewJournal extends StatefulWidget {
  const NewJournal({Key? key}) : super(key: key);

  @override
  State<NewJournal> createState() => _NewJournalState();
}

class _NewJournalState extends State<NewJournal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.homePageBackground,
        body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                            onTap: (){
                              Get.to(()=>Journal_home());
                            },

                            child: Icon(Icons.arrow_back_ios, size: 35,)
                        ),
                        Text(
                          "Journal",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppColor.homePageTitle,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 40),
                      alignment: Alignment.topLeft,
                        child: Text("SUNDAY", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),)
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 8),
                        alignment: Alignment.topLeft,
                        child: Text("28th May 2022", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),)
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.circular(8)
                      ),
                      child: Row(
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 8),
                              child: Text("Pick Color", style: TextStyle(fontSize: 17),)
                          ),
                          Container(
                            width: 270,
                            height: 40,

                            margin: EdgeInsets.only(left: 7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffAB87FF),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xff75CAEE),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFF4343),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xff19DAAB),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFB4FFF),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 20,
                                  decoration: BoxDecoration(
                                    color: Color(0xffFE8D25),
                                    shape: BoxShape.circle,
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.only(top: 12, left: 15),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xffFAA596),
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
                            ),
                              child: Text("Heading", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 444,
                            decoration: BoxDecoration(
                                border: Border.all(width: 3)
                            ),
                            child: TextField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Start something...',
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              ),
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
