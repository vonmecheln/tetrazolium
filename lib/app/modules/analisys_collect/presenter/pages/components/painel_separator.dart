import 'package:flutter/material.dart';

class PainelSeparator extends StatelessWidget {
  const PainelSeparator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFE9E9E9),
      height: 1,
      width: double.infinity,
    );
  }
}
