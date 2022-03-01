import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/splash/splash_store.dart';

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
    return Material(
      color: Color(0xffFFFFFF),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FlutterLogo(
              size: 100,
              textColor: Colors.amber,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                Colors.amber,
              ),
            )
          ],
        ),
      ),
    );
  }
}
