import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/item_dano.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/item_legend.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/util/color.dart';

class RepetitionPage extends StatefulWidget {
  final String title;
  const RepetitionPage({Key? key, this.title = 'Lote 01-56'}) : super(key: key);
  @override
  RepetitionPageState createState() => RepetitionPageState();
}

class Coleta {
  final int numero;
  int classificacao = 0;
  int danoMecanico = 0;
  int danoUmidade = 0;
  int danoPercevejo = 0;
  int dura = 0;

  Coleta(this.numero);

  Map<String, dynamic> toMap() {
    return {
      // 'number': numero,
      'classification': classificacao,
      'damage': {
        'bug': danoPercevejo,
        'engine': danoMecanico,
        'humidity': danoUmidade,
      },

      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }
}

class RepetitionPageState extends State<RepetitionPage> {
  PageController pg = PageController(initialPage: 0);

  List<Coleta> coletas = [];
  int atual = 1;
  int numRept = 10;

  @override
  void initState() {
    super.initState();
    for (var i = 1; i <= numRept; i++) {
      coletas.add(Coleta(i)..classificacao = 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 4,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text("Repetição 1/2"),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          PainelNumero(
            onBackPressed: onBackPressed,
            onForwardPressed: onForwardPressed,
            atual: this.atual,
            max: this.numRept,
          ),
          Expanded(
              child: PageView(
            controller: pg,
            children: coletas
                .map((c) => ColetaForm(c, onChange: onChangeColeta))
                .toList(),
          )
              // Container(),
              // PageView(children: coletas.map((e) => Container()).toList()),
              ),
          PainelSeparator(),
          PainelLegenda()
        ],
      ),
      drawer: Drawer(),
    );
  }

  void onBackPressed() {
    int page = pg.page!.toInt();
    if (page <= 0) return;

    page -= 1;

    pg.animateToPage(page,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      atual = page + 1;
    });

    print(page);
  }

  void onForwardPressed() {
    int page = pg.page!.toInt();
    if (page >= numRept) return;

    page += 1;

    pg.animateToPage(page,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      atual = page + 1;
    });
    print(page);
  }

  void onChangeColeta(Coleta coleta) {
    print(coleta.classificacao);

    var collection = FirebaseFirestore.instance.collection(
        'analises/c36342b3-b981-471b-8554-142c3d82dd28/repeticao/1/coleta');
    var doc = collection.doc(atual.toString());
    doc.set(coleta.toMap());
  }
}

class ColetaForm extends StatelessWidget {
  final Coleta coleta;
  final void Function(Coleta)? onChange;

  const ColetaForm(
    this.coleta, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: PainelFoto()),
          PainelClasse(
            this.coleta.classificacao,
            onChange: onChageClassification,
          ),
          PainelSeparator(),
          PainelDanos(),
        ],
      ),
    );
  }

  void onChageClassification(int value) {
    this.coleta.classificacao = value;
    if (this.onChange != null) this.onChange!(this.coleta);
  }
}

class PainelFoto extends StatelessWidget {
  const PainelFoto({Key? key}) : super(key: key);

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

class PainelClasse extends StatefulWidget {
  final int classificacao;
  final void Function(int)? onChange;

  const PainelClasse(
    this.classificacao, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<PainelClasse> createState() => _PainelClasseState();
}

class _PainelClasseState extends State<PainelClasse> {
  double _value = 1.0;

  @override
  void initState() {
    _value = widget.classificacao.toDouble();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        color: Color(0xFFF2F2F2),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Slider(
            activeColor: FlutterFlowTheme.primaryColor,
            inactiveColor: FlutterFlowTheme.primaryColor.withAlpha(100),
            min: 1,
            max: 8,
            label: '${_value.round()}',
            divisions: 7,
            value: _value,
            onChanged: onChanged,
          ),
        ));
  }

  void onChanged(double value) {
    setState(() {
      _value = value;
      if (widget.onChange != null) widget.onChange!(value.round());
    });
  }
}

class PainelNumero extends StatefulWidget {
  final VoidCallback? onBackPressed;
  final VoidCallback? onForwardPressed;
  final int atual;
  final int max;

  const PainelNumero({
    Key? key,
    this.onBackPressed,
    this.onForwardPressed,
    this.atual = 1,
    this.max = 50,
  }) : super(key: key);

  @override
  State<PainelNumero> createState() => _PainelNumeroState();
}

class _PainelNumeroState extends State<PainelNumero> {
  @override
  Widget build(BuildContext context) {
    var n = 3;

    return Container(
      height: 92,
      color: Color(0xFFF2F2F2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Spacer(flex: 14),
          IconButton(
            onPressed: widget.onBackPressed,
            icon: Icon(Icons.arrow_back_ios, color: Color(0xFFC4C4C4)),
          ),

          for (var i = widget.atual - n; i < widget.atual; i++)
            Text(i < 1 ? '' : '$i', style: FlutterFlowTheme.numero),

          PhysicalModel(
            color: FlutterFlowTheme.primaryColor,
            elevation: 1,
            // shadowColor: Colors.blue,
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 44,
              height: 44,
              child: Center(
                child: Text(widget.atual.toString(),
                    style: TextStyle(
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
            icon: Icon(Icons.arrow_forward_ios, color: Color(0xFFC4C4C4)),
          ),
        ],
      ),
    );
  }
}

class PainelDanos extends StatelessWidget {
  const PainelDanos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      color: Color(0xFFF2F2F2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          ItemDano(type: "engine", text: 'Mecânico'),
          ItemDano(type: "drop", text: 'Umidade'),
          ItemDano(type: "bug", text: 'Percevejo'),
          ItemDano(type: "diamont", text: 'Dura'),
        ],
      ),
    );
  }
}

class PainelLegenda extends StatelessWidget {
  const PainelLegenda({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Color(0xFFF2F2F2),
      child: Row(
        children: [
          Spacer(flex: 70),
          ItemLegend(color: Color(0xFFD74745), text: "Dano mais aparente"),
          Spacer(flex: 35),
          ItemLegend(color: Color(0xFF515151), text: "Dano presente"),
          Spacer(flex: 70),
        ],
      ),
    );
  }
}

class PainelPadrao extends StatelessWidget {
  const PainelPadrao({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      color: Colors.yellow,
    );
  }
}
