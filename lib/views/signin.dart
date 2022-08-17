// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:reconnect_front_end/views/mood_input.dart';
import 'package:reconnect_front_end/views/signup.dart';

class signIn extends StatefulWidget {
  const signIn({Key? key}) : super(key: key);

  @override
  State<signIn> createState() => _signInState();
}

class _signInState extends State<signIn> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Center(
              child: Container(
                padding: EdgeInsets.only(top: screenHeight * 0.28),
                child: Column(
                  children: [
                    const Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    const SizedBox(height: 70),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: TextField(
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: "Email", hintStyle: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.17),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.0),
                            child: TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Password", hintStyle: TextStyle(color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            child:
                                Text("Sign In", style: TextStyle(fontSize: 20)),
                            onPressed: () {
                              Get.to(() => Mood_input());
                            },
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 15)),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.purple.withOpacity(0.9)))),
                        const SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Not a member?", style: TextStyle(color: Colors.white),),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUp());
                                },
                                child: Text("Sign Up")),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Sign in with", style: TextStyle(color: Colors.white),),
                            TextButton(
                                onPressed: () {
                                  Get.to(() => SignUp());
                                },
                                child: Text("google")),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
