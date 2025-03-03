// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quita_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$QuitaUserImpl _$$QuitaUserImplFromJson(Map<String, dynamic> json) =>
    _$QuitaUserImpl(
      description: json['description'] as String,
      followees_count: (json['followees_count'] as num).toInt(),
      followers_count: (json['followers_count'] as num).toInt(),
      id: json['id'] as String,
      items_count: (json['items_count'] as num).toInt(),
      name: json['name'] as String,
      permanent_id: (json['permanent_id'] as num).toInt(),
      profile_image_url: json['profile_image_url'] as String,
    );

Map<String, dynamic> _$$QuitaUserImplToJson(_$QuitaUserImpl instance) =>
    <String, dynamic>{
      'description': instance.description,
      'followees_count': instance.followees_count,
      'followers_count': instance.followers_count,
      'id': instance.id,
      'items_count': instance.items_count,
      'name': instance.name,
      'permanent_id': instance.permanent_id,
      'profile_image_url': instance.profile_image_url,
    };
