
import 'package:hive/hive.dart';

part 'font_information.g.dart';

@HiveType(typeId: 2)
class FontInformation extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String fontFamily;
  @HiveField(2)
  final String fontName;
  @HiveField(3)
  final String style;
  @HiveField(4)
  bool favorite;

  FontInformation(this.id, this.fontFamily, this.fontName, this.style, this.favorite);

}