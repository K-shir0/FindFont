import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';

class SettingPage extends HookWidget {
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
          _HelpButtonItem(),
          _FavoriteButtonItem()
        ],
      ),
    );
  }
}

class _HelpButtonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: GestureDetector(
        onTap: () {
          print("ヘルプボタンが押された");
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
                      padding: EdgeInsets.only(left: 16, right: 12),
                      child: Container(
                        width: 50,
                        child: Center(
                            child:
                            SvgPicture.asset('assets/svg/help.svg')),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "ヘルプ",
                        style: TextStyle(fontSize: 14),
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

class _FavoriteButtonItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12, bottom: 12),
      child: GestureDetector(
        onTap: () {
          print("お気に入りボタンが押された");
          Navigator.of(context).pushNamed('/favorite');
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
                      padding: EdgeInsets.only(left: 16, right: 12),
                      child: Container(
                        width: 50,
                        child: Center(
                            child:
                            SvgPicture.asset('assets/svg/favorite.svg')),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Text(
                        "お気に入り",
                        style: TextStyle(fontSize: 14),
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