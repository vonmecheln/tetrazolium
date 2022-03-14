import 'dart:async';

class Validator {
  final performEmailValidation =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    String emailValidationRule =
        r'^(([^()[\]\\.,;:\s@\"]+(\.[^()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = new RegExp(emailValidationRule);

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Favor, entrar com um e-mail válido');
    }
  });

  final performPasswordValidation =
      StreamTransformer<String, String>.fromHandlers(
          handleData: (password, sink) {
    String passwordValidationRule =
        '((?=.*).{1,10})';
    RegExp regExp = new RegExp(passwordValidationRule);

    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'A senha tem que ter um número, uma letra minúscula, uma maiúscula, um caracter especial "@#%" e no min. 6 a max. 10 caracteres');
    }
  });
}
