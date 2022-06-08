import 'dart:typed_data';
import 'ML_service.dart';
import 'Main_Screens.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

class AnalysisToday extends StatefulWidget {
  const AnalysisToday({Key? key}) : super(key: key);

  @override
  State<AnalysisToday> createState() => _AnalysisTodayState();
}

class _AnalysisTodayState extends State<AnalysisToday> {
  MLService _mlService = MLService();
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

void selectImage() async {
  setState(() {
    defaultImage = '';
    cartoonImage = '';
  });

  String imageData = 'a';

  if (imageData != '') {
    setState(() {
      defaultImage = imageData;
    });

    var cartoonImageData = await _mlService.analyzeSentiment(imageData);

    setState(() {
      if (cartoonImageData == '') {
        cartoonImage = '';
      } else {
        cartoonImage = cartoonImageData;
      }
    });
  } else {
    setState(() {
      defaultImage = '';
      cartoonImage = '';
    });
  }
