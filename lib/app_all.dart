import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_legend.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/painel_separator.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/components/panel_number.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/tetra_card.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/interpretation_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/number_seeds_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app/shared/widgets/custom_line_datepicker/custom_line_date_picker_widget.dart';

class AppWidgetMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tetrazólio Digital',
      home: TelaRepetitionPage(
        analysis: AnalysisEntity.empty().copyWith(
          id: "fa3834fa-8570-4328-80bb-9041e31fd527",
          numberSeeds: NumberSeedsEntity(
            repetitions: 3,
            seeds: 10,
          ),
        ),
      ),
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
  void _save() {
    FirebaseFirestore.instance
        .collection(ANALYSIS)
        .doc(widget.analysis.id)
        .set(AnalysisMapper.toMap(widget.analysis));
  }

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
              _save();
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
              _save();
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

  bool _finish = true;
  int _repeticaoAtual = 1;
  int _atualInterpretation = 1;

  late DocumentReference<Map<String, dynamic>> _analiseRef;

  @override
  void initState() {
    print(widget.analysis.id);

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
      widget.analysis.repetitions[0].interpretations
          .add(InterpretationEntity.empty());
    }

    _analiseRef.set(AnalysisMapper.toMap(widget.analysis));

    // for (var i = widget.analysis.coletas.length; i < numRept; i++) {
    //   String id = (i + 1).toString().padLeft(3, '0');
    //   coletas.add(
    //     CollectEntity(
    //       id: id,
    //       number: id,
    //       classification: 1,
    //       hard: 0,
    //       damageEngine: 0,
    //       damageHumidity: 0,
    //       damageBug: 0,
    //     ),
    //   );
    // }

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
                onPressed: () {},
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
            max: widget.analysis.numberSeeds.repetitions,
          ),
          Expanded(
            child: PageView(
              controller: pg,
              children: [
                Container(),
                Container(),
                Container(),
                Container(),
                Container(),
              ],
              // children: coletas
              //     .map((c) => FormCollect(c, onChange: onChangeColeta))
              //     .toList(),
            ),
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
    if (page >= widget.analysis.numberSeeds.repetitions - 1) {
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
}
