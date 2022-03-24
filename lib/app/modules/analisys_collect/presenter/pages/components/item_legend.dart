import 'package:flutter/material.dart';

class ItemLegend extends StatelessWidget {
  final Color color;
  final String text;

  const ItemLegend({
    Key? key,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(color: color, height: 8, width: 8),
        Container(width: 8),
        Text(text)
      ],
    );
  }
}
