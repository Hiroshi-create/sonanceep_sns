// intとかString以外のものreturn
// dart
import 'dart:async';
import 'dart:io';
// flutter
import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:sonanceep_sns/constants/voids.dart';
// packages
import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// constants
import 'package:sonanceep_sns/constants/strings.dart';

// ローカルの画像読み取り ---------------------------------------------------------------
Future<XFile> returnImageXFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  return image!;
}

Future<File?> returnCroppedFile({ required XFile? xFile }) async {
  final instance = ImageCropper();
  final File? result = await instance.cropImage(
    sourcePath: xFile!.path,
    aspectRatioPresets: [CropAspectRatioPreset.square],
    iosUiSettings:  const IOSUiSettings(
      title: cropperTitle,
    ),
    androidUiSettings: const AndroidUiSettings(
      toolbarTitle: cropperTitle,
      toolbarColor: Colors.green,
      initAspectRatio: CropAspectRatioPreset.square,
      lockAspectRatio: false,
    )
  );
  return result;
}
// --------------------------------------------------------------------------------------

// ローカルの動画読み取り ---------------------------------------------------------------
Future<XFile> returnVideoXFile() async {
  final ImagePicker picker = ImagePicker();
  final XFile? video = await picker.pickVideo(source: ImageSource.gallery);
  return video!;
}

Future<VideoPlayerController> returnVideoController({ required XFile? xFile }) async {
  final VideoPlayerController controller = VideoPlayerController.file(File(xFile!.path));
  await controller.initialize();
  return controller;
}
// --------------------------------------------------------------------------------------

// 動画再生時の設定 ---------------------------------------------------------------------
ChewieController videoPlayerSettings({required String imageURL, required VideoPlayerController videoPlayerController}) {
  // VideoPlayerController videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(imageURL));
  // videoPlayerController.setVolume(0.0);
    ChewieController chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 3 / 2,
      autoPlay: true,
      looping: false,
      autoInitialize: true,
      deviceOrientationsAfterFullScreen: const [DeviceOrientation.portraitUp],  //動画の全画面を閉じた時に縦画面に戻す
    );
    return chewieController;
}
// --------------------------------------------------------------------------------------

User? returnAuthUser() => FirebaseAuth.instance.currentUser;

DocumentReference<Map<String,dynamic>> userDocToTokenDocRef({
  required DocumentSnapshot<Map<String,dynamic>> currentUserDoc,
  required String tokenId,
}) => currentUserDoc.reference.collection('tokens').doc(tokenId);

Query<Map<String,dynamic>> returnUserSearchQuery({required List<String> searchWords}) {
  Query<Map<String,dynamic>> query = FirebaseFirestore.instance.collection(usersFieldKey).limit(30);
  for(final searchWord in searchWords) {
    query = query.where('searchToken.$searchWord', isEqualTo: true);
  }
  return query;
}

Query<Map<String,dynamic>> returnArtistSearchQuery({required List<String> searchWords}) {
  Query<Map<String,dynamic>> query = FirebaseFirestore.instance.collection(artistsFieldKey).limit(30);
  for(final searchWord in searchWords) {
    query = query.where('searchToken.$searchWord', isEqualTo: true);
  }
  return query;
}

Query<Map<String,dynamic>> returnSongSearchQuery({required List<String> searchWords}) {
  Query<Map<String,dynamic>> query = FirebaseFirestore.instance.collection(songsFieldKey).limit(30);
  for(final searchWord in searchWords) {
    query = query.where('searchToken.$searchWord', isEqualTo: true);
  }
  return query;
}

// Future<Uint8List> returnAudioBytes({required String saveOffVocalPath}) async {
//   final byteData = await rootBundle.load(saveOffVocalPath);
//   showFlutterToast(msg: '$byteData');
//   final audioBytes = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
//   return audioBytes;
// }

Future<List<int>> returnAudioBytesDoubleList({required Uint8List audioBytes}) async {
  final List<int> bytesList = audioBytes.toList();
  return bytesList;
}

FlutterSliderHandler playbackPositionHandlerWidget() {
  return FlutterSliderHandler(child: Container(
    width: 2.0,
    color: Colors.white,
  ));
}

// dawの処理 ----------------------------------------------------------------------------
double numberOfBeat({required double seconds, required double bpm}) {  // 拍数
  return seconds / (bpm / 60.0);
}

double numberOfMeasures({required double numOfBeat, required int beatNumerator}) {  // 小節数
  return numOfBeat / beatNumerator;
}

double oneMeasureWidth({required double trackWidth, required double numOfMeasures}) {  // １小節あたりの幅
  return trackWidth / numOfMeasures;
}

double soundFileWidth({required double oneMeasuresWidth, required double zoomWidthRatio}) {  // 音声ファイルの幅
  return oneMeasuresWidth * zoomWidthRatio;
}

double returnSoundFileWidth({
  required double seconds,
  required double bpm,
  required int beatNumerator,
  required double trackWidth,
  required double zoomWidthRatio
}) {
  final double numOfBeat = numberOfBeat(seconds: seconds, bpm: bpm);
  final double numOfMeasures = numberOfMeasures(numOfBeat: numOfBeat, beatNumerator: beatNumerator);
  final double oneWidth = oneMeasureWidth(trackWidth: trackWidth, numOfMeasures: numOfMeasures);
  final double offVocalWidth = oneWidth * zoomWidthRatio;  // 音声ファイルの幅
  return offVocalWidth;
}

// 正確な指定時間毎の処理
// void repeatCallback({required Duration interval, required StreamSubscription subscription, required void Function() callback}) {
//   Metronome metronome = Metronome.periodic(interval);
//   subscription = metronome.listen((time) {
//     callback();
//   });
// }
// --------------------------------------------------------------------------------------

// List<Map<String, bool>>型からtrueの文字列飲みのList<String>を作成 --------------------
List<String> extractSelectedGenres({required List<Map<String, bool>> genreList}) {
  final selectedGenres = <String>[];
  for(final genreMap in genreList) {
    final genreName = genreMap.keys.first;
    final isSelected = genreMap.values.first;
    if(isSelected) {
      selectedGenres.add(genreName);
    }
  }
  return selectedGenres;
}
// --------------------------------------------------------------------------------------

AppLocalizations returnL10n({required BuildContext context}) => AppLocalizations.of(context)!;