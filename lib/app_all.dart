import 'package:async/async.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_classification.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_damages.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_legend.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_photo.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/panel_number.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/display_dano.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/painel_viabilidade.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/tetra_card.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/interpretation_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/number_seeds_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app/shared/widgets/custom_line_datepicker/custom_line_date_picker_widget.dart';

class AppWidgetMain extends StatelessWidget {
  AnalysisEntity? analise;

  AppWidgetMain({this.analise});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tetrazólio Digital',
      // home: TelaListaAnalise(),
      home: TelaResumo(analysis: this.analise ?? AnalysisEntity.empty()),
      theme: ThemeData(
        primarySwatch: createMaterialColor(FlutterFlowTheme.primaryColor),
      ),
    );
  }
}

class TelaListaAnalise extends StatefulWidget {
  const TelaListaAnalise({Key? key}) : super(key: key);

  @override
  State<TelaListaAnalise> createState() => _TelaListaAnaliseState();
}

class _TelaListaAnaliseState extends State<TelaListaAnalise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Análises"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showDetailsPage();
          },
          child: Icon(Icons.add)),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(ANALYSIS)
            // .where('users.' + _auth.currentUser.uid, isEqualTo: true)
            .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return _buildLoading(context);
            default:
              List<DocumentSnapshot> docs = snapshot.data!.docs;

              var list = docs
                  .map((e) => AnalysisMapper.fromMap(e.data() as Map))
                  .toList();

              return _buildList(list);
          }
        },
      ),
    );
  }

  Widget _buildList(List<AnalysisEntity> list) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return TetraCard(
            item: list[index],
            onSelect: (() {
              _showDetailsPage(analysis: list[index]);
              // Modular.to.pushNamed('./details', arguments: list[index]);
            }));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 0,
          color: Colors.grey[200],
        );
      },
    );
  }

  void _showDetailsPage({AnalysisEntity? analysis}) {
    final AnalysisEntity analysisEntity =
        analysis == null ? AnalysisEntity.empty() : analysis.copyWith();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAnalysisFormPage(analysis: analysisEntity),
      ),
    );
  }
}

Widget _buildLoading(BuildContext context) {
  return Center(
    child: CircularProgressIndicator.adaptive(),
  );
}

void _save(AnalysisEntity analysis) {
  FirebaseFirestore.instance
      .collection(ANALYSIS)
      .doc(analysis.id)
      .set(AnalysisMapper.toMap(analysis));
}

class AddAnalysisFormPage extends StatefulWidget {
  AnalysisEntity analysis;

  AddAnalysisFormPage({
    Key? key,
    required this.analysis,
  }) : super(key: key);

  @override
  State<AddAnalysisFormPage> createState() => _AddAnalysiFormsPageState();
}

class _AddAnalysiFormsPageState extends State<AddAnalysisFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Formulário de Análise")),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "btn1",
            onPressed: () {
              _save(widget.analysis);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaRepetitionPage(
                    analysis: widget.analysis,
                  ),
                ),
              );
            },
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              _save(widget.analysis);
              Navigator.pop(context);
            },
            child: Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                onChanged: (value) {
                  widget.analysis = widget.analysis.copyWith(sample: value);
                },
                initialValue: widget.analysis.sample,
                decoration: InputDecoration(labelText: "Amostra"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  widget.analysis = widget.analysis.copyWith(local: value);
                },
                initialValue: widget.analysis.local,
                decoration: InputDecoration(labelText: "Local"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  widget.analysis = widget.analysis
                      .copyWith(numberSeeds: NumberSeedsEntity.r2s50());
                },
                initialValue: widget.analysis.numberSeeds.toString(),
                decoration:
                    InputDecoration(labelText: "Número de sementes testadas"),
              ),
              SizedBox(height: 20),
              TextFormField(
                onChanged: (value) {
                  widget.analysis = widget.analysis
                      .copyWith(concentration: double.tryParse(value) ?? 0.00);
                },
                initialValue: widget.analysis.concentration.toStringAsFixed(2),
                decoration:
                    InputDecoration(labelText: "Concentração da solução"),
              ),
              SizedBox(height: 20),
              CustomLineDataPickerWidget(
                context,
                label: "Data da análise",
                initialValue: widget.analysis.date,
                onChangeDate: (value) {
                  widget.analysis = widget.analysis.copyWith(date: value);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TelaRepetitionPage extends StatefulWidget {
  AnalysisEntity analysis;

  TelaRepetitionPage({
    Key? key,
    required this.analysis,
  }) : super(key: key);

  @override
  State<TelaRepetitionPage> createState() => _TelaRepetitionPageState();
}

class _TelaRepetitionPageState extends State<TelaRepetitionPage> {
  PageController pg = PageController(initialPage: 0);

  bool _finish = false;
  int _repeticaoAtual = 1;
  int _atualInterpretation = 1;

  late DocumentReference<Map<String, dynamic>> _analiseRef;

  @override
  void initState() {
    _analiseRef =
        FirebaseFirestore.instance.collection(ANALYSIS).doc(widget.analysis.id);

    for (var i = widget.analysis.repetitions.length;
        i < widget.analysis.numberSeeds.repetitions;
        i++) {
      widget.analysis.repetitions.add(RepetitionEntity.empty());
    }

    for (var i = widget.analysis.repetitions[0].interpretations.length;
        i < widget.analysis.numberSeeds.seeds;
        i++) {
      String id = (i + 1).toString().padLeft(3, '0');
      widget.analysis.repetitions[0].interpretations.add(
        InterpretationEntity(
          id: id,
          classification: 1,
          photos: [],
          damages: [],
        ),
      );
    }

    _analiseRef.set(AnalysisMapper.toMap(widget.analysis));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: Text(
                "Repetição $_repeticaoAtual/${widget.analysis.numberSeeds.repetitions}",
              ),
            ),
          ),
          if (_finish)
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          TelaResumo(analysis: widget.analysis),
                    ),
                  );
                },
                child: Text('Finalizar'),
              ),
            ),
        ],
      ),
      body: Column(
        children: [
          PainelNumber(
            onBackPressed: onBackPressed,
            onForwardPressed: onForwardPressed,
            atual: this._atualInterpretation,
            max: widget.analysis.numberSeeds.seeds,
          ),
          Expanded(
            child: PageView(
                controller: pg,
                children: widget
                    .analysis.repetitions[_repeticaoAtual - 1].interpretations
                    .map((i) => FormInterpretation(
                          i,
                          onChange: onChangeInterpretation,
                        ))
                    .toList()),
          ),
          PainelSeparator(),
          PainelLegend()
        ],
      ),
    );
  }

  void onBackPressed() {
    int page = pg.page!.toInt();
    if (page <= 0) return;

    page -= 1;

    pg.animateToPage(page,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      this._atualInterpretation = page + 1;
    });

    // print(page);
  }

  void onForwardPressed() {
    int page = pg.page!.toInt();
    if (page >= widget.analysis.numberSeeds.seeds - 1) {
      setState(() {
        _finish = true;
      });
      return;
    }

    page += 1;

    pg.animateToPage(page,
        duration: Duration(milliseconds: 200), curve: Curves.bounceInOut);

    setState(() {
      this._atualInterpretation = page + 1;
    });
  }

  void onFinishPressed() {
    print('onFinishPressed');
  }

  Map<String, RestartableTimer?> _timers = Map();

  void onChangeInterpretation(InterpretationEntity interpretation) {
    int index = int.parse(interpretation.id) - 1;

    widget.analysis.repetitions[_repeticaoAtual - 1].interpretations[index] =
        interpretation;

    RestartableTimer? _timer;

    if (_timers.containsKey(widget.analysis.id)) {
      _timer = _timers[widget.analysis.id];
    }

    if (_timer == null || !_timer.isActive) {
      _timer = RestartableTimer(Duration(seconds: 2), () {
        _save(widget.analysis);
      });

      _timers[widget.analysis.id] = _timer;
    } else {
      _timer.reset();
    }
  }
}

class FormInterpretation extends StatefulWidget {
  InterpretationEntity interpretation;
  final void Function(InterpretationEntity)? onChange;

  FormInterpretation(
    this.interpretation, {
    Key? key,
    this.onChange,
  }) : super(key: key);

  @override
  State<FormInterpretation> createState() => _FormInterpretationState();
}

Map<DamageType, int> _damageMap(List<DamageEntity> damages) {
  _damageToInt(DamageType type) {
    var dl = damages.where((d) => d.type == type);
    if (dl.isEmpty) return 0;
    return dl.first.main ? 2 : 1;
  }

  return {
    DamageType.bug: _damageToInt(DamageType.bug),
    DamageType.drop: _damageToInt(DamageType.drop),
    DamageType.engine: _damageToInt(DamageType.engine),
    DamageType.diamont: _damageToInt(DamageType.diamont),
  };
}

class _FormInterpretationState extends State<FormInterpretation> {
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(child: PainelPhoto()),
          PainelClassification(
            this.widget.interpretation.classification,
            onChange: onChageClassification,
          ),
          PainelSeparator(),
          PainelDamages(
            onTap: onDamageChange,
            damages: _damageMap(widget.interpretation.damages),
          ),
        ],
      ),
    );
  }

  void onDamageChange(DamageType d) {
    var damage = widget.interpretation.damages.where((e) => e.type == d);
    var main = widget.interpretation.damages.where((e) => e.main);

    if (damage.isEmpty) {
      widget.interpretation.damages.add(DamageEntity(type: d, main: false));
    } else {
      List<DamageEntity> damages = widget.interpretation.damages;

      if (main.isNotEmpty) {
        if (main.first.type == d) {
          damages =
              widget.interpretation.damages.where((e) => e.type != d).toList();
        }
      }

      damages = damages.map((e) {
        if (e.type == d) {
          return e.copyWith(main: !e.main);
        } else {
          return e.copyWith(main: false);
        }
      }).toList();

      widget.interpretation.damages.clear();
      widget.interpretation.damages.addAll(damages);
    }

    setState(() {});

    updateColeta();
  }

  void onChageClassification(int value) {
    widget.interpretation = widget.interpretation.copyWith(
      classification: value,
    );

    updateColeta();
  }

  void updateColeta() async {
    if (this.widget.onChange != null)
      this.widget.onChange!(this.widget.interpretation);
  }
}

class TelaResumo extends StatefulWidget {
  AnalysisEntity analysis;

  TelaResumo({
    Key? key,
    required this.analysis,
  }) : super(key: key);

  @override
  State<TelaResumo> createState() => _TelaResumoState();
}

class _TelaResumoState extends State<TelaResumo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Resumo - ${widget.analysis.local}'),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Repetição 01',
                            style: FlutterFlowTheme.subtitle1.apply(
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ),
                    PainelVisibilidade(
                      vigor: widget.analysis.vigor,
                      viability: widget.analysis.viability,
                    ),
                  ],
                ),
              ),
              PainelSeparator(),
              PainelGridRow(
                child1: Container(),
                child2: DisplayDano(type: 'engine'),
                child3: DisplayDano(type: 'drop'),
                child4: DisplayDano(type: 'bug'),
                child5: DisplayDano(type: 'diamont'),
              ),
              PainelGridRow(
                child1: Text('1-8'),
                child2: Text('12'),
                child3: Text('54'),
                child4: Text('4'),
                child5: Text('0'),
              ),
              PainelSeparator(),
              PainelGridRow(
                child1: Text('6-8'),
                child2: Text('12'),
                child3: Text('54'),
                child4: Text('4'),
                child5: Text('0'),
              ),
            ],
          ),
        ));
  }
}

class PainelGridRow extends StatelessWidget {
  final Widget? child1;
  final Widget? child2;
  final Widget? child3;
  final Widget? child4;
  final Widget? child5;
  const PainelGridRow({
    Key? key,
    this.child1,
    this.child2,
    this.child3,
    this.child4,
    this.child5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 1,
            child: Center(
                child: child1 ?? Container(color: Colors.amber, height: 50))),
        Expanded(
            flex: 2,
            child: Center(
                child: child2 ?? Container(color: Colors.blue, height: 50))),
        Expanded(
            flex: 2,
            child: Center(
                child: child3 ?? Container(color: Colors.cyan, height: 50))),
        Expanded(
            flex: 2,
            child: Center(
                child: child4 ?? Container(color: Colors.green, height: 50))),
        Expanded(
            flex: 2,
            child: Center(
                child: child5 ?? Container(color: Colors.indigo, height: 50))),
      ],
    );
  }
}
