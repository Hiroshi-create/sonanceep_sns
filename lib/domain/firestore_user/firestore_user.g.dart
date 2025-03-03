// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FirestoreUserImpl _$$FirestoreUserImplFromJson(Map<String, dynamic> json) =>
    _$FirestoreUserImpl(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      followerCount: (json['followerCount'] as num).toInt(),
      followingCount: (json['followingCount'] as num).toInt(),
      isAdmin: json['isAdmin'] as bool,
      muteCount: (json['muteCount'] as num).toInt(),
      searchToken: json['searchToken'] as Map<String, dynamic>,
      postCount: (json['postCount'] as num).toInt(),
      talkRoomCount: (json['talkRoomCount'] as num).toInt(),
      userName: json['userName'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      uid: json['uid'] as String,
      userImageURL: json['userImageURL'] as String,
    );

Map<String, dynamic> _$$FirestoreUserImplToJson(_$FirestoreUserImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'followerCount': instance.followerCount,
      'followingCount': instance.followingCount,
      'isAdmin': instance.isAdmin,
      'muteCount': instance.muteCount,
      'searchToken': instance.searchToken,
      'postCount': instance.postCount,
      'talkRoomCount': instance.talkRoomCount,
      'userName': instance.userName,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'uid': instance.uid,
      'userImageURL': instance.userImageURL,
    };
