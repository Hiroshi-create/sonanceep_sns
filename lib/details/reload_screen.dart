// flutter
import 'package:flutter/material.dart';
// components
import 'package:sonanceep_sns/details/rounded_button.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';

class ReloadScreen extends StatelessWidget {
  const ReloadScreen({
    super.key,
    required this.onReload,
  });

  final void Function()? onReload;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: RoundedButton(
            onPressed: onReload,
            widthRate: 0.85,
            color: Colors.green,
            text: reloadText,
          ),
        )
      ],
    );
  }
}