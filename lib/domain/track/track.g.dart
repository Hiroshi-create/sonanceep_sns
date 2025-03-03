// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      trackName: json['trackName'] as String,
      trackVolume: (json['trackVolume'] as num).toDouble(),
      soloMuteRec:
          (json['soloMuteRec'] as List<dynamic>).map((e) => e as bool).toList(),
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'trackName': instance.trackName,
      'trackVolume': instance.trackVolume,
      'soloMuteRec': instance.soloMuteRec,
    };
