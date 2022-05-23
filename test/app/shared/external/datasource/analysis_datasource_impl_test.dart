import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/number_seeds_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/datasource/analysis_datasource_impl.dart';

void main() {
  late IAnalysisDatasource datasource;
  late FirebaseFirestore firestore;
  late int length;
  final date = DateTime.now();
  final firstId = '123456789';

  setUpAll((() async {
    firestore = FakeFirebaseFirestore();
    await firestore.collection(ANALYSIS).doc(firstId).set({
      'id': firstId,
      'date': DateTime.now().toIso8601String(),
      'sample': 'sample',
      'local': 'local',
      'concentration': 0.75,
      'numberSeeds': '2x50',
      'viability': 80,
      'vigor': 80,
      'repetitions': [],
    });

    length = 1;

    // WidgetsFlutterBinding.ensureInitialized();

    // await Firebase.initializeApp(
    //   options: DefaultFirebaseOptions.currentPlatform(
    //     androidKey: 'AIzaSyBoALDHfwECnKwE-zBM5H6Dc40YDBYVWxA',
    //     iosKey: 'enter ios key here',
    //     webKey: 'AIzaSyAUVi8-LFLfG5TFAIONlTLIuKdN7TmjO30',
    //   ),
    // );

    // firestore = FirebaseFirestore.instance;

    datasource = AnalysisDatasourceImpl(firestore);
  }));

  test('deve buscar uma Análise por id', () async {
    var analisys = await datasource.getByid(firstId);

    expect(analisys.id, firstId);
    expect(analisys.sample, 'sample');
    expect(analisys.local, 'local');
  });

  test('deve salvar uma nova Análise', () async {
    AnalysisEntity entity = AnalysisEntity(
      date: date,
      sample: 'Lote 01-56',
      local: 'Apasem toledo',
      numberSeeds: NumberSeedsEntity.r2s50(),
      concentration: 0.075,
      viability: 0,
      vigor: 0,
      repetitions: [],
    );

    await datasource.addOrUpdate(entity);

    final ref = firestore.collection(ANALYSIS);
    final queries = await ref.get();
    expect(queries.docs.length, ++length);
    expect(queries.docs.last['sample'], 'Lote 01-56');
    expect(queries.docs.last.data().containsKey('id'), true);
  });

  test('deve editar uma Análise', () async {
    final ref = firestore.collection(ANALYSIS);
    var queries = await ref.get();

    expect(queries.docs.length, length);
    expect(queries.docs.first['sample'], 'sample');

    AnalysisEntity entity = AnalysisEntity(
      id: '123456789',
      date: date,
      sample: 'Lote 01-56',
      local: 'Apasem toledo',
      numberSeeds: NumberSeedsEntity.r2s50(),
      concentration: 0.075,
      viability: 0,
      vigor: 0,
      repetitions: [],
    );

    await datasource.addOrUpdate(entity);

    queries = await ref.get();
    expect(queries.docs.length, length);
    expect(queries.docs.first['sample'], 'Lote 01-56');
  });

  test('deve listar todas Análises com Stream', () async {
    var result = await datasource.getStream();

    expect(result, emits(isA<List<AnalysisEntity>>()));
  });

  test('deve listar todas Análises', () async {
    var list = await datasource.getAll();

    expect(list.length, length);
    expect(list.first.id, firstId);
  });

  test('deve remover uma Análise', () async {
    final ref = firestore.collection(ANALYSIS);
    var queries = await ref.get();

    expect(queries.docs.length, length);

    final result = await datasource.removeById(queries.docs.last['id']);

    expect(result, true);
    queries = await ref.get();
    expect(queries.docs.length, --length);
  });

  // test('deve inativar uma Análise', () async {});

  // test('deve listar as Análises de um usuário', () async {});
}
