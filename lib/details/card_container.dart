import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    required this.onTap,
    required this.borderColor,
  });

  final Color borderColor;
  final void Function()? onTap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(16.0),  //外余白
        padding: const EdgeInsets.all(8.0),  //内余白
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
          ),
          borderRadius: BorderRadius.circular(32.0),
        ),
        child: child,
      ),
    );
  }
}