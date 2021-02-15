import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends HookWidget {
  final textStyle = TextStyle(fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('設定'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 1, bottom: 1),
        children: [
          _UsageButtonItem(
            title: Text(
              "お気に入り",
              style: textStyle,
            ),
            svgPicture: SvgPicture.asset('assets/svg/favorite.svg'),
            onTapHandler: () {
              print("お気に入りボタンが押された");
              Navigator.of(context).pushNamed('/favorite');
            },
          ),
          _UsageButtonItem(
            title: Text(
              "ヘルプ",
              style: textStyle,
            ),
            svgPicture: SvgPicture.asset('assets/svg/help.svg'),
            onTapHandler: () {
              print("ヘルプボタンが押された");
            },
          ),
        ],
      ),
    );
  }
}

class _UsageButtonItem extends HookWidget {
  final Text title;
  final SvgPicture svgPicture;
  final Function onTapHandler;

  _UsageButtonItem(
      {@required this.title, this.svgPicture, @required this.onTapHandler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8, bottom: 8),
      child: GestureDetector(
        onTap: onTapHandler,
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
                      padding: EdgeInsets.only(left: 40, right: 12),
                      child: Row(
                        children: [
                          if (svgPicture != null)
                            Padding(
                              padding: const EdgeInsets.only(right: 24.0),
                              child: svgPicture,
                            ),
                          Padding(
                              padding: EdgeInsets.only(right: 10),
                              child: title),
                        ],
                      ),
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
