import 'package:flutter/material.dart';
//import 'package:flutter_youtube/flutter_youtube.dart';

class Mymeditation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue.shade900,
        ),
      ),
      home: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text('명상 추천'),
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),),
              Text.rich(
                  TextSpan(
                    children: <TextSpan> [
                      TextSpan(
                          text: '첫번째 명상 영상',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                      ),
                      TextSpan(
                          text: '\n[명상음악]하루10분 만병을 치료해주는 ...',
                          style: TextStyle(
                              fontSize: 17)
                      ),
                      TextSpan(
                          text: '\n조회수 : 1192만회',
                          style: TextStyle(
                              fontSize: 17)
                      ),

                    ],
                  ),
                  textAlign: TextAlign.center
              ),
              SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset('lib/assets/video1.png')
              ),
              Text.rich(
                TextSpan(
                    text: '\nhttps://www.youtube.com/watch?v=RtPwBk0pqKE',
                    style: TextStyle(
                        fontSize: 17)
                ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),),

              Text.rich(
                  TextSpan(
                    children: <TextSpan> [
                      TextSpan(
                          text: '두번째 명상 영상',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                      ),
                      TextSpan(
                          text: '\n티벳 대형 싱잉볼 연주(극저음) 명상음악/...',
                          style: TextStyle(
                              fontSize: 17)
                      ),
                      TextSpan(
                          text: '\n조회수 : 708만회',
                          style: TextStyle(
                              fontSize: 17)
                      ),

                    ],
                  ),
                  textAlign: TextAlign.center
              ),
              SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset('lib/assets/video2.png')
              ),
              Text.rich(
                    TextSpan(
                        text: '\nhttps://www.youtube.com/watch?v=2N4eTTipm9I',
                        style: TextStyle(
                            fontSize: 17)
                    ),
              ),

              Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),),
              Text.rich(
                  TextSpan(
                    children: <TextSpan> [
                      TextSpan(
                          text: '세번째 명상 영상',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20)
                      ),
                      TextSpan(
                          text: '\n10분명상-당신의 삶에 명상이 필요할 때',
                          style: TextStyle(
                              fontSize: 17)
                      ),
                      TextSpan(
                          text: '\n조회수 : 50만회',
                          style: TextStyle(
                              fontSize: 17)
                      ),

                    ],
                  ),
                  textAlign: TextAlign.center
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),),
              SizedBox(
                  height: 100,
                  width: 200,
                  child: Image.asset('lib/assets/video3.png')
              ),
              Text.rich(
                    TextSpan(
                        text: '\nhttps://www.youtube.com/watch?v=yiysD0Jl2Wo',
                        style: TextStyle(
                            fontSize: 17)
                    ),
              ),
              Padding(padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),),

            ],
          ),
        ),
      ),
    );
  }
}
