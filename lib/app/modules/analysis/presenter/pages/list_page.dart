import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/componentes/tetra_card.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/stores/list_store.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';

class ListaPage extends StatefulWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends ModularState<ListaPage, ListStore> {
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
        title: Text("Tetrazólio"),
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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: store.getList,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquise...",
              ),
            ),
          ),
          Expanded(
            child: ScopedBuilder<ListStore, FailureAnalysis, List<Analysis>>(
                store: store,
                onLoading: (_) => Center(child: CircularProgressIndicator()),
                onError: (_, error) {
                  return _buildError(error!);
                },
                onState: (_, state) {
                  if (state.isEmpty) {
                    return Center(
                      child: Text('Digita alguma coisa...'),
                    );
                  } else {
                    return _buildList(state);
                  }
                }),
          )
        ],
      ),
    );
  }

  Widget _buildError(FailureAnalysis error) {
    if (error is EmptyList) {
      return Center(
        child: Text('Nada encontrado'),
      );
    } else if (error is ErrorList) {
      return Center(
        child: Text('Erro no github'),
      );
    } else {
      return Center(
        child: Text('Erro interno'),
      );
    }
  }

  Widget _buildList(List<Analysis> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        return TetraCard();

        // var item = list[index];
        // return ListTile(
        //   title: Text(item.amostra),
        //   onTap: () {
        //     Modular.to.pushNamed('/details', arguments: item);
        //   },
        // );
      },
    );
  }
}
