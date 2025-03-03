// flutter
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:camera/camera.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/domain/firestore_song/firestore_song.dart';
import 'package:video_player/video_player.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

final oneShotProvider = ChangeNotifierProvider(
  ((ref) => OneShotModel()
));

class OneShotModel extends ChangeNotifier {
  // CameraControllerのインスタンス
  final AudioPlayer audioPlayer = AudioPlayer();
  CameraController? controller;
  // 録画中かどうか
  bool isRecording = false;
  // 録画した動画のパス
  String? videoPath;

  // カメラの初期化
  Future<void> initializeCamera({required BuildContext context, required DocumentSnapshot<Map<String, dynamic>> songDoc}) async {
    try {
      
      // 利用可能なカメラのリストを取得
      final cameras = await availableCameras();

      // リアカメラを選択
      final firstCamera = cameras.first;

      // CameraControllerのインスタンスを作成
      controller = CameraController(
        firstCamera,
        ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.bgra8888,
      );

      FirestoreSong firestoreSong = FirestoreSong.fromJson(songDoc.data()!);
      String wavFileURL = firestoreSong.wavFileURL;

      await getOffVocalWavFile(wavFileURL: wavFileURL);  //デフォルト音源を取得

      // カメラの初期化が完了したら通知
      controller?.initialize().then((_) {
        notifyListeners();
      });
    } catch (e) {
      voids.showFlutterToast(msg: e.toString());
    }
  }

  // 録画開始
  Future<void> startVideoRecording() async {
    if (!controller!.value.isInitialized) {
      return;
    }

    // 録画中でなければ録画開始
    if (!isRecording) {
      isRecording = true;
      notifyListeners();

      // 動画保存用のパスを生成
      final Directory extDir = await getApplicationDocumentsDirectory();
      final String dirPath = '${extDir.path}/Movies/flutter_test';
      await Directory(dirPath).create(recursive: true);
      final String filePath = '$dirPath/${DateTime.now().millisecondsSinceEpoch}.wav';

      // 録画開始
      await controller!.startVideoRecording();

      // 動画パスを更新
      videoPath = filePath;
      voids.showFlutterToast(msg: '$videoPath');
    }
  }

  // 録画停止
  Future<void> stopVideoRecording() async {
    if (!controller!.value.isInitialized) {
      return;
    }

    // 録画中なら録画停止
    if (isRecording) {
      isRecording = false;
      notifyListeners();

      // 録画停止
      final videoFile = await controller!.stopVideoRecording();

      videoPath = videoFile.path;

      // 動画のバイトデータを取得
      final Uint8List buffer = await videoFile.readAsBytes();

      // カメラロールに保存する
      await ImageGallerySaver.saveImage(buffer, name: videoFile.name);
    }
  }

  // Future<void> saveToCameraRoll() async {
  //   // 動画のバイトデータを取得
  //   final Uint8List buffer = await videoFile.readAsBytes();

  //   // カメラロールに保存する
  //   await ImageGallerySaver.saveVideo(buffer, name: videoFile.name);
  // }

  Future<void> playVideo({required BuildContext context, required WidgetRef ref}) async {
    // VideoPlayerControllerを作成
    final videoController = VideoPlayerController.file(File(videoPath!));
    // 動画を表示するページに遷移
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Video Player'),
          ),
          body: Center(
            child: AspectRatio(
              aspectRatio: videoController.value.aspectRatio,
              child: VideoPlayer(videoController),
            ),
          ),
        ),
      ),
    );
    // 動画の初期化を待つ
    await videoController.initialize();
    // 動画の再生を開始
    videoController.play();
  }

  Future<void> getOffVocalWavFile({required String wavFileURL}) async {
    try {
      audioPlayer.setUrl(wavFileURL);  // awaitをつけるのは注意
    } catch (e) {
      voids.showFlutterToast(msg: 'オケの取得に失敗しました。');
    }
  }

  Future<void> play() async {
    audioPlayer.play();
  }

  Future<void> pause() async {
    audioPlayer.pause();
  }

  Future<void> stop() async {
    audioPlayer.stop();
  }
}