import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/tetra_card.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/stores/list_store.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    final store = context.watch<ListStore>();
    store.reloadData();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<ListStore>();
    return Scaffold(
      key: scaffoldKey,
      appBar:
          //   GradientAppBar(
          //   title: Text("ANÁLISES"),
          //   gradient: LinearGradient(
          //       begin: Alignment.topRight,
          //       end: Alignment.bottomLeft,
          //       colors: [
          //         Color(COLOR_GRAD_BEG),
          //         Color(COLOR_GRAD_END),
          //       ])),

          AppBar(
        backgroundColor: FlutterFlowTheme.primaryColor,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                store.reloadData();
              })
        ],
        centerTitle: false,
        elevation: 4,
        title: const Text("Análises"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Modular.to.pushNamed('/form/new');
        },
        backgroundColor: FlutterFlowTheme.primaryColor,
        elevation: 8,
        child: const Icon(Icons.add),
      ),
      drawer: const Drawer(elevation: 16),
      body: ScopedBuilder<ListStore, FailureAnalysis,
          Stream<List<AnalysisEntity>>>(
        store: store,
        onError: (_, error) => _buildError(error!),
        onLoading: (context) => _buildLoading(context),
        onState: (_, state) {
          return StreamBuilder<List<AnalysisEntity>>(
            stream: state,
            initialData: const [],
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData) {
                return Container();
              }

              if (snapshot.data!.isEmpty) {
                return Container();
              }

              return _buildList(snapshot.data ?? []);
            },
          );
        },
      ),
    );
  }

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }

  Widget _buildError(FailureAnalysis error) {
    if (error is EmptyList) {
      return const Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorList) {
      return const Center(
        child: Text('Erro no github'),
      );
    } else {
      return const Center(
        child: Text('Erro interno'),
      );
    }
  }

  Widget _buildList(List<AnalysisEntity> list) {
    return ListView.separated(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return TetraCard(
            item: list[index],
            onSelect: (() {
              Modular.to.pushNamed('./details', arguments: list[index]);
            }));

        // var item = list[index];
        // return ListTile(
        //   title: Text(item.sample),
        //   onTap: () {
        //     Modular.to.pushNamed('/details', arguments: item);
        //   },
        // );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 0,
          color: Colors.grey[200],
        );
      },
    );
  }
}
