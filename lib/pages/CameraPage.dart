import 'dart:developer';
import 'dart:io';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:find_font/components/_top_button.dart';
import 'package:find_font/components/scan_result/repository/scan_result_repository.dart';
import 'package:find_font/components/scan_result/scan_result_register_command.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service_factory.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:state_notifier/state_notifier.dart';

import '../main.dart';

final _scanResultServiceProvider = ChangeNotifierProvider(
        (ref) => new ScanResultApplicationServiceNotifier()
);

class CameraPage extends StatefulWidget {
  final double topIconMainSize = 78.0;
  final double topIconSubButtonSize = 44.0;

  final CameraDescription camera;

  CameraPage({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final test = Provider(_scanResultServiceProvider);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Navigator'),
        centerTitle: true,
      ),
      body: new Container(
          color: Color(0xFF639CBF),
          padding: new EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TopButton(
                    width: topIconSubButtonSize,
                    height: topIconSubButtonSize,
                    svgPath: 'assets/svg/icon_camera.svg',
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: TopButton(
                      width: topIconMainSize,
                      height: topIconMainSize,
                      svgPath: 'assets/svg/icon_camera.svg',
                    ),
                  ),
                  Container(
                    width: topIconSubButtonSize,
                  )
                ],
              ),
            ],
          )),
    );
  }

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;
  ScanResultApplicationService _scanResultApplicationService;

  final double topIconMainSize = 78.0;
  final double topIconSubButtonSize = 44.0;

  @override
  void initState() {
    print('初期化');
    final repository = new ScanResultRepository();

    _scanResultApplicationService =
        new ScanResultApplicationServiceFactory().create();

    // カメラの初期化
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // ウィジェットが破壊されたらコントローラを破棄する
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // final scanResultProvider = useProvider(_scanResultServiceProvider);

    return Scaffold(
      appBar: AppBar(title: Text('カメラ'), centerTitle: true),
      // カメラウィジェット
      //
      //
      body: new Container(
          color: Color(0xFF639CBF),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Cameraの画面部
              Expanded(
                child: FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If the Future is complete, display the preview.
                      return CameraPreview(_controller);
                    } else {
                      // Otherwise, display a loading indicator.
                      return Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // ライブラリから選択
                    Container(
                        width: topIconSubButtonSize,
                        height: topIconSubButtonSize,
                        child: FloatingActionButton(
                          heroTag: 'Garally',
                          onPressed: () => {},
                          child: TopButton(
                            width: topIconSubButtonSize,
                            height: topIconSubButtonSize,
                            svgPath: 'assets/svg/icon_garally.svg',
                          ),
                        )),
                    // 撮影ボタン
                    Padding(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        child: Container(
                            width: topIconMainSize,
                            height: topIconMainSize,
                            child: FloatingActionButton(
                              heroTag: 'TakeCapture',
                              onPressed: () async {
                                try {
                                  // Ensure that the camera is initialized.
                                  await _initializeControllerFuture;

                                  // Construct the path where the image should be saved using the
                                  // pattern package.

                                  final path = join(
                                    // Store the picture in the temp directory.
                                    // Find the temp directory using the `path_provider` plugin.
                                    (await getTemporaryDirectory()).path,
                                    '${DateTime.now()}.png',
                                  );

                                  // Attempt to take a picture and log where it's been saved.
                                  await _controller.takePicture(path);

                                  print(path);

                                  print('処理開始');
                                  ScanResultRegisterCommand command =
                                      new ScanResultRegisterCommand(path);

                                  this.context.read(_scanResultServiceProvider).scanResultApplicationService.register(command);

                                  print('送信処理開始');

                                } catch (e) {
                                  // If an error occurs, log the error to the console.
                                  print(e);
                                }
                              },
                              child: TopButton(
                                width: topIconMainSize,
                                height: topIconMainSize,
                                svgPath: 'assets/svg/icon_camera.svg',
                              ),
                            ))),
                    Container(
                      width: topIconSubButtonSize,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
