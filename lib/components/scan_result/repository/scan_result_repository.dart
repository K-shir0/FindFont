import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:hive/hive.dart';
// import 'package:hive/hive.dart';

class Todo {
  final int userId;
  final String title;
  final String body;

  Todo(this.userId, this.title, this.body);

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        title = json['title'],
        body = json['body'];
}

class ScanResultRepository {
  // Box _box;
  //
  // init() async {
  //   this._box = await Hive.openBox('scanResultBox');
  // }

  Future<void> store(String path, String filename) async {
    final url = DotEnv().env['FIND_FONT_SERVER_URL'];

    Dio dio = new Dio();

    FormData formData = new FormData.fromMap(
        {"photo": await MultipartFile.fromFile(path, filename: filename)});


    try {
      final response = await dio.post(url, data: formData);

      // 送信成功
      print(response);
    } on DioError catch (e) {
      print(e.message);
    }

    Map<String, dynamic> test =
        json.decode('{"model":"VGG16","prediction":[40,68,72,95,174]}');

    // _box.put('name', 'David');

    // print(_box.get('name'));

    print(test['prediction']);
  }
}
