import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class PainelAnalise extends StatelessWidget {
  final void Function()? onSelect;

  const PainelAnalise({
    Key? key,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: InkWell(
              onTap: onSelect,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Lote 01-54',
                    style: FlutterFlowTheme.subtitle1.apply(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    '02/07/2019',
                    style: FlutterFlowTheme.subtitle2.apply(
                      fontFamily: 'Roboto',
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            'VIG',
            style: FlutterFlowTheme.subtitle2.apply(
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            '86',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.title1.apply(
              fontFamily: 'Roboto',
            ),
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
            style: FlutterFlowTheme.subtitle2.apply(
              fontFamily: 'Roboto',
            ),
          ),
          Text(
            '93',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.title1.apply(
              fontFamily: 'Roboto',
            ),
          )
        ],
      ),
    );
  }
}
