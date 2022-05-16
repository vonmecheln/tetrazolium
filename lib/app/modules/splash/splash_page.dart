import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/constants.dart';
import 'package:tetrazolium/app/modules/splash/splash_store.dart';
import 'package:tetrazolium/app/shared/widgets/logo_widget.dart';

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

      // return Modular.to.pushReplacementNamed('/login/');
      return Modular.to.pushReplacementNamed('/home/');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
              Color(COLOR_GRAD_BEG),
              Color(COLOR_GRAD_END),
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LogoWidget(),
            SizedBox(
              height: 35,
            ),
            Text(
              "Tetrazólio",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
