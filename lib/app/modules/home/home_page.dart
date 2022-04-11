// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:flutter_triple/flutter_triple.dart';
// import 'home_store.dart';

import 'dart:math';

import 'package:flutter_modular/flutter_modular.dart';
// import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/tetra_card.dart';

import '../flutter_flow/flutter_flow_theme.dart';
// import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

int _intInRange(Random source, int min, int max) =>
    source.nextInt(max - min) + min;
final random = new Random();
final analises = List.generate(
  10,
  (index) => Analise(
    lote: '',
    data: DateTime(2021),
    vigor: _intInRange(random, 60, 99),
    viabilidade: _intInRange(random, 60, 99),
    mecanico: _intInRange(random, 0, 20),
    umidade: _intInRange(random, 0, 20),
    bug: _intInRange(random, 0, 20),
    dura: _intInRange(random, 0, 20),
  ),
);

class Analise {
  final String lote;
  final DateTime data;
  final int vigor;
  final int viabilidade;
  final int mecanico;
  final int umidade;
  final int bug;
  final int dura;

  Analise({
    required this.lote,
    required this.data,
    required this.vigor,
    required this.viabilidade,
    required this.mecanico,
    required this.umidade,
    required this.bug,
    required this.dura,
  });
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [],
        centerTitle: true,
        elevation: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('novo');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: Icon(Icons.add),
      ),
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: ListView.builder(
            // scrollDirection: Axis.vertical,
            // shrinkWrap: true,
            // physics: BouncingScrollPhysics(),

            itemCount: analises.length,
            itemBuilder: (_, __) {
              return Container(height: 100, color: Colors.amber);
              // return TetraCard();
            }),
      ),
    );
  }
}
