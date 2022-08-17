import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reconnect_front_end/views/home_page.dart';
import 'package:reconnect_front_end/views/music_info.dart';

class MusicUI extends StatefulWidget {
  const MusicUI({Key? key}) : super(key: key);

  @override
  State<MusicUI> createState() => _MusicUIState();
}

class _MusicUIState extends State<MusicUI> {
  var likeIcon = Icons.favorite_border_outlined;
  bool isPressed = false;
  double seekValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => HomePage());
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 35,
                  )),
              InkWell(
                  onTap: () {
                    Get.to(() => musicInfo());
                  },
                  child: Icon(
                    Icons.playlist_add,
                    size: 35,
                  )),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              width: 280,
              height: 280,
              image: AssetImage(
                  "assets/music_thumb.png"),
              fit: BoxFit.contain,
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Good Vibrations",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        Text("Ryan Holloway", style: GoogleFonts.montserrat())
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        likeIcon,
                        color: Colors.pink,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isPressed) {
                            likeIcon = Icons.favorite_border_outlined;
                            isPressed = false;
                          } else {
                            likeIcon = Icons.favorite;
                            isPressed = true;
                          }
                        });
                      },
                    )
                  ]),
            ),
          ),
          Slider(
              value: seekValue,
              onChanged: (val) {
                setState(() {
                  seekValue = val;
                });
              }),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Row(
                children: [Text("0:00"), Text("5:00")],
                mainAxisAlignment: MainAxisAlignment.spaceBetween),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shuffle)),
              IconButton(onPressed: () {}, icon: Icon(Icons.skip_previous)),
              IconButton(onPressed: () {}, icon: Icon(Icons.play_circle)),
              IconButton(onPressed: () {}, icon: Icon(Icons.skip_next)),
              IconButton(onPressed: () {}, icon: Icon(Icons.repeat))
            ],
          )
        ]),
      ),
    ));
  }
}
