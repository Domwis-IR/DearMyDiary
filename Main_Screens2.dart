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
import 'Diary_View.dart';
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
    return GestureDetector(
        onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DiaryView())
      );
    },
    child:  Padding(
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
          title: '????????? ????????? ???',
          content: '?????? ?????? ??????????????? ???????????? ????????????.'
              '???????????? ????????? ?????????.',
          publishDate: '11??? 28???',
        ),
        CustomListItemTwo(
          thumbnail: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: '???????????? ??????...',
          content: '???????????? ????????? ??? ????????????.''???????????? ????????????.',
          publishDate: '12??? 15???',
        ),
      ],
    );
  }
}

class CalendarPage2 extends StatefulWidget {
  @override
  _CalendarPage2State createState() => new _CalendarPage2State();
}

List<DateTime> happyDates = [
  DateTime(2022, 6, 1),
];

List<DateTime> sadDates = [
  DateTime(2022, 6, 2),
];

List<DateTime> angryDates = [
  DateTime(2022, 6, 3),
];

List<DateTime> anxiousDates = [
  DateTime(2022, 6, 4),
];

List<DateTime> hurtDates = [
  DateTime(2022, 6, 5),
];

List<DateTime> embarrassedDates = [
  DateTime(2022, 6, 6),
];

class _CalendarPage2State extends State<CalendarPage2> {
  DateTime _currentDate2 = DateTime.now();
  static Widget _happyIcon(String day) => CircleAvatar(
    backgroundColor: Colors.yellow,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _sadIcon(String day) => CircleAvatar(
    backgroundColor: Colors.blueAccent,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _angryIcon(String day) => CircleAvatar(
    backgroundColor: Colors.red,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _anxiousIcon(String day) => CircleAvatar(
    backgroundColor: Colors.purple,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _hurtIcon(String day) => CircleAvatar(
    backgroundColor: Colors.orange,
    child: Text(
      day,
      style: TextStyle(
        color: Colors.black,
      ),
    ),
  );
  static Widget _embarrassedIcon(String day) => CircleAvatar(
    backgroundColor: Colors.green,
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

  var len = min(happyDates.length, sadDates.length);
  late double cHeight;

  @override
  Widget build(BuildContext context) {
    cHeight = MediaQuery.of(context).size.height;
    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        happyDates[i],
        new Event(
          date: happyDates[i],
          title: 'Happy',
          icon: _happyIcon(
            happyDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        sadDates[i],
        new Event(
          date: sadDates[i],
          title: 'Sad',
          icon: _sadIcon(
            sadDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        angryDates[i],
        new Event(
          date: angryDates[i],
          title: 'Angry',
          icon: _angryIcon(
            angryDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        anxiousDates[i],
        new Event(
          date: anxiousDates[i],
          title: 'Anxious',
          icon: _anxiousIcon(
            anxiousDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        hurtDates[i],
        new Event(
          date: hurtDates[i],
          title: 'Hurt',
          icon: _hurtIcon(
            hurtDates[i].day.toString(),
          ),
        ),
      );
    }

    for (int i = 0; i < len; i++) {
      _markedDateMap.add(
        embarrassedDates[i],
        new Event(
          date: embarrassedDates[i],
          title: 'Embarrassed',
          icon: _embarrassedIcon(
            embarrassedDates[i].day.toString(),
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
            markerRepresent(Colors.yellow, "Happy"),
            markerRepresent(Colors.blueAccent, "Sad"),
            markerRepresent(Colors.red, "Angry"),
            markerRepresent(Colors.purple, "Anxious"),
            markerRepresent(Colors.orange, "Hurt"),
            markerRepresent(Colors.green, "Embarrassed"),
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
                      text: '?????? ?????? ??????',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      )
                  ),
                  TextSpan(
                      text: '\n2?????? ????????? ???????????? ???????????????.',
                      style: TextStyle(
                          fontSize: 18)
                  ),
                ],
              ),
              textAlign: TextAlign.center
          ),
          DataTable(
            columns: [
              DataColumn(label: Text('??????')),
              DataColumn(label: Text('????????????')),
            ],
            rows: [
              for (int i = 0; i < 14; i++)
                DataRow(
                    cells: [
                      DataCell(Text(formatDate(
                          DateTime.now().subtract(Duration(days: i)), ['20', yy, '-', M, '-', d]))),
                      DataCell(Text('???????????? ????????? ??????')),
                    ]
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          ),
          Text(
              '2?????? ?????? ????????? ????????? ????????????????????????. ??????????????? 2?????? ???????????? ???????????? ????????????. ????????? ???????????? ?????? ????????????.'
          ),
          RaisedButton(
            child: Text('???????????? ????????????'),
            onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DiagnosisTest(  ))
                );
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
        //?????? ????????? Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: '????????????',
            icon: FaIcon(FontAwesomeIcons.book),
          ),
          BottomNavigationBarItem(
            label: '????????????',
            icon: Icon(Icons.calendar_today),
          ),
          BottomNavigationBarItem(
            label: '????????????',
            icon: Icon(Icons.favorite),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
 
