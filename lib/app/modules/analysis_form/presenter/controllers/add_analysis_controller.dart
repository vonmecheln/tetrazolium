import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/modules/analysis_form/domain/usecase/add_new_analysis.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'add_analysis_controller.g.dart';

@Injectable(singleton: false)
class AddAnalysisController {
  final IAddNewAnalysis _addNewAnalysis;

  AddAnalysisController(this._addNewAnalysis);

  RxNotifier<String> sample = RxNotifier<String>('');
  RxNotifier<String> local = RxNotifier<String>('');
  RxNotifier<String> numberSeeds = RxNotifier<String>('');
  RxNotifier<double> concentration = RxNotifier<double>(0);
  late RxNotifier<DateTime> date;
  setInitDate(DateTime _date) => date = RxNotifier<DateTime>(_date);

  setSample(String _value) => sample.value = _value;
  setLocal(String _value) => local.value = _value;
  setNumberSeeds(String _value) => numberSeeds.value = _value;
  setConcentration(String _value) =>
      concentration.value = double.parse(_value, (_) => 0);

  Future<bool> addNewAnalysis() async {
    try {
      var result = await _addNewAnalysis(
        AnalysisEntity(
          sample: sample.value,
          concentration: concentration.value,
          date: date.value,
          local: local.value,
          numberSeeds: numberSeeds.value,
          viability: 0,
          vigor: 0,
          repetition: [],
        ),
      );

      return result.fold(
        (left) {
          asuka.showSnackBar(SnackBar(content: Text(left.message)));
          return false;
        },
        (right) => true,
      );
    } catch (e) {
      print(e);
      asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}
