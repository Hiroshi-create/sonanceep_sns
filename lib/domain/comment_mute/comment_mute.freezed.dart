// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentMute _$CommentMuteFromJson(Map<String, dynamic> json) {
  return _CommentMute.fromJson(json);
}

/// @nodoc
mixin _$CommentMute {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CommentMuteCopyWith<CommentMute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentMuteCopyWith<$Res> {
  factory $CommentMuteCopyWith(
          CommentMute value, $Res Function(CommentMute) then) =
      _$CommentMuteCopyWithImpl<$Res, CommentMute>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef});
}

/// @nodoc
class _$CommentMuteCopyWithImpl<$Res, $Val extends CommentMute>
    implements $CommentMuteCopyWith<$Res> {
  _$CommentMuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentId = null,
    Object? postCommentRef = freezed,
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
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentMuteImplCopyWith<$Res>
    implements $CommentMuteCopyWith<$Res> {
  factory _$$CommentMuteImplCopyWith(
          _$CommentMuteImpl value, $Res Function(_$CommentMuteImpl) then) =
      __$$CommentMuteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef});
}

/// @nodoc
class __$$CommentMuteImplCopyWithImpl<$Res>
    extends _$CommentMuteCopyWithImpl<$Res, _$CommentMuteImpl>
    implements _$$CommentMuteImplCopyWith<$Res> {
  __$$CommentMuteImplCopyWithImpl(
      _$CommentMuteImpl _value, $Res Function(_$CommentMuteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentId = null,
    Object? postCommentRef = freezed,
  }) {
    return _then(_$CommentMuteImpl(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCommentId: null == postCommentId
          ? _value.postCommentId
          : postCommentId // ignore: cast_nullable_to_non_nullable
              as String,
      postCommentRef: freezed == postCommentRef
          ? _value.postCommentRef
          : postCommentRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentMuteImpl implements _CommentMute {
  const _$CommentMuteImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentId,
      required this.postCommentRef});

  factory _$CommentMuteImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentMuteImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postCommentId;
  @override
  final dynamic postCommentRef;

  @override
  String toString() {
    return 'CommentMute(activeUid: $activeUid, createdAt: $createdAt, postCommentId: $postCommentId, postCommentRef: $postCommentRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentMuteImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentId,
      const DeepCollectionEquality().hash(postCommentRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentMuteImplCopyWith<_$CommentMuteImpl> get copyWith =>
      __$$CommentMuteImplCopyWithImpl<_$CommentMuteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentMuteImplToJson(
      this,
    );
  }
}

abstract class _CommentMute implements CommentMute {
  const factory _CommentMute(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentId,
      required final dynamic postCommentRef}) = _$CommentMuteImpl;

  factory _CommentMute.fromJson(Map<String, dynamic> json) =
      _$CommentMuteImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentId;
  @override
  dynamic get postCommentRef;
  @override
  @JsonKey(ignore: true)
  _$$CommentMuteImplCopyWith<_$CommentMuteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
