import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:path/path.dart';

class FontInformationPage extends HookWidget {
  final ScanResultApplicationService scanResultApplicationService;
  final int id;

  FontInformationPage(this.scanResultApplicationService, this.id);

  var alphabet =
      "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890‘?’“!”(%)[#]{@}/&\<-+÷×=>®©\$€£¥¢:;,.*";

  @override
  Widget build(BuildContext context) {
    FontInformation fontInformation =
        scanResultApplicationService.getFontInformationById(id);

    var str = useState("Paths are made by walking.");

    return Scaffold(
      appBar: new AppBar(
        title: new Text('フォント情報'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "フォント名",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFD9D9D9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                            fontInformation.fontFamily),
                      ),
                    )),
              ),
              Expanded(
                child: Text(
                  fontInformation.fontName +
                      (fontInformation.style != ''
                          ? ('- ' + fontInformation.style)
                          : ''),
                  style: TextStyle(fontSize: 24),
                  textAlign: TextAlign.center,
                  softWrap: false,
                  overflow: TextOverflow.fade,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "スタイル",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFD9D9D9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: "文字を入力",
                labelStyle: TextStyle(
                  color: Color(0xFFD9D9D9),
                ),
              ),
              style: TextStyle(
                fontSize: 18
              ),
              initialValue: str.value,
              onChanged: (value) {
                str.value = value;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, top: 16),
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                    bottom: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                  )),
              height: 64,
              // color: Colors.amber[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 11,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            str.value,
                            style: TextStyle(fontSize: 18, fontFamily: fontInformation.fontFamily),
                            softWrap: false,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              "字体",
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFFD9D9D9),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          GridView.count(
            crossAxisCount: 6,
            padding: EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: alphabet.codeUnits.map((value) {
              return Container(
                alignment: Alignment.center,
                // margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xffF2F2F2)),
                ),
                child: Text(
                  "${String.fromCharCode(value)}",
                  style: TextStyle(
                      fontSize: 24, fontFamily: fontInformation.fontFamily),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
