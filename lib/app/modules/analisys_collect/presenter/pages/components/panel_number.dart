import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class PainelNumber extends StatefulWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onForwardPressed;
  final int atual;
  final int max;

  const PainelNumber({
    Key? key,
    this.onBackPressed,
    this.onForwardPressed,
    this.atual = 1,
    this.max = 50,
  }) : super(key: key);

  @override
  State<PainelNumber> createState() => _PainelNumberState();
}

class _PainelNumberState extends State<PainelNumber> {
  @override
  Widget build(BuildContext context) {
    var n = 3;

    return Container(
      height: 92,
      color: const Color(0xFFF2F2F2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Spacer(flex: 14),
          IconButton(
            onPressed: widget.onBackPressed,
            icon: const Icon(Icons.arrow_back_ios, color: Color(0xFFC4C4C4)),
          ),

          for (var i = widget.atual - n; i < widget.atual; i++)
            Text(i < 1 ? '' : '$i', style: FlutterFlowTheme.numero),

          PhysicalModel(
            color: FlutterFlowTheme.primaryColor,
            elevation: 1,
            // shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(50),
            child: SizedBox(
              width: 44,
              height: 44,
              child: Center(
                child: Text(widget.atual.toString(),
                    style: const TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontWeight: FontWeight.w500,
                      fontSize: 22,
                      fontFamily: 'Roboto',
                    )),
              ),
            ),
          ),

          for (var i = widget.atual + 1; i <= widget.atual + n; i++)
            Text(i > widget.max ? '' : '$i', style: FlutterFlowTheme.numero),

          IconButton(
            onPressed: widget.onForwardPressed,
            icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFFC4C4C4)),
          ),
        ],
      ),
    );
  }
}
