import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/analysis/external/datasource/analysis_datasource_impl.dart';
import 'package:tetrazolium/app/modules/analysis/external/datasource/datasource.dart';
import 'package:tetrazolium/app/modules/splash/splash_store.dart';
import 'package:tetrazolium/firebase_options.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = 'SplashPage'}) : super(key: key);
  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final SplashStore store = Modular.get();

  var initializers = <Future>[
    Future.delayed(Duration(seconds: 3)),
  ];

  @override
  void initState() {
    super.initState();

    Future.wait(initializers).then((value) async {
      // final data = AnalysisDatasourceImpl();

      // final lista = await data.getAll();
      // print(lista.length);

      return Modular.to.pushReplacementNamed('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
