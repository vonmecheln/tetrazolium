import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class ItemDano extends StatelessWidget {
  final String type;
  final String text;

  const ItemDano({
    required this.type,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 100,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("img/$type.svg"),
          Text(
            '$text',
            style: FlutterFlowTheme.bodyText1.apply(
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
