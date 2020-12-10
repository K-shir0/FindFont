import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class TopButton extends StatefulWidget {

  final double width, height;
  final String svgPath;

  const TopButton({Key key, this.width, this.height, this.svgPath}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
            Radius.elliptical(9999.0, 9999.0)),
        color: const Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            color: const Color(0x29000000),
            offset: Offset(0, 3),
            blurRadius: 6,
          ),
        ],
      ),
      child: SvgPicture.asset(
          widget.svgPath
      ),
    );
  }

}