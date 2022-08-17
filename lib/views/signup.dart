import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/views/signin.dart';
import 'package:reconnect_front_end/views/signup_details.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
              child: Container(
        child: Padding(
          padding: EdgeInsets.only(top: screenHeight * 0.25),
          child: Column(
            children: [
              Text("Sign Up", style: TextStyle(fontSize: 35, color: Colors.white)),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Name"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Email"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none, hintText: "Password"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Confirm Password"),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.17),
                  child: ElevatedButton(
                      child: Text("Sign Up", style: TextStyle(fontSize: 25)),
                      onPressed: () {
                        Get.to(() => SignUpDetails());
                      },
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 15)),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple)))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already a member?", style: TextStyle(color: Colors.white),),
                  TextButton(
                      onPressed: () {
                        Get.to(() => signIn());
                      },
                      child: Text("Sign Up")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Sign Up with", style: TextStyle(color: Colors.white),),
                  TextButton(
                      onPressed: () {
                        Get.to(() => SignUp());
                      },
                      child: Text("google")),
                ],
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
