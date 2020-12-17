import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class FavoriteListPage extends HookWidget {
  final ScanResultApplicationService _scanResultService;

  // コンストラクタ
  FavoriteListPage(this._scanResultService);

  @override
  Widget build(BuildContext context) {
    List _fontInformationFavoriteList =
        _scanResultService.getFavoriteFontList();

    return Scaffold(
      appBar: new AppBar(
        title: new Text('お気に入り'),
        centerTitle: true,
      ),
      // scanResultがnullかどうか
      body: _fontInformationFavoriteList.length != 0
          ? ListView.builder(
              padding: EdgeInsets.only(top: 1, bottom: 1),
              itemBuilder: (BuildContext context, int index) {
                print(index);

                if (index < _fontInformationFavoriteList.length) {
                  return _fontLogList(
                      _fontInformationFavoriteList[index], context, index);
                }
              },
            )
          : Container(),
    );
  }

  Widget _fontLogList(
      FontInformation fontInformation, BuildContext context, int index) {
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
                flex: 11,
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
                flex: 1,
                child: Row(
                  children: [
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
