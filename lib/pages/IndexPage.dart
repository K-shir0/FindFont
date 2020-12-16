import 'package:find_font/components/_top_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatelessWidget {
  final double topIconMainSize = 154.0;
  final double topIconSubButtonSize = 106.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('ホーム'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 64.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: topIconMainSize,
                          height: topIconMainSize,
                          child: FloatingActionButton(
                            heroTag: 'TopButtonCamera',
                            onPressed: () =>
                                Navigator.of(context).pushNamed('/camera'),
                            child: TopButton(
                              width: topIconMainSize,
                              height: topIconMainSize,
                              svgPath: 'assets/svg/icon_camera.svg',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            '手書き文字をスキャン',
                            style: TextStyle(
                              fontFamily: 'YuGothic',
                              fontSize: 18,
                              color: const Color(0xff5b5b5b),
                              letterSpacing: -0.8099999999999999,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Container(
                            width: topIconSubButtonSize,
                            height: topIconSubButtonSize,
                            child: FloatingActionButton(
                              heroTag: 'TopButtonFontLog',
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/font_log'),
                              child: TopButton(
                                width: topIconSubButtonSize,
                                height: topIconSubButtonSize,
                                svgPath: 'assets/svg/icon_top_history.svg',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'フォント履歴',
                            style: TextStyle(
                              fontFamily: 'YuGothic',
                              fontSize: 16,
                              color: const Color(0xff5b5b5b),
                              letterSpacing: -0.72,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                            width: topIconSubButtonSize,
                            height: topIconSubButtonSize,
                            child: FloatingActionButton(
                              heroTag: 'TopButtonSetting',
                              onPressed: () =>
                                  Navigator.of(context).pushNamed('/setting'),
                              child: TopButton(
                                width: topIconSubButtonSize,
                                height: topIconSubButtonSize,
                                svgPath: 'assets/svg/icon_top_setting.svg',
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            '設定',
                            style: TextStyle(
                              fontFamily: 'YuGothic',
                              fontSize: 16,
                              color: const Color(0xff5b5b5b),
                              letterSpacing: -0.72,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
