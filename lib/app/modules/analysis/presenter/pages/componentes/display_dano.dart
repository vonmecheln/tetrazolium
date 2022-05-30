import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class DisplayDano extends StatelessWidget {
  final String type;
  final int? value;

  const DisplayDano({
    required this.type,
    this.value,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 100 - (value == null ? 60 : 0),
      decoration: const BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset("img/$type.svg"),
          if (value != null)
            Text(
              '$value',
              style: FlutterFlowTheme.bodyText1.apply(fontFamily: 'Roboto'),
            ),
        ],
      ),
    );
  }
}
