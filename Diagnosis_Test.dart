import 'package:flutter/material.dart';
import 'Diagnosis_Result.dart';
void main(){
  runApp(const DiagnosisTestPage());
}

class DiagnosisTestPage extends StatelessWidget {
  const DiagnosisTestPage({Key? key}) : super(key: key);

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
      home: DiagnosisTest(),
    );
  }
}

class LabeledRadio extends StatelessWidget {
  const LabeledRadio({
    Key? key,
    required this.label,
    required this.padding,
    required this.groupValue,
    required this.value,
    required this.onChanged,
  }) : super(key: key);

  final String label;
  final EdgeInsets padding;
  final int groupValue;
  final int value;
  final ValueChanged<int> onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (value != groupValue) {
          onChanged(value);
        }
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Radio<int>(
              groupValue: groupValue,
              value: value,
              onChanged: (int? newValue) {
                onChanged(newValue!);
              },
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class DiagnosisTest extends StatefulWidget{
  const DiagnosisTest({Key? key}) : super(key: key);

  @override
  State<DiagnosisTest> createState() => _DiagnosisTest();
}


class _DiagnosisTest extends State<DiagnosisTest>{
  final List<String> questions = <String>["일 또는 여가 활동을 하는데 흥미나 즐거움을 느끼지 못함",
                                          "기분이 가라앉거나, 우울하거나, 희망이 없음",
                                          "잠이 들거나 계속 잠을 자는 것이 어려움, 또는 잠을 너무 많이 잠",
                                          "피곤하다고 느끼거나 기운이 거의 없음",
                                          "입맛이 없거나 과식을 함",
                                          "자신을 부정적으로 봄, 혹은 자신이 실패자라고 느끼거나 자신 또는 가족을 실망시킴",
                                          "신문을 읽거나 텔레비전 보는 것과 같은 일에 집중하는 것이 어려움",
                                          "다른사람들이 주목할 정도로 너무 느리게 움직이거나 말을 함, 또는 반대로 평상시보다 많이 움직여서 너무 안절부절 못하거나 들떠 있음",
                                          "자신이 죽는 것이더 낫다고 생각하거나 어떤 식으로든 자신을 해칠 것이라고 생각함"];
  final List<String> answers = <String>["전혀 방해 받지 않았다",
                                        "며칠 동안 방해 받았다",
                                        "7일 이상 방해 받았다",
                                        "거의 매일 방해 받았다"];
  int _isRadioSelected = 0;
  List<int> answer_int = <int>[-1,-1,-1,-1,-1,-1,-1,-1,-1];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('우울 진단검사'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(child:
            ListView.separated(
              //scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              padding: const EdgeInsets.all(8),
              itemCount: questions.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  //height: 100,
                  children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child:
                        Text(
                          '${index + 1}. ${questions[index]}',
                          style: const TextStyle(
                              height: 5, fontSize: 14, color: Colors.black),
                        )
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <LabeledRadio>[
                        LabeledRadio(
                          label: "전혀 방해 받지 않았다",
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 0,
                          groupValue: answer_int[index],
                          onChanged: (int newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                        LabeledRadio(
                          label: "며칠 동안 방해 받았다",
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 1,
                          groupValue: _isRadioSelected,
                          onChanged: (int newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                        LabeledRadio(
                          label: "7일 이상 방해 받았다",
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 2,
                          groupValue: _isRadioSelected,
                          onChanged: (int newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                        LabeledRadio(
                          label: "거의 매일 방해 받았다",
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          value: 3,
                          groupValue: _isRadioSelected,
                          onChanged: (int newValue) {
                            setState(() {
                              _isRadioSelected = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            ),
        ),
        Center(
         child:
          ElevatedButton(
            child: Text('결과보기'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyDiagnosisResult())
              );
            },
          ),
        )
      ],)
    );
  }
}
