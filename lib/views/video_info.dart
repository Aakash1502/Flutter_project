import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reconnect_front_end/utils/colors.dart';
import 'package:video_player/video_player.dart';
import 'home_page.dart';

class videoInfo extends StatefulWidget {
  const videoInfo({Key? key}) : super(key: key);

  @override
  State<videoInfo> createState() => _videoInfoState();
}

class _videoInfoState extends State<videoInfo> {
  List info = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  VideoPlayerController? _controller;

  _initData() {
    DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
      info = jsonDecode(value);
    });
  }

  @override
  void dispose(){
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.homePageBackground,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 70, left: 20, right: 20),
          child:  Column(
            children: [
              _playArea==false?Row(
                children: [
                  InkWell(
                        onTap: (){
                          Get.to(()=>HomePage());
                        },

                      child: Icon(Icons.arrow_back_ios, size: 35,)
                  ),
                  Text(
                    "Meditate",
                    style: TextStyle(
                        fontSize: 30,
                        color: AppColor.homePageTitle,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ):Container(
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Icon(Icons.arrow_back_ios, size: 20,color: Colors.black,),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
              _playArea==false?Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                margin: EdgeInsets.only(top: 30),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),),
                alignment: Alignment.center,
                child: Column(
                  children: [

                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      height: 80,
                      margin: EdgeInsets.only(top: 7, bottom: 5),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/meditation.png"),
                            fit: BoxFit.fill,
                        ),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width-60,
                      height: 72,
                      margin: EdgeInsets.only(top: 2),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Text(
                              "Mindfulness Meditation",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 7),
                            child: Text(
                              "7 Day Audio & Video Series",
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                          Expanded(child: Container()),
                          Row(
                            children: [
                              Container(margin: EdgeInsets.only(left: 5),child: Icon(Icons.headphones_rounded, size: 20,)),
                              Container(margin: EdgeInsets.only(left: 8),
                                  child: Icon(Icons.play_circle_fill, size: 20,)),
                            ],
                          )


                        ],
                      ),
                    ),
                  ],
                ),
              ):Container(
                margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      _playView(context),
                      _controlView(context)
                    ],
                  ),
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                constraints: BoxConstraints(
                  maxHeight: double.infinity,
                ),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(

                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 5, top: 10),
                      child: Text(
                        "Recent Episodes",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            color: AppColor.homePageTitle),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: SizedBox(
                        height: 400,
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView.builder(
                              itemCount: info.length,
                              itemBuilder: (_,i){
                            return GestureDetector(
                              onTap: (){
                                _onTapVideo(i);
                                debugPrint(i.toString());
                                setState(() {
                                  if(_playArea==false){
                                    _playArea = true;
                                  }
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(top: 15),
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                decoration: BoxDecoration(

                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width/4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        image: DecorationImage(
                                            image: AssetImage(info[i]['thumbnail']),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 10),
                                      width: MediaQuery.of(context).size.width/1.7,
                                      decoration: BoxDecoration(

                                      ),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 10,),
                                          Text(info[i]['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                                          SizedBox(height: 6,),
                                          Text(info[i]['time'], style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),)
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            );
                          })),
                        ),
                    ),

                  ],
                ),

              )
            ],
          ),
        ),
      ),
    );

  }
  String convertTwo(int value){
    return value < 10 ? "0$value" : "$value";
  }
  Widget _controlView(BuildContext context){
    final duration = _duration?.inSeconds??0;
    final head = _position?.inSeconds ?? 0 ;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/60.0);
    final secs = convertTwo(remained % 60);
    return Column(
      children: [
        SliderTheme(data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.purple[700],
            inactiveTrackColor: Colors.purple[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.purple,
            overlayColor: Colors.purple.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.purple[700],
            inactiveTickMarkColor: Colors.purple[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.purpleAccent,
            valueIndicatorTextStyle: TextStyle(
                color: Colors.white
            )
        ),
          child: Slider(
            value: max(0, min(_progress*100,100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value){
              setState(() {
                _progress = value*0.01;
              });
            },
            onChangeStart: (value){
              _controller?.play();
            },
            onChangeEnd: (value){
              final duration = _controller?.value.duration;
              if(duration!=null){
                var newValue = max(0,min(value, 99))*0.01;
                var millis = (duration.inMilliseconds*newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              FlatButton(onPressed: ()async{

              }, child: Icon(Icons.fast_rewind, size: 36,color: Colors.black,),),
              FlatButton(onPressed: ()async{
                if(_isPlaying == true){
                  setState(() {
                    _isPlaying = false;
                  });
                  _controller?.pause();
                }else{
                  setState(() {
                    _isPlaying = true;
                  });
                  _controller?.play();
                }
              }, child: Icon(_isPlaying?Icons.pause: Icons.play_arrow, size: 36,color: Colors.black,),),
              FlatButton(onPressed: ()async{}, child: Icon(Icons.fast_forward, size: 36,color: Colors.black,),),
              Text(
                "$mins:$secs",
                style: TextStyle(
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                          offset: Offset(0.0, 1.0),
                          blurRadius: 4.0,
                          color: Colors.white
                      )
                    ]
                ),
              )
            ],
          ),
        )
      ],


    );
  }
  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate()async{
    if(_disposed){
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if(_onUpdateControllerTime>now){
      return;
    }else{
      _onUpdateControllerTime = now+500;
    }
    final controller = _controller;
    if(controller == null){
      debugPrint('Controller is null');
      return;
    }
    if(!controller.value.isInitialized){
      debugPrint("controller is not initialised");
      return;
    }
    if(_duration == null){
      _duration  = _controller?.value.duration;
    }
    var duration = _duration;
    if(duration==null) return;
    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;
    if(playing){
      if(_disposed) return;
      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble()/duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying=playing;
  }
  Widget _playView(BuildContext context){
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized){
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else{
      return AspectRatio(
          aspectRatio: 16/9,
          child: Center(child: Text("Loading...", style: TextStyle(fontSize: 20, color: Colors.black),)));
    }
  }

  _onTapVideo(int i){
    final controller = VideoPlayerController.asset("assets/videos/meditation_video.mp4");
    final old = _controller;
    _controller = controller;
    if(old!=null){
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
    });
    controller..initialize().then((_){
      old?.dispose();
      controller.addListener(_onControllerUpdate);
      _controller?.play();
      setState(() {

      });
    });
  }
}
