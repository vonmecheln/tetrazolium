import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_analise.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_dados.dart';

class TetraCard extends StatelessWidget {
  final void Function()? onSelect;

  const TetraCard({
    Key? key,
    this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: PainelAnalise(onSelect: onSelect),
        children: [
          PainelDanos(),
        ],
      ),
    );
  }
}
