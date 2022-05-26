// ignore_for_file: must_be_immutable

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
import 'package:tetrazolium/app/shared/domain/entities/resume_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app/shared/widgets/custom_line_datepicker/custom_line_date_picker_widget.dart';

class AppWidgetMain extends StatelessWidget {
  final AnalysisEntity? analise;

  AppWidgetMain({this.analise});

  @override
  Widget build(BuildContext context) {
    // AnalysisEntity? _seedAnalise(AnalysisEntity? analise) {
    //   if (analise == null) return null;
    //   var ns = NumberSeedsEntity(repetitions: 2, seeds: 5);

    //   List<RepetitionEntity> repetitions = [];

    //   for (var i = 0; i < ns.repetitions; i++) {
    //     List<InterpretationEntity> interpretations = [];

    //     for (var s = 0; s < ns.seeds; s++) {
    //       interpretations.add(InterpretationEntity(
    //         classification: 1,
    //         photos: [],
    //         damages: [
    //           DamageEntity(type: DamageType.bug, main: true),
    //           DamageEntity(type: DamageType.drop, main: false),
    //           DamageEntity(type: DamageType.engine, main: false),
    //         ],
    //       ));
    //     }

    //     repetitions.add(RepetitionEntity(
    //       number: 1,
    //       viability: 80,
    //       vigor: 90,
    //       interpretations: interpretations,
    //       resultClassication: {},
    //       resume: ResumeEntity.empty(),
    //     ));
    //   }

    //   analise = analise.copyWith(
    //     numberSeeds: ns,
    //     viability: 80,
    //     vigor: 90,
    //     repetitions: repetitions,
    //   );
    //   _save(analise);
    //   return analise;
    // }

    // analise = _seedAnalise(analise);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tetrazólio Digital',
      home: TelaListaAnalise(),
      // home: TelaResumo(analysis: this.analise ?? AnalysisEntity.empty()),
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
      physics: const AlwaysScrollableScrollPhysics(),
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
              _initAnalise(widget.analysis);

              final finisheds = widget.analysis.repetitions
                  .where((r) => r.state == RepetitionState.finish)
                  .length;

              if (finisheds == widget.analysis.repetitions.length) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaResumo(
                      analysis: widget.analysis,
                    ),
                  ),
                );
              } else {
                final nextRepetition = widget.analysis.repetitions.firstWhere(
                  (r) => r.state == RepetitionState.started,
                  orElse: () => RepetitionEntity.empty(),
                );

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaRepetitionPage(
                      analysis: widget.analysis,
                      currencyRepetition: nextRepetition.number,
                    ),
                  ),
                  ModalRoute.withName('/'),
                );
              }
            },
            child: Icon(Icons.camera),
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "btn2",
            onPressed: () {
              _initAnalise(widget.analysis);
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

AnalysisEntity _initAnalise(AnalysisEntity analysis) {
  List<RepetitionEntity> repetitions = [];

  for (var i = 0; i < analysis.numberSeeds.repetitions; i++) {
    var repetition = analysis.repetitions.firstWhere(
      (r) => r.number == i,
      orElse: () => RepetitionEntity.empty().copyWith(
        number: i,
      ),
    );

    List<InterpretationEntity> interpretations = [];

    for (var s = 0; s < analysis.numberSeeds.seeds; s++) {
      String id = (s + 1).toString().padLeft(3, '0');

      var interpretation = repetition.interpretations.firstWhere(
        (i) => i.id == id,
        orElse: () => InterpretationEntity.empty().copyWith(
          id: id,
        ),
      );

      interpretations.add(interpretation);
    }

    repetitions.add(repetition.copyWith(
      interpretations: interpretations,
      // state: (init && i == 0) ? RepetitionState.started : null,
    ));
  }

  //varifica se já tem alguma repetição iniciada
  final startds = repetitions.where((r) => r.state == RepetitionState.started);
  //Se não houver, inicia a primeira não iniciada
  if (startds.isEmpty) {
    final notStartds =
        repetitions.where((r) => r.state == RepetitionState.notStarted);
    if (notStartds.isNotEmpty) {
      final notStartdrepetition = notStartds.first;

      List<RepetitionEntity> tmpRepetitions = repetitions
          .map(
            (r) => r.number == notStartdrepetition.number
                ? r.copyWith(state: RepetitionState.started)
                : r,
          )
          .toList();
      repetitions = tmpRepetitions;
    }
  }

  analysis = analysis.copyWith(repetitions: repetitions);

  _save(analysis);

  return analysis;
}

class TelaRepetitionPage extends StatefulWidget {
  AnalysisEntity analysis;
  final int currencyRepetition;

  TelaRepetitionPage({
    Key? key,
    required this.analysis,
    required this.currencyRepetition,
  }) : super(key: key);

  @override
  State<TelaRepetitionPage> createState() => _TelaRepetitionPageState();
}

class _TelaRepetitionPageState extends State<TelaRepetitionPage> {
  PageController pg = PageController(initialPage: 0);

  bool _finish = false;
  int _atualInterpretation = 1;

  @override
  void initState() {
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
                "Repetição ${widget.currencyRepetition + 1}/${widget.analysis.numberSeeds.repetitions}",
              ),
            ),
          ),
          if (_finish)
            Padding(
              padding: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
              child: ElevatedButton(
                onPressed: () {
                  _sumariseRepetition(widget.currencyRepetition);

                  Navigator.pushReplacement(
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
                children: widget.analysis.repetitions[widget.currencyRepetition]
                    .interpretations
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
      return;
    }

    page += 1;

    if (page >= widget.analysis.numberSeeds.seeds - 1) {
      _finish = true;
    }

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

    widget.analysis.repetitions[widget.currencyRepetition]
        .interpretations[index] = interpretation;

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

  _sumariseRepetition(int currencyRepetition) {
    int _filter(DamageType t, [int c = 1]) {
      return this
          .widget
          .analysis
          .repetitions[currencyRepetition]
          .interpretations
          .where((e) => e.classification >= c)
          .where((e) => e.damages.where((d) => d.type == t).isNotEmpty)
          .length;
    }

    int _percentize(int value) {
      return (value * 100 / this.widget.analysis.numberSeeds.seeds).round();
    }

    final Map<DamageType, int> sumari18 = {
      for (var d in DamageType.values) d: _percentize(_filter(d)),
    };

    final Map<DamageType, int> sumari68 = {
      for (var d in DamageType.values) d: _percentize(_filter(d, 6)),
    };

    List<int> countClass = [];
    for (var c = 1; c <= 8; c++) {
      countClass.add(this
          .widget
          .analysis
          .repetitions[currencyRepetition]
          .interpretations
          .where((e) => e.classification == c)
          .length);
    }

    int vigor = countClass[0] + countClass[1] + countClass[2];
    int viability = vigor + countClass[3] + countClass[4];

    print("$vigor $viability");

    RepetitionEntity rep =
        this.widget.analysis.repetitions[currencyRepetition].copyWith(
              state: RepetitionState.finish,
              viability: _percentize(viability),
              vigor: _percentize(vigor),
              resume: ResumeEntity(
                damageSumary18: sumari18,
                damageSumary68: sumari68,
              ),
            );

    List<RepetitionEntity> repetitions = [];

    for (var i = 0; i < this.widget.analysis.repetitions.length; i++) {
      repetitions.add(
          i == currencyRepetition ? rep : this.widget.analysis.repetitions[i]);
    }

    this.widget.analysis =
        this.widget.analysis.copyWith(repetitions: repetitions);

    _save(this.widget.analysis);
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
  void initState() {
    super.initState();
  }

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
              Column(
                children: widget.analysis.repetitions
                    .where((r) => r.state == RepetitionState.finish)
                    .map((r) => ResumoRepWidget(
                          repetition: r,
                          onEditPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaRepetitionPage(
                                  analysis: widget.analysis,
                                  currencyRepetition: r.number,
                                ),
                              ),
                            );
                          },
                        ))
                    .toList(),
              ),
              _nextOrResume(),
            ],
          ),
        ));
  }

  Widget _nextOrResume() {
    var notStarteds = this.widget.analysis.repetitions.where(
          (e) => e.state == RepetitionState.notStarted,
        );

    if (notStarteds.isEmpty) {
      var media = RepetitionEntity.empty();

      this.widget.analysis.repetitions.forEach((r) {
        Map<DamageType, int> _combineResume(
            Map<DamageType, int> a, Map<DamageType, int> b) {
          return {
            for (var d in DamageType.values) d: (a[d] ?? 0) + (b[d] ?? 0)
          };
        }

        media = RepetitionEntity(
          number: 0,
          viability: media.viability + r.viability,
          vigor: media.vigor + r.vigor,
          interpretations: [],
          resultClassication: {},
          resume: ResumeEntity(
            damageSumary18: _combineResume(
              media.resume.damageSumary18,
              r.resume.damageSumary18,
            ),
            damageSumary68: _combineResume(
              media.resume.damageSumary68,
              r.resume.damageSumary68,
            ),
          ),
        );
      });

      ResumeEntity _mediaResume(ResumeEntity resume, int length) {
        Map<DamageType, int> _mediaDamageResume(
            Map<DamageType, int> damageSumary) {
          return {
            for (var d in DamageType.values)
              d: ((damageSumary[d] ?? 0) / length).round()
          };
        }

        resume = resume.copyWith(
          damageSumary18: _mediaDamageResume(resume.damageSumary18),
          damageSumary68: _mediaDamageResume(resume.damageSumary68),
        );

        return resume;
      }

      media = RepetitionEntity(
          number: 0,
          viability: (media.viability / this.widget.analysis.repetitions.length)
              .round(),
          vigor:
              (media.vigor / this.widget.analysis.repetitions.length).round(),
          interpretations: [],
          resultClassication: {},
          resume: _mediaResume(
            media.resume,
            this.widget.analysis.repetitions.length,
          ));

      return Column(
        children: [
          ResumoRepWidget(repetition: media),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(
                context,
                ModalRoute.withName('/'),
              );
            },
            child: Text('Finalizar'),
          ),
        ],
      );
    } else {
      var nr = notStarteds.first.number;
      return ElevatedButton(
        onPressed: () {
          //TODO: alterar o estado da repetição
          //notStarteds.first.state = RepetitionState.started;
          // _save(widget.analysis);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TelaRepetitionPage(
                analysis: widget.analysis,
                currencyRepetition: nr,
              ),
            ),
          );
        },
        child: Text('Iniciar ${nr + 1}ª Repetição'),
      );
    }
  }
}

class ResumoRepWidget extends StatelessWidget {
  final RepetitionEntity repetition;
  final void Function()? onEditPressed;
  const ResumoRepWidget({
    Key? key,
    required this.repetition,
    this.onEditPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sumari18 = repetition.resume.damageSumary18;
    var sumari68 = repetition.resume.damageSumary68;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: onEditPressed == null
                    ? Text('Média')
                    : Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Repetição ${repetition.number + 1}',
                            style: FlutterFlowTheme.subtitle1.apply(
                              fontFamily: 'Poppins',
                            ),
                          ),
                          IconButton(
                            onPressed: onEditPressed,
                            icon: Icon(Icons.edit),
                          ),
                        ],
                      ),
              ),
              PainelVisibilidade(
                vigor: repetition.vigor,
                viability: repetition.viability,
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
          child1: damageLegend('1-8'),
          child2: damageText(sumari18[DamageType.engine] ?? 0),
          child3: damageText(sumari18[DamageType.drop] ?? 0),
          child4: damageText(sumari18[DamageType.bug] ?? 0),
          child5: damageText(sumari18[DamageType.diamont] ?? 0),
        ),
        PainelSeparator(),
        PainelGridRow(
          child1: damageLegend('6-8'),
          child2: damageText(sumari68[DamageType.engine] ?? 0),
          child3: damageText(sumari68[DamageType.drop] ?? 0),
          child4: damageText(sumari68[DamageType.bug] ?? 0),
          child5: damageText(sumari68[DamageType.diamont] ?? 0),
        ),
      ],
    );
  }

  Text damageLegend(String value) => Text(
        '$value',
        style: FlutterFlowTheme.subtitle1.apply(
          fontFamily: 'Poppins',
          color: FlutterFlowTheme.color2,
        ),
      );

  Text damageText(int value) => Text(
        '$value',
        style: FlutterFlowTheme.subtitle1.apply(
          fontFamily: 'Poppins',
        ),
      );
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
