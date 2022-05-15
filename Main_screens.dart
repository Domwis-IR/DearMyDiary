import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: mainscreens(title: 'Dear My Diary'),
    );
  }
}

class mainscreens extends StatefulWidget {
  const mainscreens({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<mainscreens> createState() => _mainscreens();
}

class _mainscreens extends State<mainscreens> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dear My Diary'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex, //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items:[
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: '일기분석',
            icon: Icon(Icons.article),
          ),
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
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  List _widgetOptions = [
    Text(
      '홈화면',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),

    Text(
      '일기분석화면',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),

    Text(
      '월별분석화면',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),

    SingleChildScrollView(
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
    ),
  ];
}
