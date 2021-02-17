import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import 'SettingPage.dart';

 class HelpPage extends HookWidget {
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
          UsageButtonItem(
            title: Text(
              "使い方",
              style: textStyle,
            ),
            svgPicture: SvgPicture.asset('assets/svg/syoshinsya.svg'),
            onTapHandler: () => Navigator.pushNamed(context, '/usage'),
          ),
          UsageButtonItem(
            title: Text(
              "ヘルプ",
              style: textStyle,
            ),
            svgPicture: SvgPicture.asset('assets/svg/question.svg'),
            onTapHandler: () {
              print("ヘルプボタンが押された");
            },
          ),
          UsageButtonItem(
            title: Text(
              "お気に入り",
              style: textStyle,
            ),
            svgPicture: SvgPicture.asset('assets/svg/star.svg'),
            onTapHandler: () {
              print("お気に入りボタンが押された");
              Navigator.of(context).pushNamed('/favorite');
            },
          ),
        ],
      ),
    );
  }
}