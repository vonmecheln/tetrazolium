import 'package:flutter/material.dart';

class SignUpButton extends StatelessWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // padding: EdgeInsets.only(top: 160),
      onPressed: () {},
      child: const Text(
        "Não possui uma conta? Cadastre-se",
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          letterSpacing: 0.5,
          color: Colors.white,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}
