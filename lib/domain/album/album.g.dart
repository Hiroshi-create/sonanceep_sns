// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumImpl _$$AlbumImplFromJson(Map<String, dynamic> json) => _$AlbumImpl(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      artistId: json['artistId'] as String,
      searchToken: json['searchToken'] as Map<String, dynamic>,
      albumName: json['albumName'] as String,
      albumId: json['albumId'] as String,
      albumSongs: (json['albumSongs'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      albumImageURL: json['albumImageURL'] as String,
      releaseDate: json['releaseDate'],
      artistRef: json['artistRef'],
    );

Map<String, dynamic> _$$AlbumImplToJson(_$AlbumImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'artistId': instance.artistId,
      'searchToken': instance.searchToken,
      'albumName': instance.albumName,
      'albumId': instance.albumId,
      'albumSongs': instance.albumSongs,
      'albumImageURL': instance.albumImageURL,
      'releaseDate': instance.releaseDate,
      'artistRef': instance.artistRef,
    };
