// スキャンの結果を管理するクラス
import 'package:find_font/components/scan_result/model/scan_result_factory.dart';
import 'package:hive/hive.dart';

import 'font_information.dart';

part 'scan_result.g.dart';

@HiveType(typeId: 1)
class ScanResult extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  HiveList<FontInformation> fontInformationList;
  @HiveField(2)
  final DateTime dateTime;

  ScanResult(this.id, this.dateTime);
}
