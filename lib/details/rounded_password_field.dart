// flutter
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/details/text_field_container.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({
    super.key,
    required this.onChanged,
    required this.passwordEditingController,
    required this.obscureText,
    required this.toggleIsObscureText,
    required this.borderColor,
    required this.shadowColor,
  });

  final void Function(String)? onChanged;
  final TextEditingController passwordEditingController;
  final bool obscureText;
  final void Function()? toggleIsObscureText;
  final Color borderColor,shadowColor;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      borderColor: borderColor,
      shadowColor: shadowColor,
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,  //キーボードのタイプ指定
        onChanged: onChanged,
        controller: passwordEditingController,
        //入力内容を隠す
        obscureText: obscureText,
        decoration: InputDecoration(
          suffix: InkWell(
            onTap: toggleIsObscureText,  //アイコンがタップされた時に切り替え
            child: obscureText ? const Icon(Icons.visibility_off) : const Icon(Icons.visibility),
          ),
          hintText: passwordText,
          hintStyle: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}