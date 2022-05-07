import 'package:flutter/material.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_analise.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_dados.dart';

class TetraCard extends StatelessWidget {
  final AnalysisEntity item;
  final void Function()? onSelect;

  const TetraCard({
    Key? key,
    this.onSelect,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: PainelAnalise(item: item, onSelect: onSelect),
        children: [
          PainelDanos(item: item),
        ],
      ),
    );
  }
}
