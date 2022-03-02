import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SvgPicture.asset(
          "img/logo.svg",
          semanticsLabel: 'Tetrazólio Logo'
      ),
    );
  }
}
