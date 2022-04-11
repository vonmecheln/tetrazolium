import 'package:async/async.dart';
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

enum DamageType {
  bug,
  engine,
  drop,
  diamont,
}

class Coleta {
  final String numero;
  int classificacao = 0;
  int danoMecanico = 0;
  int danoUmidade = 0;
  int danoPercevejo = 0;
  int dura = 0;

  Coleta(this.numero);

  Map<String, dynamic> toMap() {
    return {
      'number': numero,
      'classification': classificacao,
      'damage': {
        'bug': danoPercevejo,
        'engine': danoMecanico,
        'humidity': danoUmidade,
      },
      'dura': dura,

      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }

  Map<DamageType, int> damageMap() {
    return {
      DamageType.bug: danoPercevejo,
      DamageType.engine: danoMecanico,
      DamageType.drop: danoUmidade,
      DamageType.diamont: dura,
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
  }

  Future _getColetas() async {
    var collection = FirebaseFirestore.instance.collection(
        'analises/c36342b3-b981-471b-8554-142c3d82dd28/repeticao/1/coleta');
    // var doc = collection.doc(atual.toString());

    var docs = await collection.get();

    docs.docs.forEach((e) {
      // int id = int.tryParse(e.id) ?? 0;
      String id = e.id;

      int extract(
        QueryDocumentSnapshot<Map<String, dynamic>> e,
        String field,
        int defvalue,
      ) {
        if (!e.data().containsKey(field)) return defvalue;
        var value = e.get(field);
        if (value == null) return defvalue;

        return int.tryParse(value.toString()) ?? defvalue;
      }

      coletas.add(
        Coleta(id)
          ..classificacao = extract(e, 'classification', 1)
          ..dura = extract(e, 'dura', 0)
          ..danoMecanico = e['damage']['engine']
          ..danoUmidade = e['damage']['humidity']
          ..danoPercevejo = e['damage']['bug'],
      );
    });

    print(coletas.length);

    for (var i = coletas.length; i < numRept; i++) {
      String id = (i + 1).toString().padLeft(3, '0');
      coletas.add(Coleta(id)..classificacao = 1);
    }

    print(coletas.length);
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
      body: FutureBuilder(
          future: _getColetas(),
          builder: (context, _snap) {
            return Column(
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
            );
          }),
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

    // print(page);
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
    // print(page);
  }

  RestartableTimer? _timer;

  void onChangeColeta(Coleta coleta) {
    if (_timer == null || !_timer!.isActive) {
      _timer = RestartableTimer(Duration(seconds: 1), () {
        print(coleta.toMap());

        var collection = FirebaseFirestore.instance.collection(
            'analises/c36342b3-b981-471b-8554-142c3d82dd28/repeticao/1/coleta');
        var doc = collection.doc(coleta.numero);
        doc.set(coleta.toMap());
      });
    } else {
      _timer!.reset();
    }
  }
}

class ColetaForm extends StatefulWidget {
  final Coleta coleta;
  final void Function(Coleta)? onChange;

  const ColetaForm(
    this.coleta, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<ColetaForm> createState() => _ColetaFormState();
}

class _ColetaFormState extends State<ColetaForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: PainelFoto()),
          PainelClasse(
            this.widget.coleta.classificacao,
            onChange: onChageClassification,
          ),
          PainelSeparator(),
          PainelDanos(
            onTap: onDamageChange,
            damages: widget.coleta.damageMap(),
          ),
        ],
      ),
    );
  }

  void onDamageChange(d) {
    if (d == DamageType.diamont) {
      widget.coleta.danoMecanico = 0;
      widget.coleta.danoPercevejo = 0;
      widget.coleta.danoUmidade = 0;
      widget.coleta.dura = widget.coleta.dura == 0 ? 1 : 0;
    } else {
      widget.coleta.dura = 0;
    }

    bool zero = widget.coleta.danoMecanico +
            widget.coleta.danoPercevejo +
            widget.coleta.danoUmidade ==
        0;

    if (d == DamageType.bug) {
      widget.coleta.danoPercevejo = zero ? 2 : widget.coleta.danoPercevejo + 1;

      if (widget.coleta.danoPercevejo > 2) {
        widget.coleta.danoPercevejo = 0;
      } else if (widget.coleta.danoPercevejo == 2) {
        if (widget.coleta.danoMecanico > 1) widget.coleta.danoMecanico -= 1;
        if (widget.coleta.danoUmidade > 1) widget.coleta.danoUmidade -= 1;
      }
    }

    if (d == DamageType.drop) {
      widget.coleta.danoUmidade = zero ? 2 : widget.coleta.danoUmidade + 1;

      if (widget.coleta.danoUmidade > 2) {
        widget.coleta.danoUmidade = 0;
      } else if (widget.coleta.danoUmidade == 2) {
        if (widget.coleta.danoMecanico > 1) widget.coleta.danoMecanico -= 1;
        if (widget.coleta.danoPercevejo > 1) widget.coleta.danoPercevejo -= 1;
      }
    }

    if (d == DamageType.engine) {
      widget.coleta.danoMecanico = zero ? 2 : widget.coleta.danoMecanico + 1;

      if (widget.coleta.danoMecanico > 2) {
        widget.coleta.danoMecanico = 0;
      } else if (widget.coleta.danoMecanico == 2) {
        if (widget.coleta.danoUmidade > 1) widget.coleta.danoUmidade -= 1;
        if (widget.coleta.danoPercevejo > 1) widget.coleta.danoPercevejo -= 1;
      }
    }

    setState(() {});

    updateColeta();
  }

  void onChageClassification(int value) {
    this.widget.coleta.classificacao = value;
    updateColeta();
  }

  void updateColeta() async {
    if (this.widget.onChange != null) this.widget.onChange!(this.widget.coleta);
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
  final void Function(DamageType damage)? onTap;
  final Map<DamageType, int>? damages;

  PainelDanos({
    Key? key,
    this.onTap,
    this.damages,
  }) : super(key: key);

  Map<int, Color> colorMap = {
    0: FlutterFlowTheme.color4,
    1: FlutterFlowTheme.color3,
    2: FlutterFlowTheme.color2,
  };

  @override
  Widget build(BuildContext context) {
    List<Widget> itens = [];

    if (damages != null)
      damages?.forEach((type, value) {
        itens.add(
          ItemDano(
            color: colorMap[value],
            type: type,
            onTap: () => onItemTap(type),
          ),
        );
      });

    return Container(
      height: 98,
      color: Color(0xFFF2F2F2),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: itens),
    );
  }

  void onItemTap(DamageType damage) {
    if (onTap != null) onTap!(damage);
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
