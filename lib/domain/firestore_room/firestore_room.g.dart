// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreRoomImpl _$$FirestoreRoomImplFromJson(Map<String, dynamic> json) =>
    _$FirestoreRoomImpl(
      createdAt: json['createdAt'],
      joinedUsers: (json['joinedUsers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      talkRoomId: json['talkRoomId'] as String,
      lastMessage: json['lastMessage'] as String,
      updateAt: json['updateAt'],
    );

Map<String, dynamic> _$$FirestoreRoomImplToJson(_$FirestoreRoomImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'joinedUsers': instance.joinedUsers,
      'talkRoomId': instance.talkRoomId,
      'lastMessage': instance.lastMessage,
      'updateAt': instance.updateAt,
    };
