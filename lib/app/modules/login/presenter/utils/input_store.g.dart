// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InputStore on _InputStoreBase, Store {
  final _$buttonVisibleAtom = Atom(name: '_InputStoreBase.buttonVisible');

  @override
  bool get buttonVisible {
    _$buttonVisibleAtom.reportRead();
    return super.buttonVisible;
  }

  @override
  set buttonVisible(bool value) {
    _$buttonVisibleAtom.reportWrite(value, super.buttonVisible, () {
      super.buttonVisible = value;
    });
  }

  final _$inputTextAtom = Atom(name: '_InputStoreBase.inputText');

  @override
  String get inputText {
    _$inputTextAtom.reportRead();
    return super.inputText;
  }

  @override
  set inputText(String value) {
    _$inputTextAtom.reportWrite(value, super.inputText, () {
      super.inputText = value;
    });
  }

  final _$errorAtom = Atom(name: '_InputStoreBase.error');

  @override
  String? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$_InputStoreBaseActionController =
      ActionController(name: '_InputStoreBase');

  @override
  void buttonVisiblePressed() {
    final _$actionInfo = _$_InputStoreBaseActionController.startAction(
        name: '_InputStoreBase.buttonVisiblePressed');
    try {
      return super.buttonVisiblePressed();
    } finally {
      _$_InputStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeInputText(String s) {
    final _$actionInfo = _$_InputStoreBaseActionController.startAction(
        name: '_InputStoreBase.changeInputText');
    try {
      return super.changeInputText(s);
    } finally {
      _$_InputStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonVisible: ${buttonVisible},
inputText: ${inputText},
error: ${error}
    ''';
  }
}
