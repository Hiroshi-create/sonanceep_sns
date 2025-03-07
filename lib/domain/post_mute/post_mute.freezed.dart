// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_mute.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostMute _$PostMuteFromJson(Map<String, dynamic> json) {
  return _PostMute.fromJson(json);
}

/// @nodoc
mixin _$PostMute {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  dynamic get postRef => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostMuteCopyWith<PostMute> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostMuteCopyWith<$Res> {
  factory $PostMuteCopyWith(PostMute value, $Res Function(PostMute) then) =
      _$PostMuteCopyWithImpl<$Res, PostMute>;
  @useResult
  $Res call(
      {String activeUid, dynamic createdAt, String postId, dynamic postRef});
}

/// @nodoc
class _$PostMuteCopyWithImpl<$Res, $Val extends PostMute>
    implements $PostMuteCopyWith<$Res> {
  _$PostMuteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postId = null,
    Object? postRef = freezed,
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
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostMuteImplCopyWith<$Res>
    implements $PostMuteCopyWith<$Res> {
  factory _$$PostMuteImplCopyWith(
          _$PostMuteImpl value, $Res Function(_$PostMuteImpl) then) =
      __$$PostMuteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid, dynamic createdAt, String postId, dynamic postRef});
}

/// @nodoc
class __$$PostMuteImplCopyWithImpl<$Res>
    extends _$PostMuteCopyWithImpl<$Res, _$PostMuteImpl>
    implements _$$PostMuteImplCopyWith<$Res> {
  __$$PostMuteImplCopyWithImpl(
      _$PostMuteImpl _value, $Res Function(_$PostMuteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postId = null,
    Object? postRef = freezed,
  }) {
    return _then(_$PostMuteImpl(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      postRef: freezed == postRef
          ? _value.postRef
          : postRef // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostMuteImpl implements _PostMute {
  const _$PostMuteImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.postId,
      required this.postRef});

  factory _$PostMuteImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostMuteImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String postId;
  @override
  final dynamic postRef;

  @override
  String toString() {
    return 'PostMute(activeUid: $activeUid, createdAt: $createdAt, postId: $postId, postRef: $postRef)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostMuteImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            const DeepCollectionEquality().equals(other.postRef, postRef));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postId,
      const DeepCollectionEquality().hash(postRef));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostMuteImplCopyWith<_$PostMuteImpl> get copyWith =>
      __$$PostMuteImplCopyWithImpl<_$PostMuteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostMuteImplToJson(
      this,
    );
  }
}

abstract class _PostMute implements PostMute {
  const factory _PostMute(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postId,
      required final dynamic postRef}) = _$PostMuteImpl;

  factory _PostMute.fromJson(Map<String, dynamic> json) =
      _$PostMuteImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postId;
  @override
  dynamic get postRef;
  @override
  @JsonKey(ignore: true)
  _$$PostMuteImplCopyWith<_$PostMuteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
