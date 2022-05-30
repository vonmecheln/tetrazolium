import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis_form/presenter/controllers/add_analysis_controller.dart';
import 'package:tetrazolium/app/modules/flutter_flow/flutter_flow_theme.dart';
import 'package:tetrazolium/app/shared/widgets/custom_line_datepicker/custom_line_date_picker_widget.dart';

class AddAnalysisPage extends StatefulWidget {
  const AddAnalysisPage({Key? key}) : super(key: key);

  @override
  _AddAnalysisPageState createState() => _AddAnalysisPageState();
}

class _AddAnalysisPageState extends State<AddAnalysisPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddAnalysisController>();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.primaryColor,
          elevation: 4,
          title: const Text("Nova Análise"),
        ),
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  onChanged: controller.setSample,
                  decoration: InputDecoration(
                    labelText: "Amostra",
                    labelStyle: TextStyle(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: controller.setLocal,
                  decoration: InputDecoration(
                    labelText: "Local",
                    labelStyle: TextStyle(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: controller.setNumberSeeds,
                  decoration: InputDecoration(
                    labelText: "Número de sementes testadas",
                    labelStyle: TextStyle(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: controller.setConcentration,
                  decoration: InputDecoration(
                    labelText: "Concentração da solução",
                    labelStyle: TextStyle(
                      color: FlutterFlowTheme.primaryColor,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                ),
                const SizedBox(height: 20),
                CustomLineDataPickerWidget(
                  context,
                  label: "Data da análise",
                  onChangeDate: controller.setInitDate,
                ),
                const SizedBox(height: 50),
                Container(
                  height: 40,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: FlutterFlowTheme.primaryColor,
                    ),
                    onPressed: () async {
                      var result = await controller.addNewAnalysis();

                      if (result) {
                        Navigator.of(context).pop();
                      }
                    },
                    child: const Text(
                      "Salvar",
                      // style: TextStyle(color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
