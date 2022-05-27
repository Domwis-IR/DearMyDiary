import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'Analysis_Today.dart';

class Diary extends StatelessWidget {
  const Diary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
              formatDate(DateTime.now(), ['20',yy, '-', M, '-', d]),
              style: const TextStyle(
              fontSize: 25.0,
              ),
          ),
            const Text(
            "일기제목",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
            const Text(
            "일기내용",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ]);
  }
}


class DiaryView extends StatelessWidget {
  const DiaryView ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        Diary(),
        MainRoute(),
      ],
    );
  }
}
