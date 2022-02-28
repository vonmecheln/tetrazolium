import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class DisplayDano extends StatelessWidget {
  const DisplayDano({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 100,
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.settings_outlined,
            color: FlutterFlowTheme.primaryColor,
            size: 35,
          ),
          Text(
            '11',
            style: FlutterFlowTheme.bodyText1.apply(
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
