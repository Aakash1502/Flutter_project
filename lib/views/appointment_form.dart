import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:reconnect_front_end/views/appointment_confirm.dart';
import 'package:reconnect_front_end/views/books_main.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:like_button/like_button.dart';
import 'package:intl/intl.dart';

class Appointment extends StatefulWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateinput = TextEditingController();
  TextEditingController nameinput = TextEditingController();
  TextEditingController timeinput = TextEditingController();


  @override
  void initState() {
    dateinput.text = "";
    nameinput.text = "";
    timeinput.text = "";
    // zoneinput.text = "${selectedTime.}";//set the initial value of text field
    super.initState();
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
                            onTap: () {
                              Get.to(() => HomePage());
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
                    SizedBox(height: 30,),
                    Container(
                      width: (MediaQuery.of(context).size.width - 80),
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
                                          image: AssetImage("assets/therapist/therapist1_box.png"),
                                          fit: BoxFit.fill
                                      ),
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
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30,),
                    Container(
                      width: MediaQuery.of(context).size.width-80,
                      height: 450,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xffFFFFFF)
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Enter Your Details Below", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
                            SizedBox(height: 30,),
                            Text("Name", style: TextStyle(fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child: TextField(
                                controller: nameinput,
                                onChanged: (value) {
                                  //Do something with the user input.
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  hintText: 'Enter your name',
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 30,),
                            Text("Date", style: TextStyle(fontWeight: FontWeight.w500),),
                            SizedBox(height: 10,),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child: TextField(
                                controller: dateinput,
                                onChanged: (value) {
                                  //Do something with the user input.
                                },
                                decoration: InputDecoration(
                                  icon: Icon(Icons.calendar_today, color: Colors.grey.withOpacity(0.7),),
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  hintText: DateFormat('dd/ MM/ yyyy').format(DateTime.now()).toString(),
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                ),
                                  readOnly: true,  //set it true, so that user will not able to edit text
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        //DateTime.now() - not to allow to choose before today.
                                        lastDate: DateTime(2101)
                                    );
                                    if(pickedDate != null ){
                                      print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                      String formattedDate = DateFormat('dd/ MM /yyyy').format(pickedDate);
                                      print(formattedDate); //formatted date output using intl package =>  2021-03-16
                                      //you can implement different kind of Date Format here according to your requirement

                                      setState(() {
                                        dateinput.text = formattedDate; //set output date to TextField value.
                                      });
                                    }else{
                                      print("Date is not selected");
                                    }
                                  }
                              )
                            ),
                            SizedBox(height: 30,),
                            Text("Time", style: TextStyle(fontWeight: FontWeight.w500),),
                            Container(
                              width: MediaQuery.of(context).size.width/1.5,
                              child: TextField(
                                controller: timeinput, //editing controller of this TextField,
                                decoration: InputDecoration(
                                  icon: Icon(Icons.access_time_sharp , color: Colors.grey.withOpacity(0.7),),
                                  fillColor: Colors.grey.withOpacity(0.2),
                                  filled: true,
                                  hintText: DateFormat('dd/ MM/ yyyy').format(DateTime.now()).toString(),
                                  contentPadding:
                                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
                                  ),
                                ),
                                readOnly: true,  //set it true, so that user will not able to edit text
                                onTap: () async {
                                  TimeOfDay? pickedTime =  await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );

                                  if(pickedTime != null ){
                                    print(pickedTime.format(context));
                                    String formattedTime = '${pickedTime.hour}:${pickedTime.minute} ${pickedTime.period.toString().split('.')[1]}';


                                    setState(() {
                                      timeinput.text = formattedTime; //set the value of text field.
                                    });
                                  }else{
                                    print("Time is not selected");
                                  }
                                },
                              ),
                            ),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.to(() => Appointment_confirm());
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: MediaQuery.of(context).size.width/2,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xffAB87FF),
                                        borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: Text("Book Appointment", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.white),),
                                  ),
                                ),
                              ],

                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
            )
        )
    );
  }
}
