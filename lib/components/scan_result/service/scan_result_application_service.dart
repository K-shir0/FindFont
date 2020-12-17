import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/i_scan_result_factiory.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';

import '../scan_result_register_command.dart';

class ScanResultApplicationService {
  final IScanResultFactory scanResultFactory;
  final ScanResultRepository scanResultRepository;

  ScanResultApplicationService(
      this.scanResultFactory, this.scanResultRepository);

  Future<bool> register(ScanResultRegisterCommand command) async {
    print('Register');
    final filename = command.path.split('/').last;

    await scanResultRepository.store(command.path, filename);

    return true;
  }

  index() {
    return scanResultRepository.getAll();
  }

  getById(int id) {
    return scanResultRepository.getById(id);
  }

  favorite(FontInformation fontInformation) {
    fontInformation.favorite = !fontInformation.favorite;

    scanResultRepository.edit(fontInformation);
  }

  List getFavoriteFontList() {
    return scanResultRepository.getFavoriteFontList();
  }
}
