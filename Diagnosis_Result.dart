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
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.lightBlue.shade900,
        ),
      ),
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
              Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),),
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
      DataTable(
        columns: [
          DataColumn(label: Text('점수')),
          DataColumn(label: Text('분류')),
        ],
        rows: [
          DataRow(
              cells: [
                DataCell(Text('0 ~ 4점', style: TextStyle(fontSize: 13))),
                DataCell(Text('우울아님', style: TextStyle(fontSize: 13))),
              ]
          ),
          DataRow(
              cells: [
                DataCell(Text('5 ~ 9점', style: TextStyle(fontSize: 13))),
                DataCell(Text('가벼운 우울', style: TextStyle(fontSize: 13))),
              ]
          ),
          DataRow(
              cells: [
                DataCell(Text('10 ~ 19점', style: TextStyle(fontSize: 12))),
                DataCell(Text('중간정도의 우울 \n(가까운 지역센터나 전문기관 방문을 요망합니다.)', style: TextStyle(fontSize: 12))),
              ]
          ),
          DataRow(
              cells: [
                DataCell(Text('20 ~ 27점', style: TextStyle(fontSize: 12))),
                DataCell(Text('심한 우울 \n(전문기관의 치료적 개입과 평가가 필요합니다.)', style: TextStyle(fontSize: 12))),
              ]
          ),
        ],
      ),
      Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),),
      Text.rich(
          TextSpan(
            children: <TextSpan> [
              TextSpan(
                  text: '귀하의 우울증 척도 테스트결과 점수는',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
              ),
              TextSpan(
                  text: '6점',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.red,
                      decoration: TextDecoration.underline)
              ),
              TextSpan(
                  text: '입니다.',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20)
              ),
              TextSpan(
                  text: '\n우울감을 완화할 수 있도록 명상을 통한 인지치료를 추천드릴게요.',
                  style: TextStyle(
                      fontSize: 17)
              ),
            ],
          ),
          textAlign: TextAlign.center
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
