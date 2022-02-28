import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class ExpandeCardIcon extends StatefulWidget {
  const ExpandeCardIcon({
    Key? key,
  }) : super(key: key);

  @override
  _ExpandeCardIconState createState() => _ExpandeCardIconState();
}

class _ExpandeCardIconState extends State<ExpandeCardIcon>
    with SingleTickerProviderStateMixin {
  bool expanded = true;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
  }

  @override
  Widget build(BuildContext context) {
    var aic = AnimatedIcon(
      icon: AnimatedIcons.search_ellipsis,
      progress: controller,
      color: FlutterFlowTheme.primaryColor,
    );

    var ic = Icon(
      Icons.chevron_left,
      color: FlutterFlowTheme.primaryColor,
      size: 30,
    );

    return IconButton(
      splashColor: Colors.blue,
      onPressed: () {
        setState(() {
          expanded ? controller.forward() : controller.reverse();
          expanded = !expanded;

          print('IconButton pressed ... test');
        });
      },
      icon: aic,
      iconSize: 30,
    );
  }
}
