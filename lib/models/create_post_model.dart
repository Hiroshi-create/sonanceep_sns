// flutter
// import 'package:flash/flash_helper.dart';
// ignore_for_file: unused_import

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sonanceep_sns/constants/enums.dart';
import 'package:sonanceep_sns/constants/others.dart';
// constants
import 'package:sonanceep_sns/constants/voids.dart' as voids;
import 'package:sonanceep_sns/constants/strings.dart';
// package
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flash/flash.dart';
import 'package:sonanceep_sns/domain/firestore_user/firestore_user.dart';
import 'package:sonanceep_sns/domain/post/post.dart';
import 'package:sonanceep_sns/models/main_model.dart';
import 'package:sonanceep_sns/models/post_repository.dart';
import 'package:video_player/video_player.dart';

final createPostProvider = ChangeNotifierProvider(
  ((ref) => CreatePostModel()
));

class CreatePostModel extends ChangeNotifier {

  File? imageCroppedFile = null;
  File? videoCroppedFile = null;
  String text = '';
  UrlFormatType? urlFormatType = UrlFormatType.text;
  String imageURL = '';
  String videoURL = '';
  String thumbnailURL = '';

  String? path;
  String postId = returnUuidV4();

  Future<void> createPost({required MainModel mainModel, required BuildContext context}) async {
    final Timestamp now = Timestamp.now();
    final DocumentSnapshot<Map<String,dynamic>> currentUserDoc = mainModel.currentUserDoc;
    final FirestoreUser firestoreUser = mainModel.firestoreUser;
    final String activeUid = currentUserDoc.id;
    final Post post = Post(
      createdAt: now,
      hashTags: [],
      imageURL: imageURL,
      videoURL: videoURL,
      thumbnailURL: thumbnailURL,
      likeCount: 0,
      text: text,
      textLanguageCode: '',
      textNegativeScore: 0,
      textPositiveScore: 0,
      textSentiment: '',
      commentCount: 0,
      postId: postId,
      reportCount: 0,
      muteCount: 0,
      uid: activeUid,
      userImageURL: firestoreUser.userImageURL,
      userName: firestoreUser.userName,
      userNameLanguageCode: firestoreUser.userNameLanguageCode,
      userNameNegativeScore: firestoreUser.userNameNegativeScore,
      userNamePositiveScore: firestoreUser.userNamePositiveScore,
      userNameSentiment: firestoreUser.userNameSentiment,
      updatedAt: now,
    );
    await currentUserDoc.reference.collection('posts').doc(postId).set(post.toJson());  // main_model.dartで最初に取得したcurrentUserDocの下に投稿を作成する
    // await voids.showFlutterToast(msg: createdPostMsg);
    text = '';
    postId = returnUuidV4();
    resetURL();
    Navigator.pop(context);  //ひとつ前のページに戻る
  }

  // Future<Post> getPostById({required String id})async{
  //   DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection('users').doc(currentUser.uid).collection("posts").doc(id).get();
  //   if(!doc.exists){
  //   //   エラー投げる
  //   }
  //   return Post.fromJson(doc.data()!);
  // }

  Future<void> showPost({
    required BuildContext context,
    required MainModel mainModel,
  }) async {
    final uid = mainModel.currentUserDoc.id;

    switch(urlFormatType) {
      case UrlFormatType.image:
        // ここで画像をアップロードし、URLを取得
        imageURL = await uploadImageAndGetURL(uid: uid, file: imageCroppedFile!);

        // アップロードが成功した場合の処理
        if(text.isNotEmpty) {
          await createPost(mainModel: mainModel, context: context);
        }
        // // try{
        //   //画像の投稿
        //   // textとcroppedがどっちもnullだったら行う必要ない
        //   if(text.isEmpty || imageCroppedFile == null) return;
        //   imageURL = imageCroppedFile != null ? await uploadImageAndGetURL(uid: uid, file: imageCroppedFile!, postId: postId) : '' ;
        //   if(text.isNotEmpty) {
        //     await createPost(mainModel: mainModel, context: context, postId: postId);
        //   }
        //   voids.showFlutterToast(msg: "エラー");
        // // } catch(e) {
        // //   // voids.showFlutterToast(msg: "$errCreatedPostMsg ${e.toString()}");
        // // }
      break;
      case UrlFormatType.video:
        // 動画の投稿
        if(text.isEmpty || videoCroppedFile == null) return;
        if(urlFormatType == UrlFormatType.video || urlFormatType == UrlFormatType.thumbnail) {
          videoURL = videoCroppedFile != null ? await uploadVideoAndGetURL(uid: uid, file: videoCroppedFile!) : '';
          // サムネイルが貼り付けられている場合
          if(urlFormatType == UrlFormatType.thumbnail && imageCroppedFile != null) {
            thumbnailURL = await uploadImageAndGetURL(uid: uid, file: imageCroppedFile!);
            
          } else if(urlFormatType == UrlFormatType.video && imageCroppedFile == null) {
            // 動画だけの場合   動画からサムネイルを作成
            await generateThumbnail(uid: uid);
          }
          if(text.isNotEmpty) {
            await createPost(mainModel: mainModel, context: context);
          }
        }
      break;
      case UrlFormatType.thumbnail:
      break;
      case UrlFormatType.text:
        await createPost(mainModel: mainModel, context: context);
      break;
      case null:
      break;
    }
  }

  // 動画からサムネイルを作成
  Future<void> generateThumbnail({required String uid}) async {
    // アプリケーションの一時ディレクトリを取得
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = tempDir.path;
    final String outputPath = '$tempPath/create_post/thumbnail.jpg';
    path = outputPath;

    try {
      // '-i' は入力ファイル、'-ss' は開始時間（ここでは動画の最初）、'-vframes' はフレーム数（1に設定して静止画を取得）
      // '-y' は出力ファイルが存在する場合に上書きすることを意味します。
      await FFmpegKit.execute('-i ${videoCroppedFile!.path} -ss 00:00:01.000 -vframes 1 -y $outputPath').then((session) async {

        final ReturnCode? returnCode = await session.getReturnCode();
        if(ReturnCode.isSuccess(returnCode)) {
          // サムネイルのアップロード
          final File thumbnailCroppedFile = File(outputPath);
          // thumbnailURL = await uploadImageAndGetURL(uid: uid, file: thumbnailCroppedFile, postId: postId);
          // 一時ファイルの削除
          await thumbnailCroppedFile.delete();
        } else {
          voids.showFlutterToast(msg: 'サムネイルの生成に失敗しました。');
        }
      });
    } catch(e) {
      voids.showFlutterToast(msg: 'サムネイルの生成に失敗しました : $e');
    }
  }

  // UIとして画像を表示するウィジェット
  Widget displayImage() {
    return 
    path != null ? Image.file(
      File(path!),
      width: double.infinity, // 画面いっぱいの幅にする場合
      fit: BoxFit.cover, // 画像がウィジェットの境界に合うように調整
    ) : const SizedBox();
  }

  

  // 画像のURLを読み取る
  Future<String> uploadImageAndGetURL({required String uid, required File file}) async {  //Fileを使うには import 'dart:io';
    final String fileName = returnJpgFileName();
    // final Reference storageRef = FirebaseStorage.instance.ref().child('users').child(uid).child('posts').child(postId).child(fileName);
    // // users/uid/ファイル名 にアップロード
    // await storageRef.putFile(file);
    // // users/uid/ファイル名 のURLを取得している

    final filesize = await file.length();
    print('$filesize');

    try {
      final Reference storageRef = FirebaseStorage.instance.ref().child('users').child(uid).child('posts').child(postId).child(fileName);
      // users/uid/ファイル名 にアップロード
      await storageRef.putFile(file);
      return await storageRef.getDownloadURL();  // Future の場合時間がかかる処理のため await が必要
    } on FirebaseException catch (e) {
      // Firebaseからの例外をキャッチし、エラーメッセージをログに記録
      print('Firebase Storage error: ${e.code} - ${e.message}');
      voids.showFlutterToast(msg: "アップロードエラー: ${e.message}");
      return '';
    }
    // return await storageRef.getDownloadURL();  // Future の場合時間がかかる処理のため await が必要
  }

  // 動画のURLを読み取る
  Future<String> uploadVideoAndGetURL({required String uid, required File file}) async {
    // ファイル名を生成
    final String fileName = returnMp4FileName();
    // Firebase Storageの参照を作成
    final Reference storageRef = FirebaseStorage.instance.ref().child('users').child(uid).child('posts').child(postId).child(fileName);
    // users/uid/ファイル名 にアップロード
    await storageRef.putFile(file);
    // users/uid/ファイル名 のURLを取得している
    return await storageRef.getDownloadURL();  // Future の場合時間がかかる処理のため await が必要
  }

  // 画像のfileを読み取る
  Future<void> onImageTapped() async {
    resetURL();
    final XFile xFile = await returnImageXFile();
    imageCroppedFile = await returnCroppedFile(xFile: xFile);
    urlFormatType = UrlFormatType.image;
    notifyListeners();
  }

  // 動画のfileを読み取る
  Future<void> onVideoTapped({required String uid}) async {
    resetURL();
    final XFile xFile = await returnVideoXFile();
    videoCroppedFile = File(xFile.path);
    urlFormatType = UrlFormatType.video;
    await generateThumbnail(uid: uid);
    notifyListeners();
  }

  // サムネのfileを読み取る
  Future<void> onThumbnailTapped() async {
    if(urlFormatType == UrlFormatType.video) {
      final XFile xFile = await returnImageXFile();
      imageCroppedFile = File(xFile.path);
      urlFormatType = UrlFormatType.thumbnail;
      notifyListeners();
    }
  }

  // アップロードした画像、動画を取り消し
  void uploadCancelTapped() {
    imageCroppedFile = null;
    videoCroppedFile = null;
    resetURL();
    urlFormatType = UrlFormatType.text;
    notifyListeners();
    voids.showFlutterToast(msg: text);
  }

  // 前の画面に戻る時の処理
  void backPage() {
    imageCroppedFile = null;
    videoCroppedFile = null;
    text = '';
    resetURL();
    urlFormatType = UrlFormatType.text;
  }

  void resetURL() {
    imageURL = videoURL = thumbnailURL = '';
    // imageCroppedFile = videoCroppedFile = null;
  }
}