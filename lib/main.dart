import 'package:camera/camera.dart';
import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service_factory.dart';
import 'package:find_font/pages/CameraPage.dart';
import 'package:find_font/pages/IndexPage.dart';
import 'package:find_font/pages/MyHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'components/scan_result/model/scan_result.dart';
import 'components/scan_result/model/scan_result.dart';

CameraDescription firstCamera;

Future main() async {
  // 環境変数ファイルの読み込み
  await DotEnv().load('.env');

  await Hive.initFlutter();

  print("登録");
  Hive.registerAdapter(FontInformationAdapter());
  Hive.registerAdapter(ScanResultAdapter());

  // 使用可能なカメラのロード処理
  try {
    WidgetsFlutterBinding.ensureInitialized();

    // 使用可能なカメラを取得する
    List cameras = await availableCameras();
    firstCamera = cameras.first;

  } on CameraException catch (e) {
    print("カメラを読み込めませんでした");
  }

  runApp(
    ProviderScope(
      child: Router(),
    ),
  );
}

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        // Indexページ
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => IndexPage());
        }

        // カメラページ
        if (settings.name == '/camera') {
          return MaterialPageRoute(builder: (context) => CameraPage(camera: firstCamera));
        }

        return MaterialPageRoute(builder: (context) => MyHomePage(title: "Unknown Page",));
      },
    );
  }
}

class ScanResultApplicationServiceNotifier extends ChangeNotifier {
  ScanResultApplicationService _scanResultApplicationService;

  ScanResultApplicationService get scanResultApplicationService =>
      _scanResultApplicationService;

  ScanResultApplicationServiceNotifier() {
    _scanResultApplicationService = new ScanResultApplicationServiceFactory().create();
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
