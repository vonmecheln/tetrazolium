import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tetrazolium/app/shared/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';

class ItemDamage extends StatelessWidget {
  final DamageType type;
  final Color? color;
  final GestureTapCallback? onTap;

  late String assetName;
  late String text;

  ItemDamage({
    required this.type,
    required this.color,
    Key? key,
    this.onTap,
  }) : super(key: key) {
    assetName = type.toString().split('.').last;
    text = assetName;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      // width: 70,
      // height: 100,
      child: InkWell(
        onTap: this.onTap,
        child: Container(
          width: 70,
          height: 100,
          decoration: BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                "assets/img/$assetName.svg",
                color: this.color,
              ),
              Text(
                '$text',
                style: FlutterFlowTheme.bodyText1.apply(
                  fontFamily: 'Roboto',
                  color: this.color,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
