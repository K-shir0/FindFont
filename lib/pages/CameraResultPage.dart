import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CameraResultPage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('スキャン結果'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: Text("一番一致したフォント", style: TextStyle(fontSize: 14)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  onChanged: (bool value) {},
                  value: true,
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Container(
                      width: 50,
                      child: Center(
                        child: Text(
                          'F',
                          style: TextStyle(
                              fontSize: 36,
                              fontFamily: ''),
                        ),
                      )),
                ),
                Text(
                  "游ゴシック体 - Bold",
                  style: TextStyle(fontSize: 24),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 8, bottom: 8),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: Text("その他候補のフォント", style: TextStyle(fontSize: 14)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (bool value) {},
                    value: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'F',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: ''),
                          ),
                        )),
                  ),
                  Text(
                    "游ゴシック体 - Bold",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (bool value) {},
                    value: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'F',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: ''),
                          ),
                        )),
                  ),
                  Text(
                    "游ゴシック体 - Bold",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (bool value) {},
                    value: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'F',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: ''),
                          ),
                        )),
                  ),
                  Text(
                    "游ゴシック体 - Bold",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (bool value) {},
                    value: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(),
                    child: Container(
                        width: 50,
                        child: Center(
                          child: Text(
                            'F',
                            style: TextStyle(
                                fontSize: 24,
                                fontFamily: ''),
                          ),
                        )),
                  ),
                  Text(
                    "游ゴシック体 - Bold",
                    style: TextStyle(fontSize: 16),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
