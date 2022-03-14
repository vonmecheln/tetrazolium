import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tetrazolium/app/modules/login/presenter/utils/input_store.dart';

class InputField extends StatelessWidget {
  final String hint;
  final String label;
  final IconData? icon;
  final InputStore store;
  final TextInputType keyboardType;

  const InputField({
    Key? key,
    required this.hint,
    this.icon,
    required this.store,
    required this.label,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Container(
            //decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 0.5))),
            child: TextFormField(
                onChanged: store.changeInputText,
                keyboardType: keyboardType,
                obscureText: store.buttonVisible,
                decoration: InputDecoration(
                    prefixIcon: icon != null
                        ? Icon(
                            icon,
                            //color: Colors.black,
                          )
                        : null,
                    labelText: label,
                    errorText: store.error,
                    hintText: hint,
                    suffixIcon: store.buttonVisible
                        ? IconButton(
                            onPressed: () {
                              store.buttonVisiblePressed();
                            },
                            icon: Icon(
                              store.buttonVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ))
                        : null)));
      },
    );
  }
}
