
import 'package:hive/hive.dart';

part 'font_information.g.dart';

@HiveType(typeId: 2)
class FontInformation extends HiveObject {
  @HiveField(0)
  final String fontFamily;
  @HiveField(1)
  final String fontName;
  @HiveField(2)
  final String style;
  @HiveField(3)
  final bool favorite;

  FontInformation(this.fontFamily, this.fontName, this.style, this.favorite);
}