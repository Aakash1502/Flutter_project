import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/home_page.dart';

import 'New_journal.dart';

class Journal_home extends StatefulWidget {
  const Journal_home({Key? key}) : super(key: key);

  @override
  State<Journal_home> createState() => _Journal_homeState();
}

class _Journal_homeState extends State<Journal_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.homePageBackground,
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
                          Get.to(()=>HomePage());
                        },

                        child: Icon(Icons.arrow_back_ios, size: 35,)
                    ),
                    Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 30,
                          color: AppColor.homePageTitle,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Get.to(()=>NewJournal());
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    width: MediaQuery.of(context).size.width,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xffAB87FF).withOpacity(0.2),
                      border: Border.all(
                        width: 2,
                        color: Color(0xffAB87FF)
                      ),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Image.asset('assets/star_small.png',),
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 10),
                            child: Text("Start New", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),))
                      ],
                    ),
                  ),
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "Recently Edited",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColor.homePageTitle),
                    ),
                  )
                ]),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 190,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: 165,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFAA596)
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: (MediaQuery.of(context).size.width/3.6)-23,
                                    decoration: BoxDecoration(
                                        color: Color(0xffFBE5E1),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("Lorem\nIpsum", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),)
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("21st June\n2022", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 20,
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text("2 Hours ago", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                          )
                        ]
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: 165,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Color(0xffAB87FF)
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: (MediaQuery.of(context).size.width/3.6)-23,
                                    decoration: BoxDecoration(
                                        color: Color(0xffE0D2FF),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("Lorem\nIpsum", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),)
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("20th June\n2022", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 20,
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text("1 day ago", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                          )
                        ]
                      ),
                      Column(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width/3.5,
                              height: 165,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: 20,
                                    decoration: BoxDecoration(
                                        color: Color(0xffB4E1FF)
                                    ),
                                  ),
                                  Container(
                                    height: MediaQuery.of(context).size.height,
                                    width: (MediaQuery.of(context).size.width/3.6)-23,
                                    decoration: BoxDecoration(
                                        color: Color(0xffE3F4FF),
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("Lorem\nIpsum", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),)
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(top: 15, left: 10),
                                            child: Text("21st June\n2022", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)
                                        )
                                      ],
                                    ),
                                  ),

                                ],
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            height: 20,
                            width: MediaQuery.of(context).size.width/3.5,
                            child: Text("3 days ago", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
                          )
                        ]
                      ),
                    ],

                  ),
                ),
                Row(children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    child: Text(
                      "My Journals",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: AppColor.homePageTitle),
                    ),
                  )
                ]),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xffE98ADF)
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width-60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 15, left: 15),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/Oval_icon.png"
                                              )
                                          )
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 15, left: 5),
                                        child: Text("21st June 2022", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10, left: 18),
                                  child: Text("I tried something new today",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 13, left: 18),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec nisl eget massa accumsan consequ. . .",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)
                                  )
                              ),
                            ],
                          ),
                        ),

                      ],
                    )
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 165,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight: Radius.circular(15))
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: 20,
                          decoration: BoxDecoration(
                              color: Color(0xff75CAEE)
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width-60,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10))
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 15, left: 15),
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/Oval_icon.png"
                                              )
                                          )
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(top: 15, left: 5),
                                        child: Text("21st June 2022", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 13),)
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10, left: 18),
                                  child: Text("I dont feel very good today",style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18)
                                  )
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 13, left: 18),
                                  child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla nec nisl eget massa accumsan consequ. . .",style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],

                    ),

                ),
                SizedBox(height: 20,)
              ],

            ),

          ),
        )
    );
  }
}
