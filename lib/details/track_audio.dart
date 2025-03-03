import 'package:flutter/material.dart';

class TrackAudio extends StatelessWidget {
  const TrackAudio({
    super.key,
    required this.audioBoxSize,
    required this.boxLimitSize,
  });

  final Size audioBoxSize;
  final Size boxLimitSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: audioBoxSize.height,
        maxHeight: audioBoxSize.height,
        minWidth: 8.0,
        maxWidth: boxLimitSize.width,
      ),  //表示範囲を画面幅の指定割合までに設定
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      child: const Text('波形', style: TextStyle(fontSize: 16.0),),
    );
  }
}