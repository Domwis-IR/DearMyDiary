import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

void main() {
  runApp(const Mymeditation());
}

class Mymeditation extends StatelessWidget {
  const Mymeditation({Key? key}) : super(key: key);

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
      home: meditation_rcmd(title: 'Dear My Diary'),
    );
  }
}

class meditation_rcmd extends StatefulWidget {
  const meditation_rcmd({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<meditation_rcmd> createState() => _meditation_rcmd();
}

class _meditation_rcmd extends State<meditation_rcmd> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  @override
  initState(){
    super.initState();
  }

  void playYoutubeVideo1(){
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: "<API_KEY>", videoUrl: "https://www.youtube.com/watch?v=RtPwBk0pqKE"
    );
  }
  void playYoutubeVideo2(){
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: "<API_KEY>", videoUrl: "https://www.youtube.com/watch?v=2N4eTTipm9I"
    );
  }
  void playYoutubeVideo3(){
    FlutterYoutube.playYoutubeVideoByUrl(
        apiKey: "<API_KEY>", videoUrl: "https://www.youtube.com/watch?v=yiysD0Jl2Wo"
    );
  }
  Widget build(BuildContext context) {
    return new MaterialApp(
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
              Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: Row(children: <Widget>[
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),),
                SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset('lib/assets/video1.png')
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),),
                new Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new RaisedButton(
                      child: new Text("영상 연결"),
                      onPressed: playYoutubeVideo1
                  ),
                ),
                ],
                ),
              ),

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

              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Row(children: <Widget>[
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),),
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('lib/assets/video2.png')
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),),
                  new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new RaisedButton(
                        child: new Text("영상 연결"),
                        onPressed: playYoutubeVideo2
                    ),
                  ),
                ],
                ),
              ),
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

              Container(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Row(children: <Widget>[
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 30, 0),),
                  SizedBox(
                      height: 200,
                      width: 200,
                      child: Image.asset('lib/assets/video3.png')
                  ),
                  Padding(padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),),
                  new Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new RaisedButton(
                        child: new Text("영상 연결"),
                        onPressed: playYoutubeVideo3
                    ),
                  ),
                ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}