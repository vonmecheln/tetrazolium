import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis_form/presenter/controllers/add_analysis_controller.dart';

class AddAnalysisPage extends StatefulWidget {
  const AddAnalysisPage({Key? key}) : super(key: key);

  @override
  _AddAnalysisPageState createState() => _AddAnalysisPageState();
}

class _AddAnalysisPageState
    extends ModularState<AddAnalysisPage, AddAnalysisController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              onChanged: controller.setDescription,
              decoration: InputDecoration(
                labelText: "Descricao",
                labelStyle: TextStyle(color: Theme.of(context).accentColor),
                floatingLabelBehavior: FloatingLabelBehavior.always,
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                ),
                onPressed: () async {
                  var result = await controller.addNewAnalysis();

                  if (result) {
                    Navigator.of(context).pop();
                  }
                },
                child: Text(
                  "Salvar",
                  style: TextStyle(color: Theme.of(context).primaryColorLight),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
