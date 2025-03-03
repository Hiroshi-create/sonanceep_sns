// flutter
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
// packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sonanceep_sns/models/one_shot_model.dart';
import 'package:audio_wave/audio_wave.dart';

class OneShotPage extends HookConsumerWidget {
  const OneShotPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final OneShotModel oneShotModel = ref.watch(oneShotProvider);
    final CameraController? cameraController = oneShotModel.controller;
    final CameraController? controller = oneShotModel.controller;


    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    useEffect(() {
      // ページ遷移するときの処理
      return () {
        // ページを戻る時の処理
        cameraController?.dispose();
      };
    }, const []);

    return Scaffold(
      body: controller == null ? const Center(child: Text('controller == null', style: TextStyle(color: Colors.red),),) :
      cameraController == null ? const Center(child: Text('cameraController == null', style: TextStyle(color: Colors.green),),) :
      Stack(
        children: [
          SizedBox(
            height: screenHeight,
            width: screenWidth,
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: CameraPreview(controller),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.white,
                  onPressed: () async {
                    // 録画中なら録画停止、録画中でなければ録画開始
                    oneShotModel.isRecording ? await oneShotModel.stopVideoRecording() : await oneShotModel.startVideoRecording();
                  },
                  child: oneShotModel.isRecording
                  ? const Icon(Icons.stop, color: Colors.red) // 録画中なら停止アイコン
                  : const Icon(Icons.videocam), // 録画中でなければ録画アイコン
                ),
                // oneShotModel.videoPath != null ? 
                FloatingActionButton(
                  child: const Icon(Icons.play_arrow),
                  onPressed: () {
                    // 録画した動画を再生するメソッドを呼び出す
                    oneShotModel.playVideo(context: context, ref: ref);
                  },
                ),
                //  : Container(),
              ],
            ),
          ),
          AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
              onPressed: () {},
              iconSize: 48.0,
              icon: const Icon(Icons.skip_previous),
              color: Colors.blue,
            ),
            IconButton(
              key: const Key('play_button'),
              onPressed: () async => await oneShotModel.play(),
              iconSize: 48.0,
              icon: const Icon(Icons.play_arrow),
              color: Colors.blue,
            ),
            IconButton(
              key: const Key('stop_button'),
              onPressed: () async => await oneShotModel.stop(),
              iconSize: 48.0,
              icon: const Icon(Icons.fiber_manual_record),
              color: Colors.red,
            ),
              ],
            ),
            elevation: 0, // 影を消す
            backgroundColor: Colors.transparent,
          ),
        ],
      ),
    );
    
    
    
    // Scaffold(
    //   appBar: AppBar(
    //     leading: IconButton(
    //       icon: const Icon(Icons.arrow_back_ios),
    //       onPressed: () => Navigator.pop(context),
    //     ),
    //   ),
    //   body: FutureBuilder<void>(
    //     future: oneShotModel.initializeCamera(),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.done) {
    //         // カメラの入力を表示する
    //         return CameraPreview(cameraController!);
    //       } else {
    //         // カメラが初期化されるまでローディング表示
    //         return const Center(child: CircularProgressIndicator());
    //       }
    //     },
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     child: const Icon(Icons.videocam),
    //     onPressed: () async {
    //       try {
    //         // カメラが初期化されていることを確認する
    //         await oneShotModel.initializeCamera();
    //         // 動画の録画先のファイルパスを指定する（ここでは一時ディレクトリに保存）
    //         // final path = '${(await getTemporaryDirectory()).path}/video.mp4';
    //         // 動画の録画を開始する
    //         await cameraController.startVideoRecording();
    //         // 録画中であることを表示する
    //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Recording...')));
    //       } catch (e) {
    //         // 録画開始に失敗した場合のエラー処理
    //         print(e);
    //       }
    //     },
    //   ),
    // );
  }
}