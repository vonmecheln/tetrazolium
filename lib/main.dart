import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/app_module.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/analysis_datasource_impl.dart';
import 'package:tetrazolium/firebase_options.dart';

import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform(
      androidKey: 'AIzaSyBoALDHfwECnKwE-zBM5H6Dc40YDBYVWxA',
      iosKey: 'enter ios key here',
      webKey: 'AIzaSyAUVi8-LFLfG5TFAIONlTLIuKdN7TmjO30',
    ),
  );

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
  // runApp(Testador());
}

class Testador extends StatefulWidget {
  const Testador({Key? key}) : super(key: key);

  @override
  State<Testador> createState() => _TestadorState();
}

class _TestadorState extends State<Testador> {
  Future<bool> test1() async {
    final datasource = AnalysisDatasourceImpl(FirebaseFirestore.instance);

    String id = "c36342b3-b981-471b-8554-142c3d82dd28";
    AnalysisEntity entity = AnalysisEntity(
      id: id,
      date: DateTime.now(),
      sample: 'Lote 01-56',
      local: 'Apasem toledo',
      numberSeeds: '2x50',
      concentration: 0.075,
      viability: 80,
      vigor: 70,
    );

    print(entity);
    var result = await datasource.addOrUpdate(entity);
    entity = await datasource.getByid(id);
    print(entity);

    return false;
  }

  @override
  initState() {
    super.initState();
    test1();
  }

  var texto = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black38,
      ),
    );
  }
}
