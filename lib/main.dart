import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/reanalysis_entity.dart';
// import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app/shared/external/mappers/reanalysis_data_mapper.dart';
import 'package:tetrazolium/app_all.dart';
import 'package:tetrazolium/comum.dart';
import 'package:tetrazolium/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyBoALDHfwECnKwE-zBM5H6Dc40YDBYVWxA',
      iosKey: 'enter ios key here',
      webKey: 'AIzaSyAUVi8-LFLfG5TFAIONlTLIuKdN7TmjO30',
    ),
  );

  var reanalise = true;
  if (reanalise) {
    _createReavaliations();
  } else {
    var snapUser = FirebaseFirestore.instance.collection(USERS).snapshots();
    var u = await snapUser.first;
    usersComum = u.docs.map((e) => e.id).toList();

    var snap = FirebaseFirestore.instance.collection(ANALYSIS).snapshots();
    var f = await snap.first;

    var analise = AnalysisEntity.empty();

    if (f.docs.isNotEmpty) {
      var d = f.docs.last;
      analise = AnalysisMapper.fromMap(d.data());
    }

    // runApp(ModularApp(module: AppModule(), child: AppWidget()));
    runApp(AppWidgetMain(analise: analise));
  }
}

_createReavaliations() async {
  var snap = FirebaseFirestore.instance.collection(ANALYSIS).snapshots();
  var f = await snap.first;

  var list = f.docs.map((e) => AnalysisMapper.fromMap(e.data())).toList();

  list.forEach((a) {
    a.repetitions.forEach((r) {
      r.interpretations.forEach((i) {
        var reanalysis = ReanalysisEntity(
          analiseId: a.id,
          interpretationId: i.id,
          repetitionId: r.id,
          u: a.u,
          reinterpretations: [],
        );

        print(
            " ${reanalysis.id} ${reanalysis.analiseId} ${reanalysis.repetitionId} ${reanalysis.interpretationId} ${reanalysis.u}");

        if (i.photos.isNotEmpty)
          FirebaseFirestore.instance
              .collection(REANALYSIS)
              .doc(reanalysis.id)
              .set(ReanalysisMapper.toMap(reanalysis));
      });
    });
    print(a.repetitions.first.interpretations.first.id);
  });
}
