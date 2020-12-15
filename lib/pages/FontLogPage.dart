import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:intl/intl.dart';

import '../main.dart';

final _scanResultServiceProvider =
    ChangeNotifierProvider((ref) => new ScanResultApplicationServiceNotifier());

class FontLogPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    List scanResult = context
        .read(_scanResultServiceProvider)
        .scanResultApplicationService
        .index();

    return Scaffold(
      appBar: new AppBar(
        title: new Text('フォント履歴'),
        centerTitle: true,
      ),
      // scanResultがnullかどうか
      body: !scanResult.isEmpty
          ? ListView.builder(
              padding: EdgeInsets.only(top: 1, bottom: 1),
              itemBuilder: (BuildContext context, int index) {
                print(index);

                if (index < scanResult.length) {
                  var scanLog = scanResult[index];
                  return _fontLogList(scanLog, context, index);
                }
              },
            )
          : Container(),
    );
  }

  Widget _fontLogList(ScanResult scanResult, BuildContext context, int index) {
    var formatter = new DateFormat('yyyy.MM.dd');
    var fontInformation = scanResult.fontInformationList[0];

    print(fontInformation.fontName);

    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: GestureDetector(
        onTap: () {
          print(index);
          Navigator.of(context).pushNamed('/font_result/' + index.toString());
        },
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
                flex: 9,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 32, right: 12),
                      child: Container(
                          width: 50,
                          child: Center(
                            child: Text(
                              'F',
                              style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: fontInformation.fontFamily),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        fontInformation.fontName,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Text(
                      fontInformation.style != ""
                          ? '- ' + fontInformation.style
                          : '',
                      style: TextStyle(fontSize: 12),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 3,
                child: Row(
                  children: [
                    Text(
                      formatter.format(scanResult.dateTime),
                      style: TextStyle(fontSize: 12),
                    ),
                    Padding(
                        padding: EdgeInsets.only(right: 8, left: 16),
                        child: SvgPicture.asset('assets/svg/next.svg'))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
