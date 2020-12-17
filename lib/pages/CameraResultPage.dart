import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../main.dart';

class CameraResultPage extends HookWidget {
  final int id;
  final ScanResultApplicationService _scanResultApplicationService;

  CameraResultPage(this._scanResultApplicationService, this.id);

  // 取ってくる処理
  @override
  Widget build(BuildContext context) {
    ScanResult scanResult = _scanResultApplicationService.getById(id);

    final _checkboxFlg = useState(false);
    final FontInformation topFontInformation = scanResult.fontInformationList[0];

    _checkboxFlg.value = topFontInformation.favorite;

    return Scaffold(
      appBar: new AppBar(
        title: new Text('スキャン結果'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text("一番一致したフォント", style: TextStyle(fontSize: 14)),
          ),
          GestureDetector(
            onTap: () {
              print("一番一致したフォント");
              Navigator.of(context).pushNamed('/font_information/' + topFontInformation.id.toString());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  onChanged: (bool value) {
                    // 表示用のフラグを変更
                    _checkboxFlg.value = !_checkboxFlg.value;

                    // 永続化のフラグを変更
                    _scanResultApplicationService.favorite(topFontInformation);
                  },
                  value: _checkboxFlg.value,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                      width: 50,
                      child: Center(
                        child: Text(
                          'F',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily:
                                  topFontInformation.fontFamily),
                        ),
                      )),
                ),
                Text(
                  topFontInformation.fontName +
                      (topFontInformation.style != ''
                          ? ('- ' + topFontInformation.style)
                          : ''),
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 32.0, right: 32.0, top: 8, bottom: 8),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 16),
            child: Text("その他候補のフォント", style: TextStyle(fontSize: 14)),
          ),
          Container(
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    children: [
                      OtherFont(scanResult.fontInformationList[1], _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[2], _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[3], _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[4], _scanResultApplicationService),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtherFont extends HookWidget {
  FontInformation fontInformation;
  ScanResultApplicationService scanResultApplicationService;

  OtherFont(this.fontInformation, this.scanResultApplicationService);

  @override
  Widget build(BuildContext context) {
    // お気に入り用のフラグ
    var checkBoxflg = useState(fontInformation.favorite);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed('/font_information/' + fontInformation.id.toString());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Checkbox(
              onChanged: (bool value) {
                // 表示用のフラグを変更
                checkBoxflg.value = !checkBoxflg.value;

                // 永続化のフラグを変更
                scanResultApplicationService.favorite(fontInformation);
              },
              value: checkBoxflg.value,
            ),
            Padding(
              padding: EdgeInsets.only(),
              child: Container(
                  width: 50,
                  child: Center(
                    child: Text(
                      'F',
                      style: TextStyle(
                          fontSize: 24, fontFamily: fontInformation.fontFamily),
                    ),
                  )),
            ),
            Text(
              fontInformation.fontName +
                  (fontInformation.style != ''
                      ? (' - ' + fontInformation.style)
                      : ''),
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
