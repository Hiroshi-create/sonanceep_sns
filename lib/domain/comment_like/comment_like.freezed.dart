// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentLike _$CommentLikeFromJson(Map<String, dynamic> json) {
  return _CommentLike.fromJson(json);
}

/// @nodoc
mixin _$CommentLike {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentCreatorUid => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentLikeCopyWith<CommentLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentLikeCopyWith<$Res> {
  factory $CommentLikeCopyWith(
          CommentLike value, $Res Function(CommentLike) then) =
      _$CommentLikeCopyWithImpl<$Res, CommentLike>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentCreatorUid,
      dynamic postCommentRef,
      String postCommentId});
}

/// @nodoc
class _$CommentLikeCopyWithImpl<$Res, $Val extends CommentLike>
    implements $CommentLikeCopyWith<$Res> {
  _$CommentLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentCreatorUid = null,
    Object? postCommentRef = freezed,
    Object? postCommentId = null,
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
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentLikeImplCopyWith<$Res>
    implements $CommentLikeCopyWith<$Res> {
  factory _$$CommentLikeImplCopyWith(
          _$CommentLikeImpl value, $Res Function(_$CommentLikeImpl) then) =
      __$$CommentLikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentCreatorUid,
      dynamic postCommentRef,
      String postCommentId});
}

/// @nodoc
class __$$CommentLikeImplCopyWithImpl<$Res>
    extends _$CommentLikeCopyWithImpl<$Res, _$CommentLikeImpl>
    implements _$$CommentLikeImplCopyWith<$Res> {
  __$$CommentLikeImplCopyWithImpl(
      _$CommentLikeImpl _value, $Res Function(_$CommentLikeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentCreatorUid = null,
    Object? postCommentRef = freezed,
    Object? postCommentId = null,
  }) {
    return _then(_$CommentLikeImpl(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentCreatorUid: null == postCommentCreatorUid
          ? _value.postCommentCreatorUid
          : postCommentCreatorUid // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentLikeImpl implements _CommentLike {
  const _$CommentLikeImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentCreatorUid,
      required this.postCommentRef,
      required this.postCommentId});

  factory _$CommentLikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentLikeImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentCreatorUid;
  @override
  final dynamic postCommentRef;
  @override
  final String postCommentId;

  @override
  String toString() {
    return 'CommentLike(activeUid: $activeUid, createdAt: $createdAt, postCommentCreatorUid: $postCommentCreatorUid, postCommentRef: $postCommentRef, postCommentId: $postCommentId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentLikeImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentCreatorUid, postCommentCreatorUid) ||
                other.postCommentCreatorUid == postCommentCreatorUid) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentCreatorUid,
      const DeepCollectionEquality().hash(postCommentRef),
      postCommentId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentLikeImplCopyWith<_$CommentLikeImpl> get copyWith =>
      __$$CommentLikeImplCopyWithImpl<_$CommentLikeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentLikeImplToJson(
      this,
    );
  }
}

abstract class _CommentLike implements CommentLike {
  const factory _CommentLike(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentCreatorUid,
      required final dynamic postCommentRef,
      required final String postCommentId}) = _$CommentLikeImpl;

  factory _CommentLike.fromJson(Map<String, dynamic> json) =
      _$CommentLikeImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentCreatorUid;
  @override
  dynamic get postCommentRef;
  @override
  String get postCommentId;
  @override
  @JsonKey(ignore: true)
  _$$CommentLikeImplCopyWith<_$CommentLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
