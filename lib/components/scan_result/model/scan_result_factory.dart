

import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:uuid/uuid.dart';

import 'i_scan_result_factiory.dart';

class  ScanResultFactory implements IScanResultFactory {
  @override
  ScanResult create() {
    return ScanResult(Uuid().v4(), DateTime.now());
  }
}