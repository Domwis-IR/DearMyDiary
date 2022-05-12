import 'package:flutter/material.dart';

class MainRoute extends StatelessWidget {

  final todayfeedback =
      '오늘은 행복한 하루를 보내셨군요. 그 감정 그대로 내일도 함께 힘내봐요:)';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('오늘의 일기 분석'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
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
            Container(
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
            ),

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
            Container(
              height: 150,
              color: Colors.blueAccent,

            ),
            Container(
              height: 150,
              color: Colors.blueAccent,

            ),
            RaisedButton(
              child: Text('명상하러가기'),
              onPressed: () {
                Navigator.pop(
                    context
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            ),
            RaisedButton(
              child: Text('메인화면으로'),
              onPressed: () {
                Navigator.pop(
                    context
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}