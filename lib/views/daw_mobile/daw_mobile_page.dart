// flutter
import 'package:audio_wave/audio_wave.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// packages
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sonanceep_sns/constants/colors.dart';
import 'package:sonanceep_sns/constants/doubles.dart';
import 'package:sonanceep_sns/constants/ints.dart';
import 'package:sonanceep_sns/constants/others.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/details/daw_mobile/daw_app_bar.dart';
import 'package:sonanceep_sns/details/daw_mobile/daw_settings_drawer.dart';
import 'package:sonanceep_sns/details/daw_mobile/track_band_right.dart';
import 'package:sonanceep_sns/details/daw_mobile/track_band_left.dart';
import 'package:sonanceep_sns/details/daw_mobile/track_scale_band.dart';
import 'package:sonanceep_sns/details/rounded_button.dart';
import 'package:sonanceep_sns/domain/track/track.dart';
import 'package:sonanceep_sns/models/daw_mobile/daw_mobile_model.dart';
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/src/sliding_up_panel/panel.dart';

import 'package:sonanceep_sns/constants/voids.dart' as voids;



final rangeValueProvider = StateProvider<RangeValues>((ref) => const RangeValues(0.0, 100.0));

class DawMobilePage extends HookConsumerWidget {
  const DawMobilePage({
    super.key,
    required this.mainModel,
    required this.songDoc,

  });

  final MainModel mainModel;
  final DocumentSnapshot<Map<String,dynamic>> songDoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final DawMobileModel dawMobileModel = ref.watch(dawMobileProvider);
    //trackの左右のControllerGroup
    double zoomHeightRatio = dawMobileModel.zoomHeightRatio;
    double zoomWidthRatio = dawMobileModel.zoomWidthRatio;
    //track同士のControllerGroup
    final List<ScrollController> trackElementsScrollControllers = dawMobileModel.trackElementsScrollControllers;

    final ScrollController leftTrackScrollController = dawMobileModel.leftTrackScrollController;
    final ScrollController rightTrackScrollController = dawMobileModel.rightTrackScrollController;
    final List<Track> tracks = dawMobileModel.tracks;
    final int trackCount = tracks.length;
    final double bpm = dawMobileModel.bpm;
    final offVocalController = dawMobileModel.offVocalController;

    // 画面はば取得
    final screenSize = dawMobileModel.screenSize!;
    final screenHight = screenSize.height;
    final screenWidth = screenSize.width;

    // trackの左パネルのサイズ
    final trackPanelMinWidth = screenWidth * 0.06;
    final trackPanelMaxWidth = screenWidth * 0.32;

    // trackのサイズ
    // Size trackSize = Size(dawMobileModel.oneSectionsWidth * dawMobileModel.songSections * zoomWidthRatio, screenHight * zoomHeightRatio);
    Size trackSize = Size(screenWidth * zoomWidthRatio, screenHight * zoomHeightRatio);
    double trackWidth = trackSize.width;

    // DAW設定用
    final List<int> selectedTimeDivide = dawMobileModel.selectedTimeDivide;



    // final double offVocalSeconds = dawMobileModel.offVocalSeconds;
    final double offVocalWidth = dawMobileModel.offVocalWidth ?? 0.0;
    // double offVocalWidth = returnSoundFileWidth(
    //   seconds: offVocalSeconds,
    //   bpm: bpm,
    //   beatNumerator: selectedTimeDivide[0],
    //   trackWidth: trackWidth,
    //   zoomWidthRatio: zoomWidthRatio,
    // );

    const double playIconSize = 48.0;






    if(trackElementsScrollControllers.isNotEmpty) {
      useEffect(() {
        // ページ遷移するときに横画面にする
        // SystemChrome.setPreferredOrientations([
        //   DeviceOrientation.landscapeLeft,
        //   DeviceOrientation.landscapeRight,
        // ]);
        return () {
          dawMobileModel.pseudoDispose();
          // ページを戻る時に縦画面に戻す
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            DeviceOrientation.landscapeLeft,
            DeviceOrientation.landscapeRight,
          ]);
        };
      }, const []);
    }

    useEffect(() {
      // ページ遷移するときに横画面にする
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ]);
      return () {
        // ページを戻る時に縦画面に戻す
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
        ]);
      };
    }, const []);

    return Scaffold(
      appBar: PreferredSize(
        // DawAppBarの高さを指定する
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // DawAppBarのインスタンスを作る
        child: DawAppBar(dawMobileModel: dawMobileModel, trackWidth: trackWidth),
      ),
      endDrawer: DawSettingsDrawer(dawMobileModel: dawMobileModel, screenSize: screenSize),
      endDrawerEnableOpenDragGesture: false,
      body: trackCount == 0 ? 
      Center(
        child: Column(
          children: [
            RoundedButton(
              onPressed: () {},
              widthRate: 0.5,
              color: Colors.blue,
              text: "オケを選択しよう！",
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  key: const Key('play_button'),
                  onPressed: () async => await dawMobileModel.play(trackWidth: trackWidth),
                  iconSize: playIconSize,
                  icon: const Icon(Icons.play_arrow),
                  color: Colors.blue,
                ),
                IconButton(
                  key: const Key('pause_button'),
                  onPressed: () async => await dawMobileModel.pause(),
                  iconSize: playIconSize,
                  icon: const Icon(Icons.pause),
                  color: Colors.blue,
                ),
                IconButton(
                  key: const Key('stop_button'),
                  onPressed: () async => await dawMobileModel.stop(),
                  iconSize: playIconSize,
                  icon: const Icon(Icons.stop),
                  color: Colors.red,
                ),
              ],
            ),
            // Slider(
            //   onChanged: (v) {
            //     if (duration == null) {
            //       return;
            //     }
            //     final durationPosition = v * duration.inMilliseconds;
            //     player.seek(Duration(milliseconds: durationPosition.round()));
            //   },
            //   value: (position != null &&
            //           duration != null &&
            //           position.inMilliseconds > 0 &&
            //           position.inMilliseconds < duration.inMilliseconds)
            //       ? position.inMilliseconds / duration.inMilliseconds
            //       : 0.0,
            // ),
            // Text(
            //   position != null
            //       ? '$positionText / $durationText'
            //       : duration != null
            //           ? durationText
            //           : '',
            //   style: const TextStyle(fontSize: 16.0),
            // ),
          ],
        ),
      )
      : CustomSlidingUpPanel(
        minWidth: trackPanelMinWidth,
        maxWidth: trackPanelMaxWidth,
        color: Colors.black,
        defaultPanelState: PanelState.CLOSED,
        parallaxEnabled: true,
        parallaxOffset: 1.0,
        header: Padding(
          padding: EdgeInsets.only(top: screenHight / 2 - kToolbarHeight),  // パネルのスライド可能を表すIcon位置
          child: const IgnorePointer(
            child: RotatedBox(
              quarterTurns: 1,
              child: Icon(Icons.maximize, size: 40.0, color: Colors.white30),
            ),
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.only(bottom: kToolbarHeight),
          child: Column(
            children: [
              Container(  //メモリ表示用
                height: scaleDisplayHeight,
                color: Colors.blueGrey[800],
              ),
              const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
              TrackBandLeft(
                leftTrackScrollController: leftTrackScrollController,
                tracks: tracks,
                trackSize: trackSize,
                trackPanelMaxWidth: trackPanelMaxWidth,
                dawMobileModel: dawMobileModel,
              ),
            ],
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: kToolbarHeight/2, bottom: kToolbarHeight/2, left: trackPanelMinWidth),  // 横画面なので、appBarの高さ分 appBarHight / 2
          child: Stack(
            children: [
              TrackScaleBand(
                dawMobileModel: dawMobileModel,
                trackElementsScrollController: trackElementsScrollControllers,
                rightTrackScrollController: rightTrackScrollController,
                trackBackGroundColor: trackBackGroundColor,
                trackCount: trackCount,
                trackSize: trackSize,
                offVocalWidth: offVocalWidth,
              ),
              Padding(
                padding: const EdgeInsets.only(top: scaleDisplayHeight),
                child: Column(
                  children: [
                    const Divider(color: dividerColor, height: dividerHeightAndThickness, thickness: dividerHeightAndThickness),
                    TrackBandRight(
                      dawMobileModel: dawMobileModel,
                      rightTrackScrollController: rightTrackScrollController,
                      screenWidth: screenWidth,
                      trackCount: trackCount,
                      trackSize: trackSize,
                      offVocalWidth: offVocalWidth,
                      zoomWidthRatio: zoomWidthRatio,
                      bpm: bpm,
                      selectedTimeDivide: selectedTimeDivide,
                      trackElementsScrollController: trackElementsScrollControllers,
                      trackBackGroundColor: trackBackGroundColor,
                      // duration: duration,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}