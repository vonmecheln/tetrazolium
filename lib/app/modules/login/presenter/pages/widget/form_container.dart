import 'package:flutter/material.dart';
import 'package:tetrazolium/app/modules/login/presenter/pages/login/login_store.dart';
import 'package:tetrazolium/app/modules/login/presenter/utils/input_store.dart';

import 'input_field.dart';

class FormContainer extends StatelessWidget {
  final LoginStore controller;

  const FormContainer({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final bloc = Modular.to.getBloc<LoginBloc>();

    return Form(
      child: Container(
        alignment: Alignment.topLeft,
        width: 333,
        //color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Text(
              "Acesse sua conta",
              style: Theme.of(context).textTheme.headline1,
            ),
            const SizedBox(
              height: 15,
            ),
            emailField(controller.inputStoreEmail),
            const SizedBox(
              height: 5,
            ),
            passwordField(controller.inputStorePass),
            SizedBox(
                width: double.infinity,
                child: Text(
                  "Esqueceu sua senha?",
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.right,
                )),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}

Widget passwordField(InputStore store) {
  return InputField(
    hint: "Sua senha",
    label: "Senha",
    //icon: Icons.lock_outline,
    store: store,
  );
}

Widget emailField(InputStore store) {
  return InputField(
    hint: "luis.vonmecheln@ifpr.edu.br",
    label: "E-mail",
    //icon: Icons.mail_outline,
    store: store,
    keyboardType: TextInputType.emailAddress,
  );
}
