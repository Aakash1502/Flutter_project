import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/appointment_form.dart';
import 'package:reconnect_front_end/views/books_main.dart';
import 'package:reconnect_front_end/views/home_page.dart';

import 'package:like_button/like_button.dart';

class Therapist_profile extends StatefulWidget {
  const Therapist_profile({Key? key}) : super(key: key);

  @override
  State<Therapist_profile> createState() => _Therapist_profileState();
}

class _Therapist_profileState extends State<Therapist_profile> {
  double rating = 4;

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
                          "Therapist",
                          style: TextStyle(
                              fontSize: 30,
                              color: AppColor.homePageTitle,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image: AssetImage("assets/therapist/therapist1.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),Container(
                            width: double.infinity,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10, top: 5),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Dr. John Doe", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),),
                                          Text("Online Sessions", style: TextStyle(fontSize: 10),),
                                        ],
                                      ),
                                    )


                                  ],
                                ),
                                Expanded(child: Container()),
                                Container(
                                  margin: EdgeInsets.only(top:5),
                                  alignment: Alignment.center,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Container(
                                      alignment: Alignment.center,
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
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(15)
                            ),
                            child: Icon(Icons.message, size: 30,),
                          ),
                          SizedBox(width: 20,),
                          Container(
                            alignment: Alignment.center,
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(15)
                            ),
                            child: Icon(Icons.video_call , size: 40,),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40,),
                    Container(
                      margin: EdgeInsets.only(right: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      child: Text("Hi, My name is John Doe. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.", style: TextStyle(fontSize: 15),),
                    ),
                    SizedBox(height: 20,),
                    InkWell(
                      onTap: () {
                        Get.to(() => Appointment());
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width/1.5,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffAB87FF),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text("Book Appointment", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
                      ),
                    ),
                  ],
                )
            )
        )
    );
  }
}
typedef void RatingChangeCallback(double rating);

class StarRating extends StatelessWidget {
  final int starCount;
  final double size;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;

  StarRating({this.starCount = 5, required this.rating , required this.onRatingChanged, required this.color,required this.size});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
        size: size,
      );
    }
    else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        size: size,
      );
    } else {
      icon = new Icon(
        Icons.star,
        size: size,
      );
    }
    return new InkResponse(
      onTap: onRatingChanged == null ? null : () => onRatingChanged(index + 1.0),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(children: new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
