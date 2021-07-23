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

  final _pageSojaController = PageController(
    viewportFraction: 0.8,
  );

  final _numberSojaController = PageController(
    viewportFraction: 0.1,
  );

  void _scrollPageListener() {}

  void _numberPageListener() {}

  @override
  void initState() {
    _pageSojaController.addListener(_scrollPageListener);
    _numberSojaController.addListener(_numberPageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageSojaController.removeListener(_scrollPageListener);
    _pageSojaController.dispose();
    _numberSojaController.removeListener(_numberPageListener);
    _numberSojaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            PageView.builder(
                controller: _pageSojaController,
                onPageChanged: (value) {
                  _numberSojaController.animateToPage(
                    value,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.linear,
                  );
                },
                itemCount: analises.length,
                itemBuilder: (_, index) {
                  final coleta = analises[index];

                  Widget wd = Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      color: Colors.black12,
                      child: Column(
                        children: [
                          Container(height: 150),
                          ImageSoja(imagem: coleta.imageE),
                          ImageSoja(imagem: coleta.imageI),
                        ],
                      ),
                    ),
                  );
                  return wd;
                }),
            Container(
              height: 150,
              color: Colors.red,
              child: PageView.builder(
                  onPageChanged: (value) {
                    _pageSojaController.animateToPage(
                      value,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  },
                  controller: _numberSojaController,
                  itemCount: analises.length,
                  itemBuilder: (_, index) {
                    return Container(
                      color: Colors.amber,
                      width: 20,
                      height: 20,
                      child: Text(index.toString()),
                    );
                  }),
            ),
          ],
        ));
  }
}

class ImageSoja extends StatelessWidget {
  const ImageSoja({
    Key? key,
    required this.imagem,
  }) : super(key: key);

  final String imagem;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagem,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}

int _intInRange(Random source, int min, int max) =>
    source.nextInt(max - min) + min;
final random = new Random();
final analises = List.generate(
  10,
  (index) => Coleta(
    imageE:
        "assets/w200r/t" + (2 * index + 1).toString().padLeft(3, '0') + ".JPG",
    imageI:
        "assets/w200r/t" + (2 * index + 2).toString().padLeft(3, '0') + ".JPG",
    mecanico: _intInRange(random, 0, 20),
    // mecanico: index,
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
