// flutter
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sonanceep_sns/constants/others.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
// components
import 'package:sonanceep_sns/views/auth/components/text_field_and_button_screen.dart';

class UpdateEmailPage extends StatelessWidget {
  const UpdateEmailPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String newEmail = '';
    final TextEditingController controller = TextEditingController();
    // 簡単な処理で済むのでModelはいらない
    return TextFieldAndButtonScreen(
      appberTitle: updateEmailPageTitle,
      buttonText: updateEmailText,
      hintText: mailAddressText,
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      shadowColor: Colors.yellowAccent.withOpacity(0.25),
      buttonColor: Colors.purpleAccent,
      borderColor: Colors.black,
      onChanged: (value) => newEmail = value,
      onPressed: () async {
        final User user = returnAuthUser()!;
        // メールアドレスを認証するためにメールが送られる
        await user.verifyBeforeUpdateEmail(newEmail);
        await voids.showFlutterToast(msg: emailSendedMsg);
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }
}