import 'package:flutter/material.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/views/mood_input.dart';
import 'package:reconnect_front_end/views/signin.dart';
import 'package:reconnect_front_end/views/video_info.dart';
import 'package:reconnect_front_end/views/video_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Epilogue'),

      home: signIn(),
    );
  }
}

