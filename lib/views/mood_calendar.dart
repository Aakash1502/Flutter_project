import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:reconnect_front_end/views/mood_input.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:fl_chart/fl_chart.dart';

class Mood {
  final double mood;
  final List day = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
  final int index;
  Mood({required this.mood, required this.index});
}

final List<Mood> data = [
  Mood(mood: 4, index: 0),
  Mood(mood: 7, index: 1),
  Mood(mood: 4, index: 2),
  Mood(mood: 2, index: 3),
  Mood(mood: 5, index: 4),
  Mood(mood: 7, index: 5),
  Mood(mood: 8, index: 6)
];

class MoodCalendar extends StatefulWidget {
  const MoodCalendar({Key? key}) : super(key: key);

  @override
  State<MoodCalendar> createState() => _MoodCalendarState();
}

class _MoodCalendarState extends State<MoodCalendar> {
  String dropdownValue = '2001';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
        DropdownButton(
            value: dropdownValue,
            items: <String>[
              '2001',
              '2002',
              '2003',
              '2004',
              '2005',
              '2006',
              '2007',
              '2008',
              '2009',
              '2010',
              '2011',
              '2012',
              '2013',
              '2014',
              '2015',
              '2016',
              '2017',
              '2018'
            ].map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownValue = newValue!;
              });
            })
      ],
    ));
  }
}

class MoodBarChart extends StatefulWidget {
  const MoodBarChart({Key? key}) : super(key: key);

  @override
  State<MoodBarChart> createState() => _MoodBarChartState();
}

class _MoodBarChartState extends State<MoodBarChart> {
  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.normal,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4.0,
      child: Text(text, style: style),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: Card(
          child: BarChart(BarChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 30,
              getTitlesWidget: getTitles,
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        maxY: 10,
        minY: 0,
        barGroups: data
            .map((mood) => BarChartGroupData(x: mood.index, barRods: [
                  BarChartRodData(
                      toY: mood.mood,
                      width: 15,
                      color: Color(0xffAB87FF),
                      borderRadius: BorderRadius.circular(100))
                ]))
            .toList(),
      ))),
    );
  }
}

class DailyMood extends StatefulWidget {
  const DailyMood({Key? key}) : super(key: key);

  @override
  State<DailyMood> createState() => _DailyMoodState();
}

class _DailyMoodState extends State<DailyMood> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Card(
            child: Column(
      children: [
        Text("Daily Mood"),
        Card(
            color: Colors.grey[200],
            shadowColor: Colors.transparent,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: (){
                        Get.to(()=>Mood_input());
                      },
                      child: Image(
                        image: AssetImage("assets/moods_img/mood_profile.png"),
                      ),
                    ),
                  ),
                  SizedBox(height: 20, width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("21st June 2022"),
                      Text("Today's Mood: Happy"),
                      Row(
                        children: [
                          Container(
                            width: 9.0,
                            height: 9.0,
                            decoration: new BoxDecoration(
                              color: Colors.purpleAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                          SizedBox(width: 5.0, height: 5.0),
                          Container(
                            width: 9.0,
                            height: 9.0,
                            decoration: new BoxDecoration(
                              color: Colors.orangeAccent,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
      ],
    )));
  }
}
