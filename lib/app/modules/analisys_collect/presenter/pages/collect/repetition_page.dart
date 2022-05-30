import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/form_collect.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_legend.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/panel_number.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class RepetitionPage extends StatefulWidget {
  final String title;
  const RepetitionPage({Key? key, this.title = 'Lote 01-56'}) : super(key: key);
  @override
  RepetitionPageState createState() => RepetitionPageState();
}

class RepetitionPageState extends State<RepetitionPage> {
  PageController pg = PageController(initialPage: 0);

  List<CollectEntity> coletas = [];
  int atual = 1;
  int numRept = 10;

  @override
  void initState() {
    super.initState();
  }

  Future _getColetas() async {
    if (coletas.isNotEmpty) return;

    var collection = FirebaseFirestore.instance.collection(
        'analises/c36342b3-b981-471b-8554-142c3d82dd28/repeticao/1/coleta');
    // var doc = collection.doc(atual.toString());

    var docs = await collection.get();

    for (var e in docs.docs) {
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
        CollectEntity(
          id: id,
          number: id,
          classification: extract(e, 'classification', 1),
          hard: extract(e, 'dura', 0),
          damageEngine: e['damage']['engine'],
          damageHumidity: e['damage']['humidity'],
          damageBug: e['damage']['bug'],
        ),
      );
    }

    for (var i = coletas.length; i < numRept; i++) {
      String id = (i + 1).toString().padLeft(3, '0');
      coletas.add(
        CollectEntity(
          id: id,
          number: id,
          classification: 1,
          hard: 0,
          damageEngine: 0,
          damageHumidity: 0,
          damageBug: 0,
        ),
      );
    }

    for (var c in coletas) {
      onChangeColeta(c);
    }
  }

  bool _finish = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 4,
        actions: [
          const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Center(
              child: Text("Repetição 1/2"),
            ),
          ),
          if (_finish)
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: ElevatedButton(
                style: ButtonStyle(
                  // overlayColor: MaterialStateProperty.all<Color>(Colors.green),
                  textStyle:
                      MaterialStateProperty.all<TextStyle>(const TextStyle(
                    color: Color.fromARGB(255, 195, 65, 9),
                    // backgroundColor: Colors.black,
                  )),
                  // backgroundColor:
                  //     MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: onFinishPressed,
                child: const Text('Finalizar'),
              ),
            ),
        ],
      ),
      body: FutureBuilder(
          future: _getColetas(),
          builder: (context, _snap) {
            return Column(
              children: [
                PainelNumber(
                  onBackPressed: onBackPressed,
                  onForwardPressed: onForwardPressed,
                  atual: atual,
                  max: numRept,
                ),
                Expanded(
                  child: PageView(
                    controller: pg,
                    children: coletas
                        .map((c) => FormCollect(c, onChange: onChangeColeta))
                        .toList(),
                  ),
                ),
                const PainelSeparator(),
                const PainelLegend()
              ],
            );
          }),
      drawer: const Drawer(),
    );
  }

  void onBackPressed() {
    int page = pg.page!.toInt();
    if (page <= 0) return;

    page -= 1;

    pg.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      atual = page + 1;
    });

    // print(page);
  }

  void onForwardPressed() {
    int page = pg.page!.toInt();
    if (page >= numRept - 1) {
      setState(() {
        _finish = true;
      });
      return;
    }

    page += 1;

    pg.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      atual = page + 1;
    });
    // print(page);
  }

  void onFinishPressed() {
    debugPrint('onFinishPressed');
  }

  final Map<String, RestartableTimer?> _timers = {};

  void onChangeColeta(CollectEntity coleta) {
    RestartableTimer? _timer;
    if (_timers.containsKey(coleta.number)) {
      _timer = _timers[coleta.number];
    }

    if (_timer == null || !_timer.isActive) {
      _timer = RestartableTimer(const Duration(seconds: 2), () {
        var collection = FirebaseFirestore.instance.collection(
            'analises/c36342b3-b981-471b-8554-142c3d82dd28/repeticao/1/coleta');
        var doc = collection.doc(coleta.number);
        doc.set(coleta.toMap());
      });
      _timers[coleta.number] = _timer;
    } else {
      _timer.reset();
    }
  }
}
