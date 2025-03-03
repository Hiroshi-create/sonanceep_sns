// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PostImpl _$$PostImplFromJson(Map<String, dynamic> json) => _$PostImpl(
      createdAt: json['createdAt'],
      hashTags:
          (json['hashTags'] as List<dynamic>).map((e) => e as String).toList(),
      imageURL: json['imageURL'] as String,
      videoURL: json['videoURL'] as String,
      thumbnailURL: json['thumbnailURL'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      text: json['text'] as String,
      textLanguageCode: json['textLanguageCode'] as String,
      textNegativeScore: (json['textNegativeScore'] as num).toDouble(),
      textPositiveScore: (json['textPositiveScore'] as num).toDouble(),
      textSentiment: json['textSentiment'] as String,
      commentCount: (json['commentCount'] as num).toInt(),
      postId: json['postId'] as String,
      reportCount: (json['reportCount'] as num).toInt(),
      muteCount: (json['muteCount'] as num).toInt(),
      uid: json['uid'] as String,
      userName: json['userName'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      userImageURL: json['userImageURL'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$PostImplToJson(_$PostImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'hashTags': instance.hashTags,
      'imageURL': instance.imageURL,
      'videoURL': instance.videoURL,
      'thumbnailURL': instance.thumbnailURL,
      'likeCount': instance.likeCount,
      'text': instance.text,
      'textLanguageCode': instance.textLanguageCode,
      'textNegativeScore': instance.textNegativeScore,
      'textPositiveScore': instance.textPositiveScore,
      'textSentiment': instance.textSentiment,
      'commentCount': instance.commentCount,
      'postId': instance.postId,
      'reportCount': instance.reportCount,
      'muteCount': instance.muteCount,
      'uid': instance.uid,
      'userName': instance.userName,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'userImageURL': instance.userImageURL,
      'updatedAt': instance.updatedAt,
    };
