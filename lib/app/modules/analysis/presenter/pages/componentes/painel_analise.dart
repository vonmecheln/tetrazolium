import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_viabilidade.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/util/date.dart';

class PainelAnalise extends StatelessWidget {
  final AnalysisEntity item;
  final void Function()? onSelect;

  const PainelAnalise({
    Key? key,
    this.onSelect,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
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
                    item.sample,
                    style: FlutterFlowTheme.subtitle1.apply(
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    dateFormat.format(item.date),
                    style: FlutterFlowTheme.subtitle2.apply(
                      fontFamily: 'Roboto',
                    ),
                  )
                ],
              ),
            ),
          ),
          PainelVisibilidade(vigor: item.vigor, viability: item.viability),
        ],
      ),
    );
  }
}
