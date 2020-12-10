// スキャンの結果を管理するクラス
class ScanResult {
  final String id;
  List<FontInformation> fontInformationList = new List();

  ScanResult(this.id, [this.fontInformationList]);
}

class FontInformation {
  final String fontFamily;
  final String fontName;
  final String style;
  final bool favorite;

  FontInformation(this.fontFamily, this.fontName, this.style, this.favorite);
}
