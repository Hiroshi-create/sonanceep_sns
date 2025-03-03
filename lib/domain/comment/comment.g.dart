// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      createdAt: json['createdAt'],
      comment: json['comment'] as String,
      commentLanguageCode: json['commentLanguageCode'] as String,
      commentNegativeScore: (json['commentNegativeScore'] as num).toDouble(),
      commentPositiveScore: (json['commentPositiveScore'] as num).toDouble(),
      commentSentiment: json['commentSentiment'] as String,
      likeCount: (json['likeCount'] as num).toInt(),
      postRef: json['postRef'],
      postCommentId: json['postCommentId'] as String,
      postCommentReplyCount: (json['postCommentReplyCount'] as num).toInt(),
      reportCount: (json['reportCount'] as num).toInt(),
      muteCount: (json['muteCount'] as num).toInt(),
      userName: json['userName'] as String,
      userNameLanguageCode: json['userNameLanguageCode'] as String,
      userNameNegativeScore: (json['userNameNegativeScore'] as num).toDouble(),
      userNamePositiveScore: (json['userNamePositiveScore'] as num).toDouble(),
      userNameSentiment: json['userNameSentiment'] as String,
      uid: json['uid'] as String,
      userImageURL: json['userImageURL'] as String,
      updatedAt: json['updatedAt'],
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'createdAt': instance.createdAt,
      'comment': instance.comment,
      'commentLanguageCode': instance.commentLanguageCode,
      'commentNegativeScore': instance.commentNegativeScore,
      'commentPositiveScore': instance.commentPositiveScore,
      'commentSentiment': instance.commentSentiment,
      'likeCount': instance.likeCount,
      'postRef': instance.postRef,
      'postCommentId': instance.postCommentId,
      'postCommentReplyCount': instance.postCommentReplyCount,
      'reportCount': instance.reportCount,
      'muteCount': instance.muteCount,
      'userName': instance.userName,
      'userNameLanguageCode': instance.userNameLanguageCode,
      'userNameNegativeScore': instance.userNameNegativeScore,
      'userNamePositiveScore': instance.userNamePositiveScore,
      'userNameSentiment': instance.userNameSentiment,
      'uid': instance.uid,
      'userImageURL': instance.userImageURL,
      'updatedAt': instance.updatedAt,
    };
