import 'package:flutter/material.dart';
import 'Meditation_Recommendation.dart';

void main() {
  runApp(const MyDiagnosisResult());
}

class MyDiagnosisResult extends StatelessWidget {
  const MyDiagnosisResult({Key? key}) : super(key: key);

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
      home: diagnosisresult(title: 'Dear My Diary'),
    );
  }
}

class diagnosisresult extends StatefulWidget {
  const diagnosisresult({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<diagnosisresult> createState() => _diagnosisresult();
}

class _diagnosisresult extends State<diagnosisresult> {

  @override
  initState(){
    super.initState();
  }
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
      appBar: new AppBar(
      centerTitle: true,
      title: new Text('진단 결과'),
    ),
    body: new SingleChildScrollView(
    child: new Column(
    children: <Widget>[
      Text.rich(
          TextSpan(
            children: <TextSpan> [
              TextSpan(
                  text: '우울 진단 결과',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
              ),
              TextSpan(
                  text: '\nPHQ-9 설문을 통해 구체적으로 진단된 내용이에요.',
                  style: TextStyle(
                      fontSize: 17)
              ),
            ],
          ),
          textAlign: TextAlign.center
      ),
      Container(
        height: 150,
        color: Colors.amberAccent,
      ),
      RaisedButton(
      child: Text('명상 하러 가기'),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Mymeditation())
          );
        },
      ),
    ],
    ),
    ),
      ),
    );
  }
}