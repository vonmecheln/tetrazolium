import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app_all.dart';
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

  var snap = await FirebaseFirestore.instance.collection(ANALYSIS).snapshots();
  var f = await snap.first;
  var d = await f.docs.first;
  var analise = AnalysisMapper.fromMap(d.data());

  // runApp(ModularApp(module: AppModule(), child: AppWidget()));
  runApp(AppWidgetMain(analise: analise));
}
