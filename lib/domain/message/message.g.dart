// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      createdAt: json['createdAt'],
      senderId: json['senderId'] as String,
      message: json['message'] as String,
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'senderId': instance.senderId,
      'message': instance.message,
      'isRead': instance.isRead,
    };
