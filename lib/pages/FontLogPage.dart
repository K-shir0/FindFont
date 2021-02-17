import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'SettingPage.dart';

class FontLogPage extends HookWidget {
  final textStyle = TextStyle(fontSize: 14,color: Color(0xFF639CBF), fontWeight: FontWeight.bold);

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
              "うまくスキャンできない",
              style: textStyle,
            ),
            onTapHandler: () =>
                Navigator.pushNamed(context, '/help/umaku_skyan'),
          ),
          UsageButtonItem(
            title: Text(
              "和文フォントをスキャンしたい",
              style: textStyle,
            ),
            onTapHandler: () => Navigator.pushNamed(context, '/help/wabun'),
          ),
          UsageButtonItem(
            title: Text(
              "フォントをダウンロードしたい",
              style: textStyle,
            ),
            onTapHandler: () =>
                Navigator.pushNamed(context, '/help/font_download'),
          ),
        ],
      ),
    );
  }
}
