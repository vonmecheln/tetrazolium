import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class ItemDano extends StatelessWidget {
  final String type;
  final String text;
  final Color color;
  final GestureTapCallback? onTap;

  const ItemDano({
    required this.type,
    required this.text,
    required this.color,
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // width: 70,
      // height: 100,
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          width: 70,
          height: 100,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/img/$type.svg",
                color: this.color,
              ),
              Text(
                '$text',
                style: FlutterFlowTheme.bodyText1.apply(
                  fontFamily: 'Roboto',
                  color: this.color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
