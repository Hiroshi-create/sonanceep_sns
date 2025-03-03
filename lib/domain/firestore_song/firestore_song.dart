import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
// packeges
part 'firestore_song.freezed.dart';
part 'firestore_song.g.dart';

//jsonをクラスにする
@freezed  //パッケージの型は使えない（Timestampなど）ので dynamic型 を使用する  エディターでエラー表示はされない
abstract class FirestoreSong with _$FirestoreSong {
  // DBに保存する
  // createdAtやIdが必要
  // 自分がフォローしたことの印
  const factory FirestoreSong({  // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
    required dynamic createdAt,  // dynamic型 なんでも許す
    required dynamic updatedAt,
    required Map<String,dynamic> searchToken,
    required String artistId,
    required String albumType,
    required String songName,
    required String songId,
    required double songBpm,
    required int songKey,
    required List<String> songGenre,
    required List<String> songAlbums,
    required List<String> songImageURL,
    required int songDuration,
    required dynamic releaseDate,
    required dynamic artistRef,
    required String wavFileName,
    required String wavFileURL,
  }) = _FirestoreSong;
  factory FirestoreSong.fromJson(Map<String,dynamic> json) => _$FirestoreSongFromJson(json);  //fromJsonと同時にtoJsonもメソッドされる
}