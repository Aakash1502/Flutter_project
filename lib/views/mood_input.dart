import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reconnect_front_end/views/signin.dart';

import 'home_page.dart';

class Mood_input extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff000000),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(top: 70, left: 20, right: 20),
            child: Column(
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: (){
                          Get.to(()=>signIn());
                        },

                        child: Icon(Icons.arrow_back_ios, size: 35, color: Colors.white,)
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Text("Good Afternoon!", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
                ),
                Container(
                  margin: EdgeInsets.only(top:10),
                  child: Text("How are you feeling today?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),),
                ),
                Container(
                  child: SizedBox(
                    height: 460,
                    child: GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30
                      ),
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3F3F3F),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/happy.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("happy", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xff3F3F3F),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/sad.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Sad", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/angry.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Angry", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/nervous.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Nervous", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/anxious.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Anxious", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/stressed.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Stressed", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/confused.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Confused", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/relieved.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Relieved", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(15),

                          ),
                          width: MediaQuery.of(context).size.width/4,
                          height: 40,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/moods_img/restless.png'),
                                  ),
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text("Restless", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),)),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  child: Text("Don’t know how you’re feeling?", style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white),),
                ),
                Container(
                  margin: EdgeInsets.only(top:5),
                  child: Text("That’s Okay", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: MediaQuery.of(context).size.width/2,
                  height: 40,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                      color: Color(0xff6264FC)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                Get.to(() => HomePage());
                },
                        child: Container(
                          alignment: Alignment.center,
                          height: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              ),
                          child: Text(
                            "We can help you",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Icon(Icons.arrow_forward, color: Colors.white, size: 18, ),
                      )
                    ],
                  ),
                )

              ],
            ),
        )
      ),
    );
  }
}
