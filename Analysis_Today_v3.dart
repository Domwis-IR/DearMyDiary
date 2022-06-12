import 'package:flutter/material.dart';

import 'Main_Screens.dart';
import 'package:date_format/date_format.dart';
import 'package:timer_builder/timer_builder.dart';
import 'Diagnosis_Test.dart';
import 'ML_service.dart';
import 'dart:typed_data';


class AnalysisToday extends StatefulWidget {
  final String _mlinput;
  AnalysisToday(this._mlinput,{Key? key}) : super(key: key);
  @override
  _AnalysisToday createState() => _AnalysisToday();
}

class _AnalysisToday extends State<AnalysisToday> {
  //_AnalysisToday(this._mlinput,{Key? key}) : super(key: key);
  //const AnalysisToday({Key? key}) : super(key: key);

  final todayfeedback =
      '오늘은 행복한 하루를 보내셨군요. 그 감정 그대로 내일도 함께 힘내봐요:)';

  MLService _mlService = MLService();

  List result = [];

  void mlText() async {
    setState(() {
      result = [];
    });
    List Inputdata = await _mlService.analyzeSentiment(widget._mlinput);
    setState(() {
      result = Inputdata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(widget._mlinput),
          Text(result.length.toString()),
          IconButton(
            icon: Icon(Icons.image),
            onPressed: mlText,
          ),
          Text(result.length.toString()),

          Text.rich(
              TextSpan(
                children: <TextSpan> [
                  TextSpan(
                      text: '오늘의 감정분포',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20)
                  ),
                  TextSpan(
                      text: '\n회원님의 일기를 기반으로 AI가 분석한 내용이에요.',
                      style: TextStyle(
                          fontSize: 17)
                  ),
                ],
              ),
              textAlign: TextAlign.center
          ),
          Padding(padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),),
          Center(child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Row(children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.favorite,
                  ),
                  Text(
                      '기쁨'
                  ),
                  Text(
                      '95%'
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.grain_sharp,
                  ),
                  Text(
                      '슬픔'
                  ),
                  Text(
                      '0%'
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.local_fire_department,
                  ),
                  Text(
                      '분노'
                  ),
                  Text(
                      '0%'
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.dark_mode,
                  ),
                  Text(
                      '불안'
                  ),
                  Text(
                      '2%'
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.cloudy_snowing,
                  ),
                  Text(
                      '상처'
                  ),
                  Text(
                      '0%'
                  ),
                ],
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 39, 0),),
              Column(
                children: <Widget>[
                  Icon(
                    Icons.contact_support,
                  ),
                  Text(
                      '당황'
                  ),
                  Text(
                      '3%'
                  ),
                ],
              ),
            ],
            ),
          ),),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          ),

          Text.rich(
            TextSpan(
              children: <TextSpan> [
                TextSpan(
                    text: '오늘의 한마디',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20)
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
            child: Text(
                '\n$todayfeedback',
                textAlign: TextAlign.justify
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          ),

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
              Navigator.pop(
                  context,
                  MaterialPageRoute(builder: (context) => DiagnosisTest())
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
          ),
          RaisedButton(
            child: Text('메인화면으로'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyScreen(widget._mlinput))
              );
            },
          ),
        ],
      ),
    );
  }
}

class MainRoute extends StatelessWidget {
  final String _mlinput;
  MainRoute(this._mlinput,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('오늘의 일기 분석'),
        ),
        body: AnalysisToday(_mlinput)
    );
  }
}
