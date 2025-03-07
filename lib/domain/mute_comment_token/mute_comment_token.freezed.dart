// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_comment_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MuteCommentToken _$MuteCommentTokenFromJson(Map<String, dynamic> json) {
  return _MuteCommentToken.fromJson(json);
}

/// @nodoc
mixin _$MuteCommentToken {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get postCommentId => throw _privateConstructorUsedError;
  dynamic get postCommentRef => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteCommentTokenCopyWith<MuteCommentToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteCommentTokenCopyWith<$Res> {
  factory $MuteCommentTokenCopyWith(
          MuteCommentToken value, $Res Function(MuteCommentToken) then) =
      _$MuteCommentTokenCopyWithImpl<$Res, MuteCommentToken>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MuteCommentTokenCopyWithImpl<$Res, $Val extends MuteCommentToken>
    implements $MuteCommentTokenCopyWith<$Res> {
  _$MuteCommentTokenCopyWithImpl(this._value, this._then);

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
    Object? tokenId = null,
    Object? tokenType = null,
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
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuteCommentTokenImplCopyWith<$Res>
    implements $MuteCommentTokenCopyWith<$Res> {
  factory _$$MuteCommentTokenImplCopyWith(_$MuteCommentTokenImpl value,
          $Res Function(_$MuteCommentTokenImpl) then) =
      __$$MuteCommentTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String postCommentId,
      dynamic postCommentRef,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$MuteCommentTokenImplCopyWithImpl<$Res>
    extends _$MuteCommentTokenCopyWithImpl<$Res, _$MuteCommentTokenImpl>
    implements _$$MuteCommentTokenImplCopyWith<$Res> {
  __$$MuteCommentTokenImplCopyWithImpl(_$MuteCommentTokenImpl _value,
      $Res Function(_$MuteCommentTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? postCommentId = null,
    Object? postCommentRef = freezed,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$MuteCommentTokenImpl(
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
      tokenId: null == tokenId
          ? _value.tokenId
          : tokenId // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuteCommentTokenImpl
    with DiagnosticableTreeMixin
    implements _MuteCommentToken {
  const _$MuteCommentTokenImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.postCommentId,
      required this.postCommentRef,
      required this.tokenId,
      required this.tokenType});

  factory _$MuteCommentTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuteCommentTokenImplFromJson(json);

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
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MuteCommentToken(activeUid: $activeUid, createdAt: $createdAt, postCommentId: $postCommentId, postCommentRef: $postCommentRef, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MuteCommentToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('postCommentId', postCommentId))
      ..add(DiagnosticsProperty('postCommentRef', postCommentRef))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuteCommentTokenImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.postCommentId, postCommentId) ||
                other.postCommentId == postCommentId) &&
            const DeepCollectionEquality()
                .equals(other.postCommentRef, postCommentRef) &&
            (identical(other.tokenId, tokenId) || other.tokenId == tokenId) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeUid,
      const DeepCollectionEquality().hash(createdAt),
      postCommentId,
      const DeepCollectionEquality().hash(postCommentRef),
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuteCommentTokenImplCopyWith<_$MuteCommentTokenImpl> get copyWith =>
      __$$MuteCommentTokenImplCopyWithImpl<_$MuteCommentTokenImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuteCommentTokenImplToJson(
      this,
    );
  }
}

abstract class _MuteCommentToken implements MuteCommentToken {
  const factory _MuteCommentToken(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String postCommentId,
      required final dynamic postCommentRef,
      required final String tokenId,
      required final String tokenType}) = _$MuteCommentTokenImpl;

  factory _MuteCommentToken.fromJson(Map<String, dynamic> json) =
      _$MuteCommentTokenImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get postCommentId;
  @override
  dynamic get postCommentRef;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$MuteCommentTokenImplCopyWith<_$MuteCommentTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
