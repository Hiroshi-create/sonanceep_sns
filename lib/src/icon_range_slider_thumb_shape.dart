// import 'package:flutter/material.dart';

// class IconRangeSliderThumbShape extends RangeSliderThumbShape {
//   final IconData startIcon;
//   final IconData endIcon;

//   const IconRangeSliderThumbShape({
//     required this.startIcon,
//     required this.endIcon,
//   });

//   // サイズを指定
//   @override
//   Size getPreferredSize(bool isEnabled, bool isDiscrete) {
//     return const Size(48.0, 48.0);
//   }

//   // ペイント処理
//   @override
//   void paint(
//     PaintingContext context,
//     Offset center, {
//     required Animation<double> activationAnimation,
//     required Animation<double> enableAnimation,
//     bool isDiscrete = false, // デフォルト値を設定
//     bool isEnabled = false, // デフォルト値を設定
//     bool isOnTop = false, // デフォルト値を設定
//     bool isPressed = false, // デフォルト値を設定
//     required SliderThemeData sliderTheme,
//     TextDirection textDirection = TextDirection.ltr, // デフォルト値を設定
//     Thumb thumb = Thumb.start, // デフォルト値を設定
//   }) {
//     final Canvas canvas = context.canvas;

//     // ペイントの設定
//     final paint = Paint()
//       ..color = sliderTheme.thumbColor!
//       ..style = PaintingStyle.fill;

//     // 選択されたアイコンを取得
//     final icon = thumb == Thumb.start ? startIcon : endIcon;
//     final iconPainter = TextPainter(
//       text: TextSpan(
//         text: String.fromCharCode(icon.codePoint),
//         style: TextStyle(
//           fontSize: 24.0,
//           fontFamily: icon.fontFamily,
//           color: sliderTheme.valueIndicatorColor,
//         ),
//       ),
//       textDirection: TextDirection.ltr,
//     )..layout();

//     // Thumbの形を設定
//     final rRect = RRect.fromRectAndRadius(
//       Rect.fromCenter(center: center, width: 16.0, height: 32.0),
//       const Radius.circular(8.0),
//     );

//     // Thumbを描画
//     canvas.drawRRect(rRect, paint);
//     // アイコンを描画
//     iconPainter.paint(
//       canvas,
//       center - Offset(iconPainter.width / 2, iconPainter.height / 2),
//     );
//   }
// }