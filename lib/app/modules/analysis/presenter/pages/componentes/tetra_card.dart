import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_analise.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_dados.dart';

class TetraCard extends StatefulWidget {
  const TetraCard({
    Key? key,
  }) : super(key: key);

  @override
  _TetraCardState createState() => _TetraCardState();
}

class _TetraCardState extends State<TetraCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: PainelAnalise(),
        children: [
          PainelDanos(),
        ],
      ),
    );
  }
}
