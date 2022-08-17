import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/appointment_confirm.dart';
import 'package:reconnect_front_end/views/appointment_form.dart';
import 'package:reconnect_front_end/views/books_main.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';

class Appointment_confirm extends StatefulWidget {
  const Appointment_confirm({Key? key}) : super(key: key);

  @override
  State<Appointment_confirm> createState() => _Appointment_confirmState();
}

class _Appointment_confirmState extends State<Appointment_confirm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F6F6),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/appointment_confirm/backgrounds/main_back.png"),
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
                      Get.to(() => Appointment());
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 35,
                    )),
                Text(
                  "Talk to Therapist",
                  style: TextStyle(
                      fontSize: 30,
                      color: AppColor.homePageTitle,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(height: 150,),
            Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image(image: AssetImage('assets/appointment_confirm/appoint_img_1.png'))),
                Container(
                  child: Column(
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Image(image: AssetImage('assets/appointment_confirm/appoint_img_3.png'))),
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                          child: Image(image: AssetImage('assets/appointment_confirm/appoint_img_2.png'))),

                    ],
                  ),
                )

              ],
            ),
            SizedBox(height: 20,),
            Text("Appointment Booked", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    Get.to(() => HomePage());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width/2,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Color(0xffAB87FF),
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child: Text("Back to home", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
                  ),
                ),
              ],

            ),
          ],
        ),
      ),
    );
  }
}
