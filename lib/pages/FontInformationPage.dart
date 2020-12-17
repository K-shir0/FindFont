import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class FontInformationPage extends HookWidget {
  final ScanResultApplicationService scanResultApplicationService;
  final int id;

  FontInformationPage(this.scanResultApplicationService, this.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
        centerTitle: true,
      ),
      body: new Container(
        color: Color(0xFF639CBF),
        padding: new EdgeInsets.all(32.0),
      ),
    );
  }
}
