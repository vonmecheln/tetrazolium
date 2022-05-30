import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class PainelClassification extends StatefulWidget {
  final int classificacao;
  final void Function(int)? onChange;

  const PainelClassification(
    this.classificacao, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<PainelClassification> createState() => _PainelClassificationState();
}

class _PainelClassificationState extends State<PainelClassification> {
  double _value = 1.0;

  @override
  void initState() {
    _value = widget.classificacao.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: const Color(0xFFF2F2F2),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Slider(
            activeColor: FlutterFlowTheme.primaryColor,
            inactiveColor: FlutterFlowTheme.primaryColor.withAlpha(100),
            min: 1,
            max: 8,
            label: '${_value.round()}',
            divisions: 7,
            value: _value,
            onChanged: onChanged,
          ),
        ));
  }

  void onChanged(double value) {
    setState(() {
      _value = value;
      if (widget.onChange != null) widget.onChange!(value.round());
    });
  }
}
