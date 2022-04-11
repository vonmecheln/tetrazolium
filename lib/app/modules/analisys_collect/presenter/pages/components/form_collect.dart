import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/collect/repetition_page.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_classification.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_damages.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_photo.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';

class FormCollect extends StatefulWidget {
  final Coleta coleta;
  final void Function(Coleta)? onChange;

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
            this.widget.coleta.classificacao,
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
      widget.coleta.danoMecanico = 0;
      widget.coleta.danoPercevejo = 0;
      widget.coleta.danoUmidade = 0;
      widget.coleta.dura = widget.coleta.dura == 0 ? 1 : 0;
    } else {
      widget.coleta.dura = 0;
    }

    bool zero = widget.coleta.danoMecanico +
            widget.coleta.danoPercevejo +
            widget.coleta.danoUmidade ==
        0;

    if (d == DamageType.bug) {
      widget.coleta.danoPercevejo = zero ? 2 : widget.coleta.danoPercevejo + 1;

      if (widget.coleta.danoPercevejo > 2) {
        widget.coleta.danoPercevejo = 0;
      } else if (widget.coleta.danoPercevejo == 2) {
        if (widget.coleta.danoMecanico > 1) widget.coleta.danoMecanico -= 1;
        if (widget.coleta.danoUmidade > 1) widget.coleta.danoUmidade -= 1;
      }
    }

    if (d == DamageType.drop) {
      widget.coleta.danoUmidade = zero ? 2 : widget.coleta.danoUmidade + 1;

      if (widget.coleta.danoUmidade > 2) {
        widget.coleta.danoUmidade = 0;
      } else if (widget.coleta.danoUmidade == 2) {
        if (widget.coleta.danoMecanico > 1) widget.coleta.danoMecanico -= 1;
        if (widget.coleta.danoPercevejo > 1) widget.coleta.danoPercevejo -= 1;
      }
    }

    if (d == DamageType.engine) {
      widget.coleta.danoMecanico = zero ? 2 : widget.coleta.danoMecanico + 1;

      if (widget.coleta.danoMecanico > 2) {
        widget.coleta.danoMecanico = 0;
      } else if (widget.coleta.danoMecanico == 2) {
        if (widget.coleta.danoUmidade > 1) widget.coleta.danoUmidade -= 1;
        if (widget.coleta.danoPercevejo > 1) widget.coleta.danoPercevejo -= 1;
      }
    }

    setState(() {});

    updateColeta();
  }

  void onChageClassification(int value) {
    this.widget.coleta.classificacao = value;
    updateColeta();
  }

  void updateColeta() async {
    if (this.widget.onChange != null) this.widget.onChange!(this.widget.coleta);
  }
}
