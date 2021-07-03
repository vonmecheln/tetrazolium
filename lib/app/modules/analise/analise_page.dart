import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analise/analise_store.dart';
import 'package:flutter/material.dart';

class AnalisePage extends StatefulWidget {
  final String title;
  const AnalisePage({Key? key, this.title = 'AnalisePage'}) : super(key: key);
  @override
  AnalisePageState createState() => AnalisePageState();
}
class AnalisePageState extends State<AnalisePage> {
  final AnaliseStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}