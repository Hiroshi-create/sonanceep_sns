// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_rooms.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreatedRoomsImpl _$$CreatedRoomsImplFromJson(Map<String, dynamic> json) =>
    _$CreatedRoomsImpl(
      createdAt: json['createdAt'],
      talkUid: json['talkUid'] as String,
      uid: json['uid'] as String,
      talkRoomId: json['talkRoomId'] as String,
    );

Map<String, dynamic> _$$CreatedRoomsImplToJson(_$CreatedRoomsImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'talkUid': instance.talkUid,
      'uid': instance.uid,
      'talkRoomId': instance.talkRoomId,
    };
