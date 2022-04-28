import 'package:flutter/material.dart';
import 'package:tetrazolium/app/shared/domain/entities/collect.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_classification.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_damages.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_photo.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';

class FormCollect extends StatefulWidget {
  final Collect coleta;
  final void Function(Collect)? onChange;

  const FormCollect(
    this.coleta, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<FormCollect> createState() => _FormCollectState();
}

class _FormCollectState extends State<FormCollect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: PainelPhoto()),
          PainelClassification(
            this.widget.coleta.classification,
            onChange: onChageClassification,
          ),
          PainelSeparator(),
          PainelDamages(
            onTap: onDamageChange,
            damages: widget.coleta.damageMap(),
          ),
        ],
      ),
    );
  }

  void onDamageChange(d) {
    if (d == DamageType.diamont) {
      widget.coleta.damageEngine = 0;
      widget.coleta.damageBug = 0;
      widget.coleta.damageHumidity = 0;
      widget.coleta.hard = widget.coleta.hard == 0 ? 1 : 0;
    } else {
      widget.coleta.hard = 0;
    }

    bool zero = widget.coleta.damageEngine +
            widget.coleta.damageBug +
            widget.coleta.damageHumidity ==
        0;

    if (d == DamageType.bug) {
      widget.coleta.damageBug = zero ? 2 : widget.coleta.damageBug + 1;

      if (widget.coleta.damageBug > 2) {
        widget.coleta.damageBug = 0;
      } else if (widget.coleta.damageBug == 2) {
        if (widget.coleta.damageEngine > 1) widget.coleta.damageEngine -= 1;
        if (widget.coleta.damageHumidity > 1) widget.coleta.damageHumidity -= 1;
      }
    }

    if (d == DamageType.drop) {
      widget.coleta.damageHumidity =
          zero ? 2 : widget.coleta.damageHumidity + 1;

      if (widget.coleta.damageHumidity > 2) {
        widget.coleta.damageHumidity = 0;
      } else if (widget.coleta.damageHumidity == 2) {
        if (widget.coleta.damageEngine > 1) widget.coleta.damageEngine -= 1;
        if (widget.coleta.damageBug > 1) widget.coleta.damageBug -= 1;
      }
    }

    if (d == DamageType.engine) {
      widget.coleta.damageEngine = zero ? 2 : widget.coleta.damageEngine + 1;

      if (widget.coleta.damageEngine > 2) {
        widget.coleta.damageEngine = 0;
      } else if (widget.coleta.damageEngine == 2) {
        if (widget.coleta.damageHumidity > 1) widget.coleta.damageHumidity -= 1;
        if (widget.coleta.damageBug > 1) widget.coleta.damageBug -= 1;
      }
    }

    setState(() {});

    updateColeta();
  }

  void onChageClassification(int value) {
    this.widget.coleta.classification = value;
    updateColeta();
  }

  void updateColeta() async {
    if (this.widget.onChange != null) this.widget.onChange!(this.widget.coleta);
  }
}
