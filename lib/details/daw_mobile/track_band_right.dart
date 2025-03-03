import 'dart:typed_data';

import 'package:audio_wave/audio_wave.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sonanceep_sns/constants/colors.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/constants/ints.dart';
import 'package:sonanceep_sns/constants/others.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';
import 'package:sonanceep_sns/src/flutter_slider_widget/custom_flutter_slider_widget.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;

class TrackBandRight extends StatelessWidget {
  const TrackBandRight({
    super.key,
    required this.dawMobileModel,
    required this.rightTrackScrollController,
    required this.screenWidth,
    required this.trackCount,
    required this.trackSize,
    required this.offVocalWidth,
    required this.zoomWidthRatio,
    required this.bpm,
    required this.selectedTimeDivide,
    required this.trackElementsScrollController,
    required this.trackBackGroundColor,
  });

  final DawMobileModel dawMobileModel;
  final ScrollController rightTrackScrollController;
  final double screenWidth;
  final int trackCount;
  final Size trackSize;
  final double offVocalWidth;
  final double zoomWidthRatio;
  final double bpm;
  final List<int> selectedTimeDivide;
  final List<ScrollController> trackElementsScrollController;
  final Color trackBackGroundColor;

  @override
  Widget build(BuildContext context) {

    // DAW構成関係
    final int songSections = dawMobileModel.trackSections;
    double playbackPosition = dawMobileModel.playbackPosition;
    // DAW設定用
    final double timeSignatureFunction = songSections * selectedTimeDivide[1] * (selectedTimeDivide[0]/selectedTimeDivide[1]);

    final double trackHeight = trackSize.height;
    double trackWidth = trackSize.width;// < offVocalWidth ? offVocalWidth : trackSize.width;

    // audio関連
    final String? offVocalPath = dawMobileModel.offVocalLocalPath;
    final List<double>? waveformData = dawMobileModel.waveformData;  // 波形用データ
    final PlayerController offVocalController = dawMobileModel.offVocalController;



    double horizontalScale = 1.0;


    return Expanded(
      child: CustomScrollView(  // 右側の縦ScrollView
        controller: rightTrackScrollController,
        slivers: List.generate(trackCount, (index) => SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: trackHeight,
                  child: index != trackCount-1  // 最後のtrackはtrack追加用
                  ? SingleChildScrollView(  // 右側の横スクロールビュー
                    padding: EdgeInsets.zero,
                    controller: trackElementsScrollController[index+1],
                    scrollDirection: Axis.horizontal,
                    dragStartBehavior: DragStartBehavior.down,
                    child: InteractiveViewer(
                      child: Container(
                        width: trackWidth,
                        color: Colors.transparent,
                        child: GestureDetector(
                          onScaleUpdate: (details) {  // 拡大縮小
                            double value = 0.2;
                            if((details.horizontalScale - horizontalScale).abs() >= 0.4) {  // 0.4ごとに処理
                              dawMobileModel.zoomWidthMagnification(
                                amountOfChange: details.horizontalScale - horizontalScale >= 0 ? value : (-value),
                                screenWidth: screenWidth,
                                trackWidth: trackWidth,
                              );
                              horizontalScale = details.horizontalScale;
                            }
                          },
                          child: CustomFlutterSlider(
                            selectByTap: false,
                            rangeSlider: true,
                            playbackPositionBar: false,
                            touchSize: 8.0,
                            values: [0, 0+offVocalWidth + 10, playbackPosition],
                            minimumDistance: offVocalWidth + 10,
                            // max: trackSize.width < offVocalWidth ? offVocalWidth : trackSize.width,
                            max: trackWidth,
                            min: 0,
                            handlerHeight: trackHeight,
                            handlerWidth: 4.0,
                            handler: FlutterSliderHandler(child: Container()),
                            rightHandler: FlutterSliderHandler(child: Container()),
                            playbackPositionHandler: FlutterSliderHandler(child: Container(
                              width: 2.0,
                              color: Colors.white,
                            )),
                            visibleTouchArea: true,
                            hatchMark: 
                            FlutterSliderHatchMark(  // メモリ設定
                              disabled: false,
                              density: 1,
                              labels: List.generate(timeSignatureFunction.toInt(), (index) {  // 小節数＊拍子(分母) * 拍子(分数)
                                return FlutterSliderHatchMarkLabel(
                                  percent: 100 / timeSignatureFunction * index.toDouble(), // 100 / 小節数＊拍子(分母) * 拍子(分数)
                                  label: Container(
                                    height: trackHeight,
                                    width: index % selectedTimeDivide[0] == 0 ? 10.0 : 0.4,
                                    color: Colors.transparent,
                                  )
                                );
                              }),
                              labelBox: FlutterSliderSizedBox( // 目盛りのラベルのボックスのサイズと色を設定する
                                height: trackHeight/2,
                                width: 2.0,
                                decoration: const BoxDecoration(color: Colors.black12),
                              ),
                              displayLines: true,
                            ),
                            tooltip: FlutterSliderTooltip(
                              disabled: true,
                            ),
                            trackBar: FlutterSliderTrackBar(
                              inactiveTrackBarHeight: trackHeight,  //レンジスライダーの背景高さ
                              activeTrackBarHeight: trackHeight,  //レンジスライダーの範囲内高さ
                              activeTrackBar: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            soundFileWidget: (slidingByActiveTrackBar) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: slidingByActiveTrackBar ? Colors.blueGrey[800]: Colors.blueGrey[700],
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: offVocalPath == null || waveformData == null ? null : AudioWave(
                                  height: trackHeight,
                                  width: offVocalWidth,
                                  // beatRate: duration,
                                  spacing: 0,
                                  animation: false,
                                  bars: List.generate(waveformData.length.toInt(), (index) {
                                    return AudioWaveBar(
                                      heightFactor: waveformData[index],
                                      color: Colors.amber,
                                    );
                                  }),
                                ),
                              );
                            },
                            onDragging: (handlerIndex, lowerValue, upperValue) {
                              voids.showFlutterToast(msg: "$handlerIndex  $lowerValue  $upperValue");
                            },
                          ),
                        ),
                      ),
                    ),
                  )
                  : null
                ),
                const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
              ],
            ),
          ),
        ),
      ),
    );
  }
}