// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreArtistImpl _$$FirestoreArtistImplFromJson(
        Map<String, dynamic> json) =>
    _$FirestoreArtistImpl(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      searchToken: json['searchToken'] as Map<String, dynamic>,
      albumCount: (json['albumCount'] as num).toInt(),
      songCount: (json['songCount'] as num).toInt(),
      artistName: json['artistName'] as String,
      artistId: json['artistId'] as String,
      artistImageURL: json['artistImageURL'] as String,
      artistForm: json['artistForm'] as String,
      artistGenre: (json['artistGenre'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      artistNationality: json['artistNationality'] as String,
      activityStartYear: (json['activityStartYear'] as num).toInt(),
    );

Map<String, dynamic> _$$FirestoreArtistImplToJson(
        _$FirestoreArtistImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'searchToken': instance.searchToken,
      'albumCount': instance.albumCount,
      'songCount': instance.songCount,
      'artistName': instance.artistName,
      'artistId': instance.artistId,
      'artistImageURL': instance.artistImageURL,
      'artistForm': instance.artistForm,
      'artistGenre': instance.artistGenre,
      'artistNationality': instance.artistNationality,
      'activityStartYear': instance.activityStartYear,
    };
