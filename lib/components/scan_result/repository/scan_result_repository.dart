import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/model/scan_result_factory.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';

class ScanResultRepository {
  Box _scan_result_box;
  Box _fontInformationBox;

  init() async {
    print("openBox");
    this._scan_result_box = await Hive.openBox('scanResults');
    this._fontInformationBox = await Hive.openBox('fontInformations');

    _fontInformationBox.clear();

    if(_fontInformationBox.length == 0) {
      print("FontList初期化処理");
      // _fontInformationBox.add(new FontInformation(fontFamily, fontName, style, favorite));
    }

    print("box設置完了");
  }

  Future<void> store(String path, String filename) async {
    final url = DotEnv().env['FIND_FONT_SERVER_URL'];

    Dio dio = new Dio();

    FormData formData = new FormData.fromMap(
        {"photo": await MultipartFile.fromFile(path, filename: filename)});

    // 取得処理
    // try {
    //   final response = await dio.post(url, data: formData);
    //
    //   // 送信成功
    //   print(response);
    // } on DioError catch (e) {
    //   print(e.message);
    // }

    Map<String, dynamic> test =
        json.decode('{"model":"VGG16","prediction":[40,68,72,95,174]}');

    var prediction = test['prediction'];

    // _scan_result_box.clear();

    // データの保存
    ScanResultFactory scanResultFactory = new ScanResultFactory();
    ScanResult scanResult = scanResultFactory.create();

    scanResult.fontInformationList = HiveList(_fontInformationBox);

    for (int a in prediction) {
      // 配列への問合せ
      FontInformation fontInformation =
          new FontInformation("aaa", "aaa", "aaa", true);
      _fontInformationBox.add(fontInformation);
      scanResult.fontInformationList.add(fontInformation);
    }

    print(scanResult.fontInformationList);

    print("保存");
    _scan_result_box.add(scanResult);

    print(_scan_result_box.length);
    print(_scan_result_box.getAt(0)?.id);
    print(_scan_result_box.getAt(0)?.fontInformationList[0].fontFamily);

    // _box.put('name', 'David');

    // print(_box.get('name'));

    // print(test['prediction']);

    print("test");
  }

  getAll() {
    List _scanResultList = [];

    print("BOXの長さ " + _scan_result_box.length.toString());

    for (var i = 0; i < _scan_result_box.length; i++) {
      _scanResultList.add(_scan_result_box.getAt(i));
    }

    return _scanResultList;
  }
}
