import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/constants.dart';

class NovoPage extends StatefulWidget {
  const NovoPage({Key? key}) : super(key: key);

  @override
  _NovoPageState createState() => _NovoPageState();
}

class _NovoPageState extends State<NovoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ANÁLISES"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            TextField(),
            Expanded(
                child: Container(
              color: Colors.red,
            )),
            Container(
              height: 100,
              // color: Colors.blue,
              child: ElevatedButton(
                child: Text('Salvar'),
                onPressed: () {
                  Modular.to.pushNamed('/analise');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
