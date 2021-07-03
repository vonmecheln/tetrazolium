import 'package:flutter/material.dart';
import 'package:tetrazolium/app/constants.dart';

class NovoPage extends StatefulWidget {
  const NovoPage({Key? key}) : super(key: key);

  @override
  _NovoPageState createState() => _NovoPageState();
}

class _NovoPageState extends State<NovoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANÁLISES"),
      ),
    );
  }
}
