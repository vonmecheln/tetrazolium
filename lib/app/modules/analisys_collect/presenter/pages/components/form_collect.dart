// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_classification.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_damages.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_photo.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';

class FormCollect extends StatefulWidget {
  CollectEntity coleta;
  final void Function(CollectEntity)? onChange;

  FormCollect(
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
    return Column(
      children: <Widget>[
        const Expanded(
            child: PainelPhoto(
          photos: [],
        )),
        PainelClassification(
          widget.coleta.classification,
          onChange: onChageClassification,
        ),
        const PainelSeparator(),
        PainelDamages(
          onTap: onDamageChange,
          damages: widget.coleta.damageMap(),
        ),
      ],
    );
  }

  void onDamageChange(d) {
    if (d == DamageType.diamont) {
      widget.coleta = widget.coleta.copyWith(
          damageBug: 0,
          damageEngine: 0,
          damageHumidity: 0,
          hard: widget.coleta.hard == 0 ? 1 : 0);
    } else {
      widget.coleta = widget.coleta.copyWith(hard: 0);
    }

    bool zero = widget.coleta.damageEngine +
            widget.coleta.damageBug +
            widget.coleta.damageHumidity ==
        0;

    if (d == DamageType.bug) {
      widget.coleta = widget.coleta.copyWith(
        damageBug: zero ? 2 : widget.coleta.damageBug + 1,
      );

      if (widget.coleta.damageBug > 2) {
        widget.coleta = widget.coleta.copyWith(damageBug: 0);
      } else if (widget.coleta.damageBug == 2) {
        if (widget.coleta.damageEngine > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageEngine: widget.coleta.damageEngine - 1,
          );
        }

        if (widget.coleta.damageHumidity > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageHumidity: widget.coleta.damageHumidity - 1,
          );
        }
      }
    }

    if (d == DamageType.drop) {
      widget.coleta = widget.coleta.copyWith(
        damageHumidity: zero ? 2 : widget.coleta.damageHumidity + 1,
      );

      if (widget.coleta.damageHumidity > 2) {
        widget.coleta = widget.coleta.copyWith(damageHumidity: 0);
      } else if (widget.coleta.damageHumidity == 2) {
        if (widget.coleta.damageEngine > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageEngine: widget.coleta.damageEngine - 1,
          );
        }

        if (widget.coleta.damageBug > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageBug: widget.coleta.damageBug - 1,
          );
        }
      }
    }

    if (d == DamageType.engine) {
      widget.coleta = widget.coleta
          .copyWith(damageEngine: zero ? 2 : widget.coleta.damageEngine + 1);

      if (widget.coleta.damageEngine > 2) {
        widget.coleta = widget.coleta.copyWith(damageEngine: 0);
      } else if (widget.coleta.damageEngine == 2) {
        if (widget.coleta.damageHumidity > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageHumidity: widget.coleta.damageHumidity - 1,
          );
        }

        if (widget.coleta.damageBug > 1) {
          widget.coleta = widget.coleta.copyWith(
            damageBug: widget.coleta.damageBug - 1,
          );
        }
      }
    }

    setState(() {});

    updateColeta();
  }

  void onChageClassification(int value) {
    widget.coleta = widget.coleta.copyWith(
      classification: value,
    );

    updateColeta();
  }

  void updateColeta() async {
    if (widget.onChange != null) widget.onChange!(widget.coleta);
  }
}
