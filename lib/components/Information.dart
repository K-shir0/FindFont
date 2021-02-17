import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Information extends StatelessWidget {
  final String title;
  final Image image;
  final String contents;

  Information(
      {@required this.title, @required this.contents, @required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          image,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: RichText(
              text: TextSpan(children: [
                TextSpan(text: contents, style: TextStyle(color: Colors.black))
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
