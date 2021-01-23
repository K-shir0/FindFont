
import 'package:camera/camera.dart';
import 'package:find_font/components/_top_button.dart';
import 'package:find_font/components/scan_result/scan_result_register_command.dart';
import 'package:find_font/components/scan_result/service/scan_result_application_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulHookWidget {
  final double topIconMainSize = 78.0;
  final double topIconSubButtonSize = 44.0;

  final CameraDescription camera;
  final ScanResultApplicationService scanResultApplicationService;

  CameraPage(this.camera, this.scanResultApplicationService);

  @override
  Widget build(BuildContext context) {
    // useProvider(_scanResultServiceProvider) = scanResultApplicationService;

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

  final double topIconMainSize = 78.0;
  final double topIconSubButtonSize = 44.0;
  var isLoading = false;

  @override
  void initState() {
    print('初期化');
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
    final picker = ImagePicker();

    return Scaffold(
      appBar: AppBar(title: Text('カメラ'), centerTitle: true),
      // カメラウィジェット
      body: Stack(
        children: [
          new Container(
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
                              onPressed: () async {
                                print("写真選択ボタンが押された");
                                setState(() {
                                  isLoading = true;
                                });

                                // ファイルを選択
                                picker
                                    .getImage(source: ImageSource.gallery)
                                    .then((pickedFile) {
                                  print(pickedFile.path);

                                  ScanResultRegisterCommand command =
                                  new ScanResultRegisterCommand(
                                      pickedFile.path);

                                  // 登録処理
                                  widget.scanResultApplicationService
                                      .register(command)
                                    ..then((value) {
                                      var length = widget
                                          .scanResultApplicationService
                                          .index()
                                          .length -
                                          1;

                                      Navigator.of(context).pushNamed(
                                          '/font_result/' + length.toString());
                                    }).whenComplete(() =>
                                        setState(() {
                                          isLoading = false;
                                        }));
                                });
                              },
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
                                    setState(() {
                                      isLoading = true;
                                    });

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

                                      print('処理開始');
                                      ScanResultRegisterCommand command =
                                      new ScanResultRegisterCommand(path);

                                      if (await widget
                                          .scanResultApplicationService
                                          .register(command)) {
                                        var length = widget
                                            .scanResultApplicationService
                                            .index()
                                            .length -
                                            1;

                                        Navigator.of(context).pushNamed(
                                            '/font_result/' +
                                                length.toString());
                                      }
                                    } catch (e) {
                                      // If an error occurs, log the error to the console.
                                      print(e);
                                    }

                                    setState(() {
                                      isLoading = false;
                                    });
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
          isLoading
              ? Container(
            decoration: new BoxDecoration(
              color: Color.fromRGBO(0, 0, 0, 0.6),
            ),
            alignment: Alignment.center,
            child: CircularProgressIndicator(),
          )
              : Container(child: Text("test"),)
        ],
      ),
    );
  }
}
