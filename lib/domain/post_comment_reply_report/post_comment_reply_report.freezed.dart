// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_comment_reply_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostCommentReplyReport _$PostCommentReplyReportFromJson(
    Map<String, dynamic> json) {
  return _PostCommentReplyReport.fromJson(json);
}

/// @nodoc
mixin _$PostCommentReplyReport {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get others => throw _privateConstructorUsedError; //その他の報告内容
  String get reportContent => throw _privateConstructorUsedError; //メインの報告内容
  String get postCommentReplyCreatorUid => throw _privateConstructorUsedError;
  String get passiveUserName => throw _privateConstructorUsedError;
  dynamic get postCommentReplyDocRef => throw _privateConstructorUsedError;
  String get postCommentReplyId => throw _privateConstructorUsedError;
  String get postCommentReplyReportId => throw _privateConstructorUsedError;
  String get reply => throw _privateConstructorUsedError;
  String get replyLanguageCode => throw _privateConstructorUsedError;
  double get replyNegativeScore => throw _privateConstructorUsedError;
  double get replyPositiveScore => throw _privateConstructorUsedError;
  String get replySentiment => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCommentReplyReportCopyWith<PostCommentReplyReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCommentReplyReportCopyWith<$Res> {
  factory $PostCommentReplyReportCopyWith(PostCommentReplyReport value,
          $Res Function(PostCommentReplyReport) then) =
      _$PostCommentReplyReportCopyWithImpl<$Res, PostCommentReplyReport>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String others,
      String reportContent,
      String postCommentReplyCreatorUid,
      String passiveUserName,
      dynamic postCommentReplyDocRef,
      String postCommentReplyId,
      String postCommentReplyReportId,
      String reply,
      String replyLanguageCode,
      double replyNegativeScore,
      double replyPositiveScore,
      String replySentiment});
}

/// @nodoc
class _$PostCommentReplyReportCopyWithImpl<$Res,
        $Val extends PostCommentReplyReport>
    implements $PostCommentReplyReportCopyWith<$Res> {
  _$PostCommentReplyReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? others = null,
    Object? reportContent = null,
    Object? postCommentReplyCreatorUid = null,
    Object? passiveUserName = null,
    Object? postCommentReplyDocRef = freezed,
    Object? postCommentReplyId = null,
    Object? postCommentReplyReportId = null,
    Object? reply = null,
    Object? replyLanguageCode = null,
    Object? replyNegativeScore = null,
    Object? replyPositiveScore = null,
    Object? replySentiment = null,
  }) {
    return _then(_value.copyWith(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      reportContent: null == reportContent
          ? _value.reportContent
          : reportContent // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyCreatorUid: null == postCommentReplyCreatorUid
          ? _value.postCommentReplyCreatorUid
          : postCommentReplyCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserName: null == passiveUserName
          ? _value.passiveUserName
          : passiveUserName // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyDocRef: freezed == postCommentReplyDocRef
          ? _value.postCommentReplyDocRef
          : postCommentReplyDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyReportId: null == postCommentReplyReportId
          ? _value.postCommentReplyReportId
          : postCommentReplyReportId // ignore: cast_nullable_to_non_nullable
              as String,
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String,
      replyLanguageCode: null == replyLanguageCode
          ? _value.replyLanguageCode
          : replyLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      replyNegativeScore: null == replyNegativeScore
          ? _value.replyNegativeScore
          : replyNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      replyPositiveScore: null == replyPositiveScore
          ? _value.replyPositiveScore
          : replyPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      replySentiment: null == replySentiment
          ? _value.replySentiment
          : replySentiment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostCommentReplyReportImplCopyWith<$Res>
    implements $PostCommentReplyReportCopyWith<$Res> {
  factory _$$PostCommentReplyReportImplCopyWith(
          _$PostCommentReplyReportImpl value,
          $Res Function(_$PostCommentReplyReportImpl) then) =
      __$$PostCommentReplyReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String others,
      String reportContent,
      String postCommentReplyCreatorUid,
      String passiveUserName,
      dynamic postCommentReplyDocRef,
      String postCommentReplyId,
      String postCommentReplyReportId,
      String reply,
      String replyLanguageCode,
      double replyNegativeScore,
      double replyPositiveScore,
      String replySentiment});
}

/// @nodoc
class __$$PostCommentReplyReportImplCopyWithImpl<$Res>
    extends _$PostCommentReplyReportCopyWithImpl<$Res,
        _$PostCommentReplyReportImpl>
    implements _$$PostCommentReplyReportImplCopyWith<$Res> {
  __$$PostCommentReplyReportImplCopyWithImpl(
      _$PostCommentReplyReportImpl _value,
      $Res Function(_$PostCommentReplyReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? others = null,
    Object? reportContent = null,
    Object? postCommentReplyCreatorUid = null,
    Object? passiveUserName = null,
    Object? postCommentReplyDocRef = freezed,
    Object? postCommentReplyId = null,
    Object? postCommentReplyReportId = null,
    Object? reply = null,
    Object? replyLanguageCode = null,
    Object? replyNegativeScore = null,
    Object? replyPositiveScore = null,
    Object? replySentiment = null,
  }) {
    return _then(_$PostCommentReplyReportImpl(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      others: null == others
          ? _value.others
          : others // ignore: cast_nullable_to_non_nullable
              as String,
      reportContent: null == reportContent
          ? _value.reportContent
          : reportContent // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyCreatorUid: null == postCommentReplyCreatorUid
          ? _value.postCommentReplyCreatorUid
          : postCommentReplyCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      passiveUserName: null == passiveUserName
          ? _value.passiveUserName
          : passiveUserName // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyDocRef: freezed == postCommentReplyDocRef
          ? _value.postCommentReplyDocRef
          : postCommentReplyDocRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentReplyId: null == postCommentReplyId
          ? _value.postCommentReplyId
          : postCommentReplyId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentReplyReportId: null == postCommentReplyReportId
          ? _value.postCommentReplyReportId
          : postCommentReplyReportId // ignore: cast_nullable_to_non_nullable
              as String,
      reply: null == reply
          ? _value.reply
          : reply // ignore: cast_nullable_to_non_nullable
              as String,
      replyLanguageCode: null == replyLanguageCode
          ? _value.replyLanguageCode
          : replyLanguageCode // ignore: cast_nullable_to_non_nullable
              as String,
      replyNegativeScore: null == replyNegativeScore
          ? _value.replyNegativeScore
          : replyNegativeScore // ignore: cast_nullable_to_non_nullable
              as double,
      replyPositiveScore: null == replyPositiveScore
          ? _value.replyPositiveScore
          : replyPositiveScore // ignore: cast_nullable_to_non_nullable
              as double,
      replySentiment: null == replySentiment
          ? _value.replySentiment
          : replySentiment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostCommentReplyReportImpl implements _PostCommentReplyReport {
  const _$PostCommentReplyReportImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.others,
      required this.reportContent,
      required this.postCommentReplyCreatorUid,
      required this.passiveUserName,
      required this.postCommentReplyDocRef,
      required this.postCommentReplyId,
      required this.postCommentReplyReportId,
      required this.reply,
      required this.replyLanguageCode,
      required this.replyNegativeScore,
      required this.replyPositiveScore,
      required this.replySentiment});

  factory _$PostCommentReplyReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostCommentReplyReportImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String others;
//その他の報告内容
  @override
  final String reportContent;
//メインの報告内容
  @override
  final String postCommentReplyCreatorUid;
  @override
  final String passiveUserName;
  @override
  final dynamic postCommentReplyDocRef;
  @override
  final String postCommentReplyId;
  @override
  final String postCommentReplyReportId;
  @override
  final String reply;
  @override
  final String replyLanguageCode;
  @override
  final double replyNegativeScore;
  @override
  final double replyPositiveScore;
  @override
  final String replySentiment;

  @override
  String toString() {
    return 'PostCommentReplyReport(activeUid: $activeUid, createdAt: $createdAt, others: $others, reportContent: $reportContent, postCommentReplyCreatorUid: $postCommentReplyCreatorUid, passiveUserName: $passiveUserName, postCommentReplyDocRef: $postCommentReplyDocRef, postCommentReplyId: $postCommentReplyId, postCommentReplyReportId: $postCommentReplyReportId, reply: $reply, replyLanguageCode: $replyLanguageCode, replyNegativeScore: $replyNegativeScore, replyPositiveScore: $replyPositiveScore, replySentiment: $replySentiment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostCommentReplyReportImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.others, others) || other.others == others) &&
            (identical(other.reportContent, reportContent) ||
                other.reportContent == reportContent) &&
            (identical(other.postCommentReplyCreatorUid,
                    postCommentReplyCreatorUid) ||
                other.postCommentReplyCreatorUid ==
                    postCommentReplyCreatorUid) &&
            (identical(other.passiveUserName, passiveUserName) ||
                other.passiveUserName == passiveUserName) &&
            const DeepCollectionEquality()
                .equals(other.postCommentReplyDocRef, postCommentReplyDocRef) &&
            (identical(other.postCommentReplyId, postCommentReplyId) ||
                other.postCommentReplyId == postCommentReplyId) &&
            (identical(
                    other.postCommentReplyReportId, postCommentReplyReportId) ||
                other.postCommentReplyReportId == postCommentReplyReportId) &&
            (identical(other.reply, reply) || other.reply == reply) &&
            (identical(other.replyLanguageCode, replyLanguageCode) ||
                other.replyLanguageCode == replyLanguageCode) &&
            (identical(other.replyNegativeScore, replyNegativeScore) ||
                other.replyNegativeScore == replyNegativeScore) &&
            (identical(other.replyPositiveScore, replyPositiveScore) ||
                other.replyPositiveScore == replyPositiveScore) &&
            (identical(other.replySentiment, replySentiment) ||
                other.replySentiment == replySentiment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      others,
      reportContent,
      postCommentReplyCreatorUid,
      passiveUserName,
      const DeepCollectionEquality().hash(postCommentReplyDocRef),
      postCommentReplyId,
      postCommentReplyReportId,
      reply,
      replyLanguageCode,
      replyNegativeScore,
      replyPositiveScore,
      replySentiment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostCommentReplyReportImplCopyWith<_$PostCommentReplyReportImpl>
      get copyWith => __$$PostCommentReplyReportImplCopyWithImpl<
          _$PostCommentReplyReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostCommentReplyReportImplToJson(
      this,
    );
  }
}

abstract class _PostCommentReplyReport implements PostCommentReplyReport {
  const factory _PostCommentReplyReport(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String others,
      required final String reportContent,
      required final String postCommentReplyCreatorUid,
      required final String passiveUserName,
      required final dynamic postCommentReplyDocRef,
      required final String postCommentReplyId,
      required final String postCommentReplyReportId,
      required final String reply,
      required final String replyLanguageCode,
      required final double replyNegativeScore,
      required final double replyPositiveScore,
      required final String replySentiment}) = _$PostCommentReplyReportImpl;

  factory _PostCommentReplyReport.fromJson(Map<String, dynamic> json) =
      _$PostCommentReplyReportImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get others;
  @override //その他の報告内容
  String get reportContent;
  @override //メインの報告内容
  String get postCommentReplyCreatorUid;
  @override
  String get passiveUserName;
  @override
  dynamic get postCommentReplyDocRef;
  @override
  String get postCommentReplyId;
  @override
  String get postCommentReplyReportId;
  @override
  String get reply;
  @override
  String get replyLanguageCode;
  @override
  double get replyNegativeScore;
  @override
  double get replyPositiveScore;
  @override
  String get replySentiment;
  @override
  @JsonKey(ignore: true)
  _$$PostCommentReplyReportImplCopyWith<_$PostCommentReplyReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
