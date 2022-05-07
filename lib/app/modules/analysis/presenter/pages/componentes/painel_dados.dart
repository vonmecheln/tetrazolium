import 'package:flutter/material.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/display_dano.dart';

class PainelDanos extends StatelessWidget {
  final AnalysisEntity item;
  const PainelDanos({
    required this.item,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            DisplayDano(type: "engine", value: 10),
            DisplayDano(type: "drop", value: 11),
            DisplayDano(type: "bug", value: 12),
            DisplayDano(type: "diamont", value: 13),
          ],
        ),
      ),
    );
  }
}
