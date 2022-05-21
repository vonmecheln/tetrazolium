import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class PainelVisibilidade extends StatelessWidget {
  final int vigor;
  final int viability;

  const PainelVisibilidade({
    Key? key,
    required this.vigor,
    required this.viability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'VIG',
          style: FlutterFlowTheme.subtitle2.apply(fontFamily: 'Roboto'),
        ),
        Container(width: 4),
        Text(
          vigor.toString(),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title1.apply(fontFamily: 'Roboto'),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
          child: Container(
            width: 1,
            height: 19,
            decoration: BoxDecoration(
              color: Color(0xFFD8D8D8),
            ),
          ),
        ),
        Text(
          'VIA',
          style: FlutterFlowTheme.subtitle2.apply(fontFamily: 'Roboto'),
        ),
        Container(width: 4),
        Text(
          viability.toString(),
          textAlign: TextAlign.center,
          style: FlutterFlowTheme.title1.apply(fontFamily: 'Roboto'),
        )
      ],
    );
  }
}
