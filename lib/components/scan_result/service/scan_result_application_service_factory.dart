import 'package:find_font/components/scan_result/model/scan_result_factory.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';

class ScanResultApplicationServiceFactory {
  ScanResultApplicationService create() {
    final repository = new ScanResultRepository();

    print('init');

    repository.init();
    return ScanResultApplicationService(new ScanResultFactory(), repository);
  }
}