import 'package:find_font/components/scan_result/model/i_scan_result_factiory.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';

import '../scan_result_register_command.dart';

class ScanResultApplicationService {
  final IScanResultFactory scanResultFactory;
  final ScanResultRepository scanResultRepository;

  ScanResultApplicationService(
      this.scanResultFactory, this.scanResultRepository);

  Future<void> register(ScanResultRegisterCommand command) async {
    print('Register');
    final filename = command.path.split('/').last;

    await scanResultRepository.store(command.path, filename);
  }

  index() {
    return scanResultRepository.getAll();
  }
}
