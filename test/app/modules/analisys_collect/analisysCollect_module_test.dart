import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/modules/analisys_collect/analisysCollect_module.dart';

void main() {
  setUpAll(() {
    initModule(AnalisysCollectModule());
  });
}
