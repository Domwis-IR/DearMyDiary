import 'dart:math';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';

import 'package:date_format/date_format.dart';
import 'package:home/Diagnosis_Test.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyScreen());
}

class MyScreen extends StatelessWidget {
  const MyScreen({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue.shade900,
        ),
      ),
      home: const mainscreens(title: 'Dear My Diary'),
    );
  }
}

class mainscreens extends StatefulWidget {
  const mainscreens({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<mainscreens> createState() => _mainscreens();
}

class _ArticleDescription extends StatelessWidget {
  const _ArticleDescription({
    Key? key,
    required this.title,
    required this.content,
    required this.publishDate,
  }) : super(key: key);

  final String title;
  final String content;
  final String publishDate;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                publishDate,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}


class CustomListItemTwo extends StatelessWidget {
  const CustomListItemTwo({
    Key? key,
    required this.thumbnail,
    required this.title,
    required this.content,
    required this.publishDate,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String content;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  content: content,
                  publishDate: publishDate,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DiaryListWidget extends StatelessWidget {
  const DiaryListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   ListView(
      padding: const EdgeInsets.all(10.0),
      children: <Widget>[
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.pink),
          ),
          title: '전시회 다녀온 날',
          content: '오늘 서울 성수동으로 전시회를 다녀왔다.'
              '너무너무 기분이 좋았다.',
          publishDate: '11월 28일',
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: '기말고사 시험...',
          content: '기말고사 시험이 곧 다가온다.''너무너무 우울하다.',
          publishDate: '12월 15일',
        ),
      ],
    );
  }
}

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

List<DateTime> presentDates = [
  DateTime(2020, 11, 1),
  DateTime(2020, 11, 3),
  DateTime(2020, 11, 4),
  DateTime(2020, 11, 5),
  DateTime(2020, 11, 6),
  DateTime(2020, 11, 9),
  DateTime(2020, 11, 10),
  DateTime(2020, 11, 11),
  DateTime(2020, 11, 15),
  DateTime(2020, 11, 22),
  DateTime(2020, 11, 23),
];
List<DateTime> absentDates = [
  DateTime(2020, 11, 2),
  DateTime(2020, 11, 7),
  DateTime(2020, 11, 8),
  DateTime(2020, 11, 12),
  DateTime(2020, 11, 13),
  DateTime(2020, 11, 14),
  DateTime(2020, 11, 16),
  DateTime(2020, 11, 17),
  DateTime(2020, 11, 18),
  DateTime(2020, 11, 19),
  DateTime(2020, 11, 20),
];

class _CalendarPage2State extends State<CalendarPage2> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _presentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.green,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _absentIcon(String day) => CircleAvatar(
    backgroundColor: Colors.red,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );

  EventList<Event> _markedDateMap = new EventList<Event>(
    events: {},
  );

  late CalendarCarousel _calendarCarouselNoHeader;

  var len = min(absentDates.length, presentDates.length);
  late double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        presentDates[i],
        new Event(
          date: presentDates[i],
          title: 'Event 5',
          icon: _presentIcon(
            presentDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        absentDates[i],
        new Event(
          date: absentDates[i],
          title: 'Event 5',
          icon: _absentIcon(
            absentDates[i].day.toString(),
          ),
        ),
      );
    }

    _calendarCarouselNoHeader = CalendarCarousel<Event>(
      height: cHeight * 0.54,
      weekendTextStyle: TextStyle(
        color: Colors.red,
      ),
      todayButtonColor: Colors.blue[200]!,
      markedDatesMap: _markedDateMap,
      markedDateShowIcon: true,
      markedDateIconMaxShown: 1,
      markedDateMoreShowTotal:
      null, // null for not showing hidden events indicator
      markedDateIconBuilder: (event) {
        return event.icon;
      },
    );

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calender"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _calendarCarouselNoHeader,
            markerRepresent(Colors.red, "Absent"),
            markerRepresent(Colors.green, "Present"),
          ],
        ),
      ),
    );
  }

  Widget markerRepresent(Color color, String data) {
    return new ListTile(
      leading: new CircleAvatar(
        backgroundColor: color,
        radius: cHeight * 0.022,
      ),
      title: new Text(
        data,
      ),
    );
  }
}

class twoWeeksAnalysisWidget extends StatelessWidget {
  const twoWeeksAnalysisWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text.rich(
              TextSpan(
                children: <TextSpan> [
                  TextSpan(
                      text: '우울 분석 결과',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                  TextSpan(
                      text: '\n2주간 감정을 기반으로 분석했어요.',
                      style: TextStyle(
                          fontSize: 18)
                  ),
                ],
              ),
              textAlign: TextAlign.center
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('날짜')),
              DataColumn(label: Text('우울증상')),
            ],
            rows: [
              for (int i = 0; i < 14; i++)
                DataRow(
                    cells: [
                      DataCell(Text(formatDate(
                          DateTime.now().subtract(Duration(days: i)), ['20', yy, '-', M, '-', d]))),
                      DataCell(Text('지속되는 우울한 기분')),
                    ]
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
          Text(
              '2주간 일기 속에서 발견된 우울증상들이에요. 우울증상이 2주간 반복되면 우울증을 의심해요. 진단을 받아보고 함께 치유해요.'
          ),
          RaisedButton(
            child: Text('우울진단 하러가기'),
            onPressed: () {

            },
          ),
        ],
      ),
    );
    }
  }


class _mainscreens extends State<mainscreens> {
  int _selectedIndex = 0;
  final List _widgetOptions = [
    const DiaryListWidget(),
    CalendarPage2(),
    const twoWeeksAnalysisWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dear My Diary'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.lightBlue.shade900,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '일기목록',
            icon: FaIcon(FontAwesomeIcons.book),
          ),
          // BottomNavigationBarItem(
          //   label: '일기분석',
          //   icon: Icon(Icons.article),
          // ),
          BottomNavigationBarItem(
            label: '월별분석',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: '우울분석',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
    );
  }
}
 
