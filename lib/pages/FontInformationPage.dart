import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
        centerTitle: true,
      ),
      body: new Container(
        child: GridView.count(
          crossAxisCount: 6,
          padding: EdgeInsets.all(20),
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
      ),
    );
  }
}
