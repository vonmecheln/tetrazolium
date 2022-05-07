import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/item_damage.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';

class PainelDamages extends StatelessWidget {
  final void Function(DamageType damage)? onTap;
  final Map<DamageType, int>? damages;

  PainelDamages({
    Key? key,
    this.onTap,
    this.damages,
  }) : super(key: key);

  Map<int, Color> colorMap = {
    0: FlutterFlowTheme.color4,
    1: FlutterFlowTheme.color3,
    2: FlutterFlowTheme.color2,
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> itens = [];

    if (damages != null)
      damages?.forEach((type, value) {
        itens.add(
          ItemDamage(
            color: colorMap[value],
            type: type,
            onTap: () => onItemTap(type),
          ),
        );
      });

    return Container(
      height: 98,
      color: Color(0xFFF2F2F2),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: itens),
    );
  }

  void onItemTap(DamageType damage) {
    if (onTap != null) onTap!(damage);
  }
}
