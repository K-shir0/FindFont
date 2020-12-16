import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';

import '../main.dart';


class CameraResultPage extends HookWidget {
  final int id;
  final _scanResultApplicationService;

  CameraResultPage(this._scanResultApplicationService ,this.id);

  // 取ってくる処理

  @override
  Widget build(BuildContext context) {
    var scanResultApplicationService = _scanResultApplicationService;
    ScanResult scanResult = scanResultApplicationService.getById(id);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                onChanged: (bool value) {},
                value: true,
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
                                scanResult.fontInformationList[0].fontFamily),
                      ),
                    )),
              ),
              Text(
                scanResult.fontInformationList[0].fontName +
                    (scanResult.fontInformationList[0].style != ''
                        ? ('- ' + scanResult.fontInformationList[0].style)
                        : ''),
                style: TextStyle(fontSize: 24),
              )
            ],
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
                      OtherFont(scanResult.fontInformationList[1]),
                      OtherFont(scanResult.fontInformationList[2]),
                      OtherFont(scanResult.fontInformationList[3]),
                      OtherFont(scanResult.fontInformationList[4]),
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

  OtherFont(this.fontInformation);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Checkbox(
            onChanged: (bool value) {},
            value: true,
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
    );
  }
}
