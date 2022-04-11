import 'package:flutter/material.dart';

class PainelPhoto extends StatelessWidget {
  const PainelPhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFFF2F2F2),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Expanded(child: Container(color: Colors.blue)),
              SizedBox(height: 10),
              Expanded(child: Container(color: Colors.red)),
            ],
          ),
        ));
  }
}
