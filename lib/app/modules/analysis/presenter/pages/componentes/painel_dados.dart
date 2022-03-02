import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/display_dano.dart';

class PainelDanos extends StatelessWidget {
  final Analysis item;
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
            DisplayDano(),
            DisplayDano(),
            DisplayDano(),
            DisplayDano(),
          ],
        ),
      ),
    );
  }
}
