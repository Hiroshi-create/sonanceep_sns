import 'package:freezed_annotation/freezed_annotation.dart';
// packeges
part 'track.freezed.dart';
part 'track.g.dart';

//jsonをクラスにする
@freezed  //パッケージの型は使えない（Timestampなど）ので dynamic型 を使用する  エディターでエラー表示はされない
abstract class Track with _$Track {
  const factory Track({  // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
    required String trackName,
    required double trackVolume,
    required List<bool> soloMuteRec,
  }) = _Track;
  factory Track.fromJson(Map<String,dynamic> json) => _$TrackFromJson(json);  //fromJsonと同時にtoJsonもメソッドされる
}