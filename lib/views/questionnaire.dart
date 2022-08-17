import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:reconnect_front_end/views/journal.dart';

enum Options { notAtAll, severalDays, moreDays, nearlyEveryday }

class Questionnaire extends StatefulWidget {
  const Questionnaire({Key? key}) : super(key: key);

  @override
  State<Questionnaire> createState() => _QuestionnaireState();
}

class _QuestionnaireState extends State<Questionnaire> {
  PageController _question = PageController(initialPage: 0);
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.white, displayColor: Colors.white),
          ),
        ),
        child: Container(
            color: Colors.grey[900],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 54.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 160,
                    ),
                    Text("Questionnaire",
                        style: GoogleFonts.montserrat(
                            fontSize: 28, color: Colors.white)),
                    Text("How are you feeling?",
                        style: GoogleFonts.montserrat(color: Colors.white)),
                    SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width - 20),
                    Text(
                        "Over the last 2 weeks, how often have you bothered by..",
                        style: GoogleFonts.montserrat(color: Colors.grey[700])),
                    SizedBox(
                        height: 20,
                        width: MediaQuery.of(context).size.width - 20),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width - 50,
                      child: PageView(
                          controller: _question,
                          physics: NeverScrollableScrollPhysics(),
                          children: <Widget>[
                            Question(
                              questiontext: "How bad do you feel?",
                            ),
                            Question(questiontext: "questiontext"),
                            Question(questiontext: "questiontext"),
                          ]),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 76, vertical: 4)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffAB87FF))),
                          child: new Text('Next',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                          onPressed: () {
                            index += 1;
                            _question.animateToPage(index,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInToLinear);
                            if (index > 3) {
                              Get.to(() => SubmitPage());
                            }
                          },
                        ),
                        TextButton(
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(
                                      horizontal: 76, vertical: 4)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50))),
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey[900])),
                          child: new Text('Complete Later',
                              style:
                                  GoogleFonts.montserrat(color: Colors.white)),
                          onPressed: () {
                            Get.to(() => HomePage());
                          },
                        ),
                      ],
                    )
                  ]),
            )),
      ),
    );
  }
}

class Question extends StatefulWidget {
  Question({Key? key, required this.questiontext}) : super(key: key);
  final questiontext;
  @override
  State<Question> createState() => _QuestionState();
}

class _QuestionState extends State<Question> {
  Options _character = Options.notAtAll;
  String questiontext = "How was your day?";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
            unselectedWidgetColor: Colors.green[300],
            textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white))),
        child: Card(
          shadowColor: Colors.transparent,
          color: Colors.grey[900],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 22.0),
                child: Text(
                  questiontext,
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              RadioListTile<Options>(
                activeColor: Colors.green[300],
                tileColor: Colors.grey[900],
                title: Text('Not at all',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    )),
                value: Options.notAtAll,
                groupValue: _character,
                onChanged: (Options? value) {
                  setState(() {
                    _character = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                activeColor: Colors.green[300],
                tileColor: Colors.grey[900],
                title: Text('Several days',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    )),
                value: Options.severalDays,
                groupValue: _character,
                onChanged: (Options? value) {
                  setState(() {
                    _character = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                activeColor: Colors.green[300],
                tileColor: Colors.grey[900],
                title: Text('More than half the days',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    )),
                value: Options.moreDays,
                groupValue: _character,
                onChanged: (Options? value) {
                  setState(() {
                    _character = value!;
                  });
                },
              ),
              RadioListTile<Options>(
                activeColor: Colors.green[300],
                tileColor: Colors.grey[900],
                title: Text('Nearly everyday',
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                    )),
                value: Options.nearlyEveryday,
                groupValue: _character,
                onChanged: (Options? value) {
                  setState(() {
                    _character = value!;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 54),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text("Thank you for completing the questionnaire",
                    style: GoogleFonts.montserrat(
                        fontSize: 28, color: Colors.white)),
                SizedBox(
                    height: 20, width: MediaQuery.of(context).size.width - 20),
                Text(
                    "According to your responses to the questions, we recommend you the following exercises.",
                    style: GoogleFonts.montserrat(color: Colors.grey[700])),
                SizedBox(
                    height: 20, width: MediaQuery.of(context).size.width - 20),
                Text("Hope you feel better soon!",
                    style: GoogleFonts.montserrat(color: Colors.grey[700])),
                SizedBox(
                    height: 20, width: MediaQuery.of(context).size.width - 20),
                Text(
                  "Recommended",
                  style: GoogleFonts.montserrat(
                      color: Colors.white, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                    height: 20, width: MediaQuery.of(context).size.width - 20),
                Row(
                  children: [
                    Container(
                        width: 120,
                        height: 140,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffFAA596)),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Journal your thoughts",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.fade),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      Get.to(() => Journal_home());
                                    },
                                  ),
                                ),
                              ],
                            ))),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                        width: 120,
                        height: 140,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.purpleAccent),
                        alignment: Alignment.bottomCenter,
                        child: Container(
                            height: 50,
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text("Sleep Stroies",
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                      overflow: TextOverflow.fade),
                                ),
                                Expanded(
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_forward_ios_rounded),
                                    onPressed: () {
                                      Get.to(() => HomePage());
                                    },
                                  ),
                                )
                              ],
                            )))
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 10,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 76, vertical: 4)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffAB87FF))),
                  child: new Text('Next',
                      style: GoogleFonts.montserrat(color: Colors.white)),
                  onPressed: () {
                    Get.to(() => HomePage());
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
