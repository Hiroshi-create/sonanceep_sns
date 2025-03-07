// flutter
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:sonanceep_sns/constants/routes.dart' as routes;

class ForgetPasswordText extends StatelessWidget {
  const ForgetPasswordText({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Center(
        // textでボタンを作成したい場合は RichText
        child: RichText(
          text: TextSpan(
            style: const TextStyle(fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: 'パスワードを忘れた場合',
                style: const TextStyle(color: Colors.lightGreen),
                recognizer: TapGestureRecognizer()..onTap = () => routes.toVerifyPasswordResetPage(context: context),
              ),
            ]
          ),
        ),
      ),
    );
  }
}