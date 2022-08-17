import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/views/home_page.dart';

class SignUpDetails extends StatefulWidget {
  const SignUpDetails({Key? key}) : super(key: key);

  @override
  State<SignUpDetails> createState() => _SignUpDetailsState();
}

enum _gender { male, female, other }

class _SignUpDetailsState extends State<SignUpDetails> {
  _gender? _character = _gender.male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Theme(
          data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.green[300],
              textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          setState(() {
                            Get.to(() => HomePage());
                          });
                        },
                      )),
                  Text("Tell us about yourself",
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500)),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("Enter Details",
                        style: GoogleFonts.montserrat(color: Colors.white)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:60),
                    child: Text("Upload a photo",
                        style: GoogleFonts.montserrat(
                            color: Colors.grey[500],
                            fontSize: 10,
                            fontWeight: FontWeight.w600)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Name",
                          hintStyle: GoogleFonts.montserrat(color: Colors.white),
                          filled: true,
                          fillColor: Colors.grey[700],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  SizedBox(height: 20, width: 10),
                  TextField(
                    decoration: InputDecoration(
                        hintText: "Date of Birth",
                        hintStyle: GoogleFonts.montserrat(color: Colors.white),
                        filled: true,
                        fillColor: Colors.grey[700],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: GoogleFonts.montserrat(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                        Expanded(
                          child: RadioListTile<_gender>(
                            activeColor: Colors.green[300],
                            title: Text(
                              'Male',
                              style: GoogleFonts.montserrat(
                                  color: Colors.white, fontSize: 11),
                            ),
                            value: _gender.male,
                            groupValue: _character,
                            onChanged: (_gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<_gender>(
                            activeColor: Colors.green[300],
                            title: Text('Female',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 11)),
                            value: _gender.female,
                            groupValue: _character,
                            onChanged: (_gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                        Expanded(
                          child: RadioListTile<_gender>(
                            activeColor: Colors.green[300],
                            title: Text('Other',
                                style: GoogleFonts.montserrat(
                                    color: Colors.white, fontSize: 11)),
                            value: _gender.other,
                            groupValue: _character,
                            onChanged: (_gender? value) {
                              setState(() {
                                _character = value;
                              });
                            },
                          ),
                        ),
                      ]),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Expanded(child: Container()),
                  InkWell(
                    onTap: (){
                      Get.to(() => HomePage());
                    },
                    child: Icon(Icons.arrow_forward, color: Colors.white, size: 40,),
                  )
                ],
              )),
        ));
  }
}
