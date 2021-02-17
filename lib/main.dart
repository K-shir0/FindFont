import 'package:camera/camera.dart';
import 'package:find_font/components/scan_result/model/font_information.dart';
import 'package:find_font/components/scan_result/model/scan_result.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service_factory.dart';
import 'package:find_font/pages/CameraPage.dart';
import 'package:find_font/pages/CameraResultPage.dart';
import 'package:find_font/pages/FavoriteListPage.dart';
import 'package:find_font/pages/FontInformationPage.dart';
import 'package:find_font/pages/FontLogPage.dart';
import 'package:find_font/pages/IndexPage.dart';
import 'package:find_font/pages/MyHomePage.dart';
import 'package:find_font/pages/SettingPage.dart';
import 'package:find_font/pages/UsagePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/all.dart';

import 'components/scan_result/model/scan_result.dart';

CameraDescription firstCamera;

final _scanResultServiceProvider =
    ChangeNotifierProvider((ref) => new ScanResultApplicationServiceNotifier());

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

class Router extends HookWidget {
  @override
  Widget build(BuildContext context) {
    var _scanResultApplicationService =
        useProvider(_scanResultServiceProvider).scanResultApplicationService;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFF639CBF)),
      onGenerateRoute: (settings) {
        // Indexページ
        if (settings.name == '/') {
          return MaterialPageRoute(builder: (context) => IndexPage());
        }

        // カメラページ
        if (settings.name == '/camera') {
          return MaterialPageRoute(
              builder: (context) =>
                  CameraPage(firstCamera, _scanResultApplicationService));
        }

        // フォント履歴
        if (settings.name == '/font_log') {
          return MaterialPageRoute(
              builder: (context) => FontLogPage(_scanResultApplicationService));
        }

        // フォント結果/:id
        var uri = Uri.parse(settings.name);
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'font_result') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
              builder: (context) => CameraResultPage(
                  _scanResultApplicationService, int.parse(id)));
        }

        // 設定
        if (settings.name == '/setting') {
          return MaterialPageRoute(builder: (context) => SettingPage());
        }

        // お気に入り
        if (settings.name == '/favorite') {
          return MaterialPageRoute(
              builder: (context) =>
                  FavoriteListPage(_scanResultApplicationService));
        }

        // フォント結果/:id
        if (uri.pathSegments.length == 2 &&
            uri.pathSegments.first == 'font_information') {
          var id = uri.pathSegments[1];
          return MaterialPageRoute(
            builder: (context) => FontInformationPage(
              _scanResultApplicationService,
              int.parse(id),
            ),
          );
        }

        if (uri.pathSegments.length == 1 && uri.pathSegments.first == 'usage') {
          return MaterialPageRoute(
            builder: (context) => UsagePage(),
          );
        }

        return MaterialPageRoute(
            builder: (context) => MyHomePage(
                  title: "Unknown Page",
                ));
      },
    );
  }
}

class ScanResultApplicationServiceNotifier extends ChangeNotifier {
  ScanResultApplicationService _scanResultApplicationService;

  ScanResultApplicationService get scanResultApplicationService =>
      _scanResultApplicationService;

  ScanResultApplicationServiceNotifier() {
    print("登録");
    _scanResultApplicationService =
        new ScanResultApplicationServiceFactory().create();
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
