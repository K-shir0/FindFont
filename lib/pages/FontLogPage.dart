import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/all.dart';

import '../main.dart';

final _scanResultServiceProvider = ChangeNotifierProvider(
        (ref) => new ScanResultApplicationServiceNotifier()
);

class FontLogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('フォント履歴'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 1, bottom: 1),
        children: [
          Padding(
            padding: EdgeInsets.only(top: 12, bottom: 12),
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                    bottom: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                  )),
              height: 64,
              // color: Colors.amber[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32, right: 12),
                          child: Container(
                              width: 50,
                              child: Center(
                                child: Text(
                                  'F',
                                  style: TextStyle(fontSize: 32),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'ヒラギノ角ゴ StdN',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '- Bold',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2020.08.22',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 8, left: 16),
                          child: SvgPicture.asset('assets/svg/next.svg'))
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 1, bottom: 1),
            child: Container(
              decoration: BoxDecoration(
                  border: const Border(
                    top: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                    bottom: const BorderSide(
                      color: const Color(0xffF2F2F2),
                      width: 1,
                    ),
                  )),
              height: 64,
              // color: Colors.amber[600],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 32, right: 12),
                          child: Container(
                              width: 50,
                              child: Center(
                                child: Text(
                                  'F',
                                  style: TextStyle(fontSize: 32),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Text(
                            'ヒラギノ角ゴ StdN',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '- Bold',
                          style: TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        '2020.08.22',
                        style: TextStyle(fontSize: 12),
                      ),
                      Padding(
                          padding: EdgeInsets.only(right: 8, left: 16),
                          child: SvgPicture.asset('assets/svg/next.svg'))
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //   height: 50,
          //   color: Colors.amber[600],
          //   child: const Center(child: Text('Entry A')),
          // ),
        ],
      ),
    );
  }

}