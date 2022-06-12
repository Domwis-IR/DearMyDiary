import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class MLService {
  Dio dio = Dio();

  Future<List> analyzeSentiment (String inputstring) async {
    Response response = await dio.post('http://localhost:5000/',
        data: {
          'text': inputstring
        }
    );
    //return [inputstring];

    try {
      Response response = await dio.post('http://localhost:5000/',
          data: {
            'text': inputstring
          }
      );
      //return [inputstring];
      List result = response.data;
      return result;
    } catch (e) {
      return [];
    }
  }
}
