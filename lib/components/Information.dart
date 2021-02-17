import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Information extends StatelessWidget {
  final String title;

  Information({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text(title),
          centerTitle: true,
        ),
        body: Container());
  }
}
