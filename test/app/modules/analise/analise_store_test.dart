import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/modules/analise/analise_store.dart';
 
void main() {
  late AnaliseStore store;

  setUpAll(() {
    store = AnaliseStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}