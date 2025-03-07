// flutter
import 'package:flutter/material.dart';
// components
import 'package:sonanceep_sns/details/rounded_button.dart';
import 'package:sonanceep_sns/details/rounded_text_field.dart';

class TextFieldAndButtonScreen extends StatelessWidget {
  const TextFieldAndButtonScreen({
    super.key,
    required this.appberTitle,
    required this.buttonText,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.shadowColor,
    required this.buttonColor,
    required this.borderColor,
    required this.onPressed,
    required this.onChanged,
  });

  final String appberTitle, buttonText, hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Color shadowColor, buttonColor, borderColor;
  final void Function()? onPressed;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appberTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: RoundedTextField(
              keyboardType: keyboardType,
              onChanged: onChanged,
              controller: controller,
              borderColor: borderColor,
              shadowColor: shadowColor,
              hintText: hintText
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 64.0),
            child: RoundedButton(
              //まず再認証をする
              //場合によってはupdatePasswordPageに飛ばしたり、updateEmailPageに飛ばしたりする
              onPressed: onPressed,
              widthRate: 0.8,
              color: buttonColor,
              text: buttonText,
            ),
          ),
        ],
      ),
    );
  }
}