// flutter
import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
// import 'package:quiver/async.dart';

import 'package:audio_wave/audio_wave.dart';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:sonanceep_sns/constants/ints.dart';
import 'package:sonanceep_sns/constants/others.dart';
import 'package:sonanceep_sns/constants/strings.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/domain/firestore_song/firestore_song.dart';
import 'package:sonanceep_sns/domain/track/track.dart';
import 'package:soundpool/soundpool.dart';
import 'package:fake_async/fake_async.dart';
// import 'package:just_audio/just_audio.dart';

final dawMobileProvider = ChangeNotifierProvider(
  ((ref) => DawMobileModel()
));

class DawMobileModel extends ChangeNotifier {

  Size? screenSize;

  //トラックの左右のControllerGroup
  LinkedScrollControllerGroup trackScrollGroup = LinkedScrollControllerGroup();
  ScrollController leftTrackScrollController = ScrollController();
  ScrollController rightTrackScrollController = ScrollController();
  //トラック同士のControllerGroup
  LinkedScrollControllerGroup trackElementsScrollGroup = LinkedScrollControllerGroup();
  List<ScrollController> trackElementsScrollControllers = [];

  //音声ファイル用
  final PlayerController offVocalController = PlayerController();  // オフボーカルのバイトデータ用
  // final AudioPlayer accentClickPlayer = AudioPlayer();
  // final AudioPlayer clickPlayer = AudioPlayer();
  final Soundpool accentClickPlayer = Soundpool.fromOptions();
  late int accentClickPlayerId;
  final Soundpool clickPlayer = Soundpool.fromOptions();
  late int clickPlayerId;
  List<double>? waveformData;  // オフボーカルのバイトデータ
  double? offVocalWidth;
  String? offVocalLocalPath;  // オフボーカルのローカルパス
  double offVocalSeconds = 0.0;
  int? minimumNumberOfMeasures;  // 音声ファイルの最小小節数
  //ダウンロード等
  final Dio dio = Dio();

  // DAW設定用
  bool isPlayback = false;
  bool isClick = false;
  // late Timer timer;
  // late StreamSubscription subscription;
  double bpm = 160;  // bpm
  int trackSections = 20;  // 小節数
  int remainBeat = 0;
  int countOfBeat = 4;  // 拍数
  String selectedPhoneticValue = phoneticValue[2];  // 音価
  List<int> selectedTimeDivide = [4, 4];
  double oneSectionsWidth = 30.0;  // １小節の幅
  double playbackPosition = 137.0;


  List<Track> tracks = [];

  bool isLongPressing = false;

  //
  double zoomHeightRatio = 0.2;  //デフォルト値  動的
  double zoomWidthRatio = 2.0;  //デフォルト値  動的

  screen(BuildContext context) {
    double sHeight = min(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    double sWidth = max(MediaQuery.of(context).size.height, MediaQuery.of(context).size.width);
    screenSize = Size(sWidth, sHeight);
  }

  Future<void> init({required BuildContext context, required DocumentSnapshot<Map<String, dynamic>> songDoc}) async {
    // 画面を戻ったときのために初期化
    tracks = [];
    trackElementsScrollControllers = [];
    screen(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    FirestoreSong firestoreSong = FirestoreSong.fromJson(songDoc.data()!);
    String wavFileURL = firestoreSong.wavFileURL;

    leftTrackScrollController = trackScrollGroup.addAndGet();
    rightTrackScrollController = trackScrollGroup.addAndGet();
    await trackCountPlusOne();  // メモリ表示用
    await getAndSaveInitWavFile(wavFileURL: wavFileURL, songDoc: songDoc);  //デフォルト音源を取得

    // setDefaultTimeSignature();

    notifyListeners();
  }

  Future<void> pseudoDispose() async {
    leftTrackScrollController.dispose();
    rightTrackScrollController.dispose();
    offVocalController.dispose();
    // accentClickController.dispose();
    // clickController.dispose();
    // subscription.cancel();
    for(ScrollController trackElementsScrollController in trackElementsScrollControllers) {
      trackElementsScrollController.dispose();
    }
  }

  Future<void> trackCountPlusOne() async {
    trackElementsScrollControllers.add(trackElementsScrollGroup.addAndGet());
    // trackCount = trackCount + 1;
    Track newTrack = Track(
      trackName: tracks.isEmpty ? '音源' : 'trackName',
      trackVolume: 70.0,
      soloMuteRec: [false, false, false],
    );
    tracks.add(newTrack);
    notifyListeners();
  }

  Future<void> getAndSaveInitWavFile({required String wavFileURL, required DocumentSnapshot<Map<String, dynamic>> songDoc}) async {
    final FirestoreSong firestoreSong = FirestoreSong.fromJson(songDoc.data()!);

    // final FirebaseStorage firebaseStorage = FirebaseStorage.instance;
    // final Reference accentClickRef = firebaseStorage.ref('assets/clickSound/accentClick.wav');
    // final Reference clickRef = firebaseStorage.ref('assets/clickSound/click.wav');

    final Directory tempDir = await getTemporaryDirectory();
    final String saveOffVocalPath = returnSaveAssetsLocalPath(path: tempDir.path, key: firestoreSong.songName);
    // final String saveAccentClickWavPath = returnSaveAssetsLocalPath(path: tempDir.path, key: 'accentClick');
    // final String saveClickWavPath = returnSaveAssetsLocalPath(path: tempDir.path, key: 'click');

    try {
      // await audioPlayer.setUrl(wavFileURL);
      await dio.download(wavFileURL, saveOffVocalPath, onReceiveProgress: (received, total) {
        if (total != -1) {
          // print((received / total * 100).toStringAsFixed(0) + "%");
        }
      });
      // await accentClickRef.writeToFile(File(saveAccentClickWavPath));
      // await clickRef.writeToFile(File(saveClickWavPath));
      
      // File clickFile = File('${appDirectory.path}/click.wav');
      // await clickFile.writeAsBytes((await rootBundle.load('assets/audios/click.wav')).buffer.asUint8List());
      
      await offVocalController.preparePlayer(  // 再生準備
        path: saveOffVocalPath,
        volume: 1.0,
        shouldExtractWaveform: true,
        noOfSamples: 100,
      );
      // クリックをプリロードしてセット
      ByteData accentClickAsset = await rootBundle.load(accentClickPath);
      ByteData clickAsset = await rootBundle.load(clickPath);
      accentClickPlayerId = await accentClickPlayer.load(accentClickAsset);
      clickPlayerId = await clickPlayer.load(clickAsset);
      await trackCountPlusOne();
      try {
        offVocalSeconds = await offVocalController.getDuration(DurationType.max) / 1000;
      } catch (e) {
        voids.showFlutterToast(msg: '$fileIsNotLongEnoughMsg: $e');
      }

      offVocalWidth = returnSoundFileWidth(
        seconds: offVocalSeconds,
        bpm: bpm,
        beatNumerator: selectedTimeDivide[0],
        trackWidth: max(screenSize!.width, screenSize!.height),
        zoomWidthRatio: zoomWidthRatio,
      );
      offVocalLocalPath = saveOffVocalPath;
      waveformData = await offVocalController.extractWaveformData(  // 波形を取得する
        path: saveOffVocalPath,
        noOfSamples: offVocalWidth!.toInt(),
      );

      minimumNumberOfMeasures = numberOfMeasures(numOfBeat: numberOfBeat(seconds: offVocalSeconds, bpm: bpm), beatNumerator: selectedTimeDivide[0]).toInt();
      // voids.showFlutterToast(msg: 'オケの取得に成功。');
    } catch (e) {
      voids.showFlutterToast(msg: failedToRetrieveDataMsg);
      print(e);
    }
  }

  void isMute({required int index}) {
    Track track = tracks[index];
    final Track newTrack = track.copyWith(soloMuteRec: [track.soloMuteRec[0], !track.soloMuteRec[1], track.soloMuteRec[2]]);
    tracks[index] = newTrack;
    notifyListeners();
  }

  void isSolo({required int index}) {
    Track track = tracks[index];
    final Track newTrack = track.copyWith(soloMuteRec: [!track.soloMuteRec[0], track.soloMuteRec[1], track.soloMuteRec[2]]);
    tracks[index] = newTrack;
    notifyListeners();
  }

  void isRec({required int index}) {
    tracks.asMap().forEach((i, track) {
      if(i == index) {
        final Track newTrack = track.copyWith(soloMuteRec: [track.soloMuteRec[0], track.soloMuteRec[1], !track.soloMuteRec[2]]);
        tracks[i] = newTrack;
      } else {
        final Track newTrack = track.copyWith(soloMuteRec: [track.soloMuteRec[0], track.soloMuteRec[1], false]);
        tracks[i] = newTrack;
      }
    });
    notifyListeners();
  }

  void trackVolumeChange({required int index, required double volume}) {
    Track track = tracks[index];
    final Track newTrack = track.copyWith(trackVolume: volume);
    tracks[index] = newTrack;
    notifyListeners();
  }


  // 再生処理 ------------------------------------------------------------------------------
  Future<void> play({required double trackWidth}) async {
    // 再生開始
    if(isPlayback) {
      isPlayback = false;
    }
    else {
      isPlayback = true;
      countUp(trackWidth: trackWidth);
    }

    // Directory appDirectory = await getApplicationDocumentsDirectory();
      // File accentClickFile = File('${appDirectory.path}/accentClick.wav');
      // await accentClickFile.writeAsBytes((await rootBundle.load('assets/audios/accentClick.wav')).buffer.asUint8List());
      // accentClickPlayer.play(AssetSource('audios/accentClick.wav'));

    // int interval = (60 / bpm * 1000000).round();
    // // Timerを作成して、定期的に音声ファイルを再生する
    // metronomeTimer = Timer.periodic(Duration(microseconds: interval), (metronomeTimer) {
    //   accentClickPlayer.play(AssetSource('audios/accentClick.wav'));
    // });

    await offVocalController.startPlayer(finishMode: FinishMode.stop);
    // await accentClickController.startPlayer(finishMode: FinishMode.pause);
    
    // await clickController.startPlayer(finishMode: FinishMode.stop);
    // await clickController.stopPlayer();
  }

  Future<void> pause() async {
    await offVocalController.pausePlayer();
    // await accentClickController.pausePlayer();
    // await clickController.pausePlayer();
    isPlayback = false;
    // timerを停止する
    // timer.cancel();
  }

  Future<void> stop() async {
    await offVocalController.stopPlayer();
    // await accentClickController.stopPlayer();
    // await clickController.stopPlayer();
    playbackPosition = 0.0;
    notifyListeners();
    isPlayback = false;
    // timerを停止する
    // timer.cancel();
  }

  Future<void> countUp({required double trackWidth}) async {
    // double trackBeat = songSections / selectedTimeDivide[0];  // trackの拍数
    // double trackTime = trackBeat / bpm * 60.0;  // trackの時間（秒）
    // double trackWidthAfterZoom = trackWidth * zoomWidthRatio;
    // double widthPerSecond = trackWidthAfterZoom / trackTime;  // 1秒あたりの幅（ピクセル）
    // double widthPerMillisecond = widthPerSecond / 1000.0;  // 1msあたりの幅（ピクセル）
    // voids.showFlutterToast(msg: '$trackWidth');
    // int everyMs = 100;
    // // isPlaybackがtrueの間繰り返す
    // while (isPlayback) {
    //   (playbackPosition += widthPerMillisecond) <= trackWidth ? playbackPosition += widthPerMillisecond : playbackPosition = trackWidth;
    //   // 1ms待つ
    //   await Future.delayed(Duration(milliseconds: everyMs));
    //   notifyListeners();
    // }

    // int intervalMs = 1;
    int intervalMs = 60000 ~/ bpm;
    int? beforeBeat = null;
    double trackLength = 60 / bpm * trackSections * selectedTimeDivide[0]; // トラックの全体の長さ（秒）
    double oneTrackWidth = trackWidth / (trackSections * selectedTimeDivide[0]);  // 1トラック
    double widthPerSecond = trackWidth / trackLength; // トラックの1秒あたりの幅
    double widthPerMillisecond = widthPerSecond * intervalMs / 1000; // everyMsミリ秒ごとの移動距離




    // if(isPlayback) {
    //   repeatCallback(
    //     interval: Duration(milliseconds: intervalMs),
    //     callback: () {
    //       (playbackPosition += widthPerMillisecond) <= trackWidth ? playbackPosition += widthPerMillisecond : {
    //         playbackPosition = trackWidth,
    //         subscription.cancel(),
    //       };
    //       int currentBeat = (playbackPosition / oneTrackWidth).floor();
    //       if(beforeBeat != currentBeat) {
    //         currentBeat % selectedTimeDivide[0] == 0
    //         ? {
    //           accentClickPlayer.play(accentClickPlayerId),
    //         } : {
    //           clickPlayer.play(clickPlayerId),
    //         };
    //         beforeBeat = currentBeat;
    //       }
    //       notifyListeners();
    //     },
    //     // subscription: subscription,
    //   );
    // }

    Duration durationMetro = Duration(microseconds: (60000000 ~/ bpm));
    // Duration durationPlayback = Duration(milliseconds: intervalMs);
    Timer.periodic(durationMetro, (Timer t) => metronome(t));
    // Timer.periodic(durationPlayback, (Timer t) {
    //   (playbackPosition += widthPerMillisecond) <= trackWidth ? playbackPosition += widthPerMillisecond : {
    //     playbackPosition = trackWidth,
    //     t.cancel(),
    //   };
    //   notifyListeners();
    // });


    // // isPlaybackがtrueの場合
    // Timer.periodic(
    //   // 1msごとに繰り返す
    //   Duration(microseconds: (60000000 ~/ bpm)),
    //   // Duration(microseconds: intervalMs * 1000),
    //   // その間隔ごとに動作させたい処理を書く
    //   (Timer timer) => beat(t: timer, remainBeat: remainBeat),
    //   // {
    //   //   // if(sectionCount < trackSections) timer.cancel();
    //   //   // (playbackPosition += widthPerMillisecond) <= trackWidth ? playbackPosition += widthPerMillisecond : {
    //   //   //   playbackPosition = trackWidth,
    //   //   //   timer.cancel(),
    //   //   // };
    //   //   int currentBeat = (playbackPosition / oneTrackWidth).floor();
    //   //   if(beforeBeat != currentBeat) {
    //   //     playSound();
    //   //     // currentBeat % selectedTimeDivide[0] == 0
    //   //     // ? accentClickPlayer.play(accentClickPlayerId) : clickPlayer.play(clickPlayerId);
    //   //     // accentClickPlayer.play(accentClickPlayerId);
    //   //     beforeBeat = currentBeat;
    //   //   }
    //   //   notifyListeners();
    //   //   // sectionCount++;
    //   // },
    // );
  }

  void metronome(Timer t) {
    if(!isPlayback) {
      t.cancel();
    }
    if(remainBeat != trackSections * selectedTimeDivide[0]) {
      voids.showFlutterToast(msg: '$remainBeat');
      remainBeat % selectedTimeDivide[0] == 0 ? accentClickPlayer.play(accentClickPlayerId) : clickPlayer.play(clickPlayerId);
      remainBeat++;
    }
  }

  // void playbackPosUpdate({required Timer t, required double widthPerMillisecond, required double trackWidth}) {
  //   (playbackPosition += widthPerMillisecond) <= trackWidth ? playbackPosition += widthPerMillisecond : {
  //     playbackPosition = trackWidth,
  //     t.cancel(),
  //   };
  // }

  // void repeatCallback({required Duration interval, required void Function() callback}) {
  //   Metronome metronome = Metronome.periodic(interval);
  //   subscription = metronome.listen((time) {
  //     callback();
  //   });
  // }

  Future<void> isClickFlipBool() async {
    isClick = !isClick;
    notifyListeners();
  }
  // ---------------------------------------------------------------------------------------


// 設定類 ------------------------------------------
  // bpm の増減処理 ------------------------------------------------------------------------
  void bpmPlus(int n) {
    bpm = bpm + n;
    notifyListeners();
  }

  Future<void> startBpmPlus() async {
    isLongPressing = true;
    int skipCount = 0;
    while(isLongPressing) {
      skipCount <= 10 ? bpmPlus(1) : bpmPlus(5);
      await Future.delayed(const Duration(milliseconds: 100)); // 0.1秒待つ
      skipCount++;
    }
  }

  void bpmMinus(int n) {
    bpm = bpm - n >= 0 ? bpm - n : 0;
    notifyListeners();
  }

  Future<void> startBpmMinus() async {
    isLongPressing = true;
    int skipCount = 0;
    while(isLongPressing) {
      skipCount <= 10 ? bpmMinus(1) : bpmMinus(5);
      await Future.delayed(const Duration(milliseconds: 100)); // 0.1秒待つ
      skipCount++;
    }
  }

  void stopBpmFluctuation() {
    isLongPressing = false;
  }
  // ---------------------------------------------------------------------------------------

  // 小節数の処理---------------------------------------------------------------------------
  void songSectionsPlus(int n) {
    trackSections = trackSections + n;
    notifyListeners();
  }

  Future<void> startSongSectionsPlus() async {
    isLongPressing = true;
    int skipCount = 0;
    while(isLongPressing) {
      skipCount <= 10 ? songSectionsPlus(1) : songSectionsPlus(5);
      await Future.delayed(const Duration(milliseconds: 100)); // 0.1秒待つ
      skipCount++;
    }
  }

  void songSectionsMinus(int n) {
    int min = minimumNumberOfMeasures != null && minimumNumberOfMeasures! >= 10 ? minimumNumberOfMeasures! : 10;
    trackSections = trackSections - n >= min ? trackSections - n : min;
    notifyListeners();
  }

  Future<void> startSongSectionsMinus() async {
    isLongPressing = true;
    int skipCount = 0;
    while(isLongPressing) {
      skipCount <= 10 ? songSectionsMinus(1) : songSectionsMinus(5);
      await Future.delayed(const Duration(milliseconds: 100)); // 0.1秒待つ
      skipCount++;
    }
  }

  void stopSongSectionsFluctuation() {
    isLongPressing = false;
  }
  // ---------------------------------------------------------------------------------------

  // 小節数の処理---------------------------------------------------------------------------
  void countOfBeatPlus() {
    countOfBeat++;
    countOfBeat = min(countOfBeat, 32);
    selectedTimeDivide = [countOfBeat, selectedTimeDivide[1]];
    print('$selectedTimeDivide');
    notifyListeners();
  }

  void countOfBeatMinus() {
    countOfBeat--;
    countOfBeat = max(countOfBeat, 1);
    selectedTimeDivide = [countOfBeat, selectedTimeDivide[1]];
    print('$selectedTimeDivide');
    notifyListeners();
  }

  void selectTimeSignature({required String value}) {
    selectedPhoneticValue = value;
    selectedTimeDivide = [countOfBeat, int.parse(value)];
    print('$selectedTimeDivide');
    notifyListeners();
  }
  // ---------------------------------------------------------------------------------------
// -------------------------------------------------

// 操作感処理 --------------------------------------
  // 拡大縮小の処理---------------------------------------------------------------------------
  void zoomWidthMagnification({required double amountOfChange, required double screenWidth, required double trackWidth}) {
    double afterWidth = (zoomWidthRatio + amountOfChange) * trackWidth;
    if(amountOfChange >= 0 && zoomWidthRatio <= 16.0) {  // 拡大
      zoomWidthRatio += amountOfChange;
    } else if(amountOfChange < 0 && afterWidth >= screenWidth) { // 縮小
      zoomWidthRatio += amountOfChange;
    }
    notifyListeners();
  }
  // ---------------------------------------------------------------------------------------
// -------------------------------------------------
}