// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_song.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreSongImpl _$$FirestoreSongImplFromJson(Map<String, dynamic> json) =>
    _$FirestoreSongImpl(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      searchToken: json['searchToken'] as Map<String, dynamic>,
      artistId: json['artistId'] as String,
      albumType: json['albumType'] as String,
      songName: json['songName'] as String,
      songId: json['songId'] as String,
      songBpm: (json['songBpm'] as num).toDouble(),
      songKey: (json['songKey'] as num).toInt(),
      songGenre:
          (json['songGenre'] as List<dynamic>).map((e) => e as String).toList(),
      songAlbums: (json['songAlbums'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      songImageURL: (json['songImageURL'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      songDuration: (json['songDuration'] as num).toInt(),
      releaseDate: json['releaseDate'],
      artistRef: json['artistRef'],
      wavFileName: json['wavFileName'] as String,
      wavFileURL: json['wavFileURL'] as String,
    );

Map<String, dynamic> _$$FirestoreSongImplToJson(_$FirestoreSongImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'searchToken': instance.searchToken,
      'artistId': instance.artistId,
      'albumType': instance.albumType,
      'songName': instance.songName,
      'songId': instance.songId,
      'songBpm': instance.songBpm,
      'songKey': instance.songKey,
      'songGenre': instance.songGenre,
      'songAlbums': instance.songAlbums,
      'songImageURL': instance.songImageURL,
      'songDuration': instance.songDuration,
      'releaseDate': instance.releaseDate,
      'artistRef': instance.artistRef,
      'wavFileName': instance.wavFileName,
      'wavFileURL': instance.wavFileURL,
    };
