import 'dart:math';

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

int _intInRange(Random source, int min, int max) =>
    source.nextInt(max - min) + min;
final random = new Random();
final analises = List.generate(
  10,
  (index) => Coleta(
    imageE: '',
    imageI: '',
    mecanico: _intInRange(random, 0, 20),
    umidade: _intInRange(random, 0, 20),
    bug: _intInRange(random, 0, 20),
    dura: _intInRange(random, 0, 20),
    classificacao: _intInRange(random, 1, 8),
  ),
);

class Coleta {
  final String imageE;
  final String imageI;
  final int mecanico;
  final int umidade;
  final int bug;
  final int dura;
  final int classificacao;

  Coleta({
    required this.imageE,
    required this.imageI,
    required this.mecanico,
    required this.umidade,
    required this.bug,
    required this.dura,
    required this.classificacao,
  });

  //String get dataf => DateFormat('dd/MM/yyyy').format(data);
}
