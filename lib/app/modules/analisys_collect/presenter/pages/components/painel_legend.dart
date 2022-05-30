import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/item_legend.dart';

class PainelLegend extends StatelessWidget {
  const PainelLegend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: const Color(0xFFF2F2F2),
      child: Row(
        children: const [
          Spacer(flex: 70),
          ItemLegend(color: Color(0xFFD74745), text: "Dano mais aparente"),
          Spacer(flex: 35),
          ItemLegend(color: Color(0xFF515151), text: "Dano presente"),
          Spacer(flex: 70),
        ],
      ),
    );
  }
}
