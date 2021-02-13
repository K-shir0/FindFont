import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:like_button/like_button.dart';

class CameraResultPage extends HookWidget {
  final int id;
  final ScanResultApplicationService _scanResultApplicationService;

  CameraResultPage(this._scanResultApplicationService, this.id);

  // 取ってくる処理
  @override
  Widget build(BuildContext context) {
    ScanResult scanResult = _scanResultApplicationService.getById(id);

    final _checkboxFlg = useState(false);
    final FontInformation topFontInformation =
        scanResult.fontInformationList[0];

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
              Navigator.of(context).pushNamed(
                  '/font_information/' + topFontInformation.id.toString());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: LikeButton(
                    onTap: (bool isLiked) async {
                      // 表示用のフラグを変更
                      _checkboxFlg.value = !_checkboxFlg.value;

                      // 永続化のフラグを変更
                      _scanResultApplicationService
                          .favorite(topFontInformation);

                      return _checkboxFlg.value;
                    },
                    likeBuilder: (bool isLiked) {
                      return Icon(
                        _checkboxFlg.value
                            ? Icons.star_rounded
                            : Icons.star_outline_rounded,
                        color: _checkboxFlg.value ? Colors.amber : Colors.grey,
                        size: 28,
                      );
                    },
                  ),
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
                              fontFamily: topFontInformation.fontFamily),
                        ),
                      )),
                ),
                Flexible(
                  child: Text(
                    topFontInformation.fontName +
                        (topFontInformation.style != ''
                            ? (' - ' + topFontInformation.style)
                            : ''),
                    style: TextStyle(fontSize: 24),
                    softWrap: false,
                    overflow: TextOverflow.fade,
                  ),
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
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 10,
                  child: Column(
                    children: [
                      OtherFont(scanResult.fontInformationList[1],
                          _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[2],
                          _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[3],
                          _scanResultApplicationService),
                      OtherFont(scanResult.fontInformationList[4],
                          _scanResultApplicationService),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 16, left: 8, right: 8),
                        child: RaisedButton(
                          color: Color(0xFF639CBF),
                          onPressed: () =>
                              Navigator.popUntil(context, (route) => route.isFirst),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 1,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 16, right: 16),
                                      child: Icon(
                                        Icons.keyboard_arrow_left_rounded,
                                        size: 32,
                                        color: Colors.white,
                                      ),
                                    )),
                                Expanded(
                                  flex: 10,
                                  child: Text(
                                    "ホームに戻る",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
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
      padding: const EdgeInsets.all(16.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed('/font_information/' + fontInformation.id.toString());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LikeButton(
              onTap: (bool isLiked) async {
                // 表示用のフラグを変更
                checkBoxflg.value = !checkBoxflg.value;

                // 永続化のフラグを変更
                scanResultApplicationService.favorite(fontInformation);

                return checkBoxflg.value;
              },
              likeBuilder: (bool isLiked) {
                return Icon(
                  checkBoxflg.value
                      ? Icons.star_rounded
                      : Icons.star_outline_rounded,
                  color: checkBoxflg.value ? Colors.amber : Colors.grey,
                  size: 24,
                );
              },
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
            Expanded(
              child: Text(
                fontInformation.fontName +
                    (fontInformation.style != ''
                        ? (' - ' + fontInformation.style)
                        : ''),
                style: TextStyle(fontSize: 16),
                softWrap: false,
                overflow: TextOverflow.fade,
              ),
            )
          ],
        ),
      ),
    );
  }
}
