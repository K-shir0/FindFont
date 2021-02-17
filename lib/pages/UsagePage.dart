import 'package:find_font/components/Information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UsagePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Information(
      title: '使い方',
      contents:
          """ホームにある”手書き文字をスキャン”を押していただくと、カメラがうつされるのでスキャンしたい文字を画面にうつし、カメラのアイコンを押しスキャン完了。結果がでてきますので、そこから近いフォントを使用していただけます。
    そこでお気に入りに登録したい時は星のボタンをタップ。使用例を見たい時はその文字自体をタップすると、文字を入力し実際にその言葉を入れた場合どうなるのかを見ることができます。
    過去のスキャン結果を見たい時は”過去のフォントを見る”スキャン履歴”に。お気に入りが見たい時は”過去のフォントを見る”から”お気に入りを見る”をタップすれば見ることが可能です。""",
      image: Image.asset('assets/images/usage.png'),
    );
  }
}
