import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

import 'SettingPage.dart';

class FontLogPage extends HookWidget {
  final textStyle = TextStyle(
      fontSize: 14, color: Color(0xFF639CBF), fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('過去のフォントを見る'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 1, bottom: 1),
        children: [
          UsageButtonItem(
            title: Text(
              "お気に入り",
            ),
            svgPicture: SvgPicture.asset('assets/svg/star.svg'),
            onTapHandler: () => Navigator.of(context).pushNamed('/favorite'),
          ),
          UsageButtonItem(
            title: Text(
              "過去のスキャン履歴",
            ),
            svgPicture: SvgPicture.asset('assets/svg/history.svg'),
            onTapHandler: () => Navigator.of(context).pushNamed('/font_log'),
          ),
        ],
      ),
    );
  }
}
