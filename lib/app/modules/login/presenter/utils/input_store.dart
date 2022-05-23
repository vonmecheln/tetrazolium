import 'package:mobx/mobx.dart';
// import 'login_validator.dart';

part 'input_store.g.dart';

class InputStore = _InputStoreBase with _$InputStore;

abstract class _InputStoreBase with Store {
  _InputStoreBase({obscure = false}) {
    buttonVisible = obscure;
  }

  @observable
  bool buttonVisible = false;

  @action
  void buttonVisiblePressed() {
    buttonVisible = !buttonVisible;
  }

  @observable
  String inputText = "";

  @action
  changeInputText(String s) {
    inputText = s;
  }

  @observable
  String? error;
}

class LoginInputStoreEmail extends InputStore {
  LoginInputStoreEmail() : super(obscure: false);

  @override
  changeInputText(String s) {
    inputText = s;
  }

  // Stream<String> get inputText =>_inputText.stream.transform(performEmailValidation);
}

class LoginInputStorePass extends InputStore {
  LoginInputStorePass() : super(obscure: true);
  @override
  changeInputText(String s) {
    inputText = s;
  }

  // Stream<String> get inputText =>    _inputText.stream.transform(performPasswordValidation);
}
