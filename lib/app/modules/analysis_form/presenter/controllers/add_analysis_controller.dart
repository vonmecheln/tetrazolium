import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis_form/domain/usecase/add_new_analysis.dart';

part 'add_analysis_controller.g.dart';

@Injectable(singleton: false)
class AddAnalysisController {
  final IAddNewAnalysis _addNewAnalysis;

  AddAnalysisController(this._addNewAnalysis);

  RxNotifier<String> description = RxNotifier<String>('');

  late RxNotifier<DateTime> initTime;

  late RxNotifier<DateTime> endTime;

  setInitDate(DateTime date) => initTime = RxNotifier<DateTime>(date);

  setEndDate(DateTime date) => endTime = RxNotifier<DateTime>(date);

  setDescription(String _description) => description.value = _description;

  Future<bool> addNewAnalysis() async {
    try {
      var result = await _addNewAnalysis(
        Analysis(
          sample: description.value,
          concentration: 0,
          date: DateTime.now(),
          local: description.value,
          viability: 1,
          vigor: 0,
        ),
      );

      return result.fold(
        (left) {
          // asuka.showSnackBar(SnackBar(content: Text(left.message)));
          return false;
        },
        (right) => true,
      );
    } catch (e) {
      print(e);
      // asuka.showSnackBar(SnackBar(content: Text(e.toString())));
      return false;
    }
  }
}
