import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sonanceep_sns/constants/colors.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/constants/ints.dart';
import 'package:sonanceep_sns/constants/others.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/details/daw_mobile/track_band_right.dart';
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';
import 'package:sonanceep_sns/src/flutter_slider_widget/custom_flutter_slider_widget.dart';

class TrackScaleBand extends StatelessWidget {
  const TrackScaleBand({
    super.key,
    required this.dawMobileModel,
    required this.trackElementsScrollController,
    required this.rightTrackScrollController,
    required this.trackBackGroundColor,
    required this.trackCount,
    required this.trackSize,
    required this.offVocalWidth,
  });

  final DawMobileModel dawMobileModel;
  final List<ScrollController> trackElementsScrollController;
  final ScrollController rightTrackScrollController;
  final Color trackBackGroundColor;
  final int trackCount;
  final Size trackSize;
  final double offVocalWidth;

  @override
  Widget build(BuildContext context) {

    final int songSections = dawMobileModel.trackSections;
    final double trackScaleBandHeight = scaleDisplayHeight + (trackCount-1) * trackSize.height;
    double playbackPosition = dawMobileModel.playbackPosition;
  
    // DAW設定用
    final List<int> selectedTimeDivide = dawMobileModel.selectedTimeDivide;
    final double timeSignatureFunction = songSections * selectedTimeDivide[1] * (selectedTimeDivide[0] / selectedTimeDivide[1]);
    double trackWidth = trackSize.width;// < offVocalWidth ? offVocalWidth : trackSize.width;

    return Container(  //メモリ表示用の高さ
      height: trackScaleBandHeight,
      child: SingleChildScrollView(  // 右側の横スクロールビュー
        padding: EdgeInsets.zero,
        controller: trackElementsScrollController[0],
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.down,
        child: InteractiveViewer(
          child: Container(
            width: trackWidth,
            color: trackBackGroundColor,
            child: CustomFlutterSlider(
              selectByTap: false,
              rangeSlider: true,
              playbackPositionBar: true,
              touchSize: 4.0,
              values: [10, 20, playbackPosition],
              // max: trackSize.width < offVocalWidth ? offVocalWidth : trackSize.width,
              max: trackWidth,
              min: 0,
              handlerHeight: trackScaleBandHeight,
              handlerWidth: 4.0,
              handler: FlutterSliderHandler(child: Container()),
              rightHandler: FlutterSliderHandler(child: Container()),
              playbackPositionHandler: playbackPositionHandlerWidget(),
              visibleTouchArea: true,
              hatchMark: FlutterSliderHatchMark(
                disabled: false,
                density: 1,
                labels: List.generate(timeSignatureFunction.toInt(), (index) {  // 小節数＊拍子(分母) * 拍子(分数)
                  return FlutterSliderHatchMarkLabel( // 最小値に対応するラベル
                    percent: 100 / timeSignatureFunction * index.toDouble(),  // 100 / 小節数＊拍子(分母) * 拍子(分数)
                    label: Container(
                      height: index % selectedTimeDivide[0] == 0 
                      ? trackScaleBandHeight : trackScaleBandHeight/1.4,
                      width: index % selectedTimeDivide[0] == 0 ? 1.0 : 0.4,
                      // color: const Color.fromARGB(96, 75, 75, 75),
                      color: Colors.pink,
                      child: index % selectedTimeDivide[0] == 0 ? Text('${index/selectedTimeDivide[0]+1}') : const Text(''),
                    ),
                  );
                }),
                labelBox: FlutterSliderSizedBox( // 目盛りのラベルのボックスのサイズと色を設定する
                  height: trackScaleBandHeight,
                  width: 2.0,
                  decoration: const BoxDecoration(color: Colors.black12),
                ),
                displayLines: true,
              ),
              // soundFileWidget: (slidingByActiveTrackBar) {
              //   return Container(
              //     decoration: BoxDecoration(
              //       color: slidingByActiveTrackBar ? Colors.blueGrey[800]: Colors.blueGrey[700],
              //       borderRadius: BorderRadius.circular(8.0),
              //     ),
              //   );
              // },
              tooltip: FlutterSliderTooltip(
                disabled: true,
              ),
              trackBar: FlutterSliderTrackBar(
                inactiveTrackBarHeight: trackScaleBandHeight,  //レンジスライダーの背景高さ
                activeTrackBarHeight: trackScaleBandHeight,  //レンジスライダーの範囲内高さ
                activeTrackBar: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.grey.withOpacity(0.5),
                ),
                // centralWidget: Padding(
                //   padding: const EdgeInsets.only(top: scaleDisplayHeight),
                //   child: Column(
                //     children: [
                //       const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
                //       TrackBandRight(
                //         dawMobileModel: dawMobileModel,
                //         rightTrackScrollController: rightTrackScrollController,
                //         trackCount: trackCount,
                //         trackSize: trackSize,
                //         trackElementsScrollController: trackElementsScrollController,
                //         trackBackGroundColor: trackBackGroundColor
                //       ),
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}