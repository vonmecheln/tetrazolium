import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';
import 'package:tetrazolium/app/shared/external/datasource/analysis_datasource_impl.dart';
import 'package:tetrazolium/firebase_options.dart';

void main() {
  late IAnalysisDatasource datasource;

  setUpAll((() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform(
        androidKey: 'AIzaSyBoALDHfwECnKwE-zBM5H6Dc40YDBYVWxA',
        iosKey: 'enter ios key here',
        webKey: 'AIzaSyAUVi8-LFLfG5TFAIONlTLIuKdN7TmjO30',
      ),
    );

    datasource = AnalysisDatasourceImpl(FirebaseFirestore.instance);
  }));

  test('deve salvar uma nova Análise', () async {
    AnalysisEntity entity = AnalysisEntity(
      date: DateTime.now(),
      sample: 'Lote 01-56',
      local: 'Apasem toledo',
      numberSeeds: '2x50',
      concentration: 0.075,
      viability: 0,
      vigor: 0,
      repetitions: [],
    );

    final result = await datasource.addOrUpdate(entity);
  });

  test('deve editar uma Análise', () async {});

  test('deve inativar uma Análise', () async {});

  test('deve listar as Análises de um usuário', () async {});
}
