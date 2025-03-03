import 'package:flutter/material.dart';

class FinishedPage extends StatelessWidget {
  // Logout後のメッセージと削除後のメッセージを受け取りたい
  const FinishedPage({
    super.key,
    required this.msg,
  });

  final String msg;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Text(msg, style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),),
      ),
    );
  }
}