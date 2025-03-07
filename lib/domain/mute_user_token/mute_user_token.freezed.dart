// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mute_user_token.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MuteUserToken _$MuteUserTokenFromJson(Map<String, dynamic> json) {
  return _MuteUserToken.fromJson(json);
}

/// @nodoc
mixin _$MuteUserToken {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid => throw _privateConstructorUsedError;
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get passiveUid => throw _privateConstructorUsedError;
  String get tokenId => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MuteUserTokenCopyWith<MuteUserToken> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuteUserTokenCopyWith<$Res> {
  factory $MuteUserTokenCopyWith(
          MuteUserToken value, $Res Function(MuteUserToken) then) =
      _$MuteUserTokenCopyWithImpl<$Res, MuteUserToken>;
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      String tokenId,
      String tokenType});
}

/// @nodoc
class _$MuteUserTokenCopyWithImpl<$Res, $Val extends MuteUserToken>
    implements $MuteUserTokenCopyWith<$Res> {
  _$MuteUserTokenCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
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
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$MuteUserTokenImplCopyWith<$Res>
    implements $MuteUserTokenCopyWith<$Res> {
  factory _$$MuteUserTokenImplCopyWith(
          _$MuteUserTokenImpl value, $Res Function(_$MuteUserTokenImpl) then) =
      __$$MuteUserTokenImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String activeUid,
      dynamic createdAt,
      String passiveUid,
      String tokenId,
      String tokenType});
}

/// @nodoc
class __$$MuteUserTokenImplCopyWithImpl<$Res>
    extends _$MuteUserTokenCopyWithImpl<$Res, _$MuteUserTokenImpl>
    implements _$$MuteUserTokenImplCopyWith<$Res> {
  __$$MuteUserTokenImplCopyWithImpl(
      _$MuteUserTokenImpl _value, $Res Function(_$MuteUserTokenImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeUid = null,
    Object? createdAt = freezed,
    Object? passiveUid = null,
    Object? tokenId = null,
    Object? tokenType = null,
  }) {
    return _then(_$MuteUserTokenImpl(
      activeUid: null == activeUid
          ? _value.activeUid
          : activeUid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      passiveUid: null == passiveUid
          ? _value.passiveUid
          : passiveUid // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$MuteUserTokenImpl
    with DiagnosticableTreeMixin
    implements _MuteUserToken {
  const _$MuteUserTokenImpl(
      {required this.activeUid,
      required this.createdAt,
      required this.passiveUid,
      required this.tokenId,
      required this.tokenType});

  factory _$MuteUserTokenImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuteUserTokenImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final String activeUid;
  @override
  final dynamic createdAt;
  @override
  final String passiveUid;
  @override
  final String tokenId;
  @override
  final String tokenType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MuteUserToken(activeUid: $activeUid, createdAt: $createdAt, passiveUid: $passiveUid, tokenId: $tokenId, tokenType: $tokenType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MuteUserToken'))
      ..add(DiagnosticsProperty('activeUid', activeUid))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('passiveUid', passiveUid))
      ..add(DiagnosticsProperty('tokenId', tokenId))
      ..add(DiagnosticsProperty('tokenType', tokenType));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuteUserTokenImpl &&
            (identical(other.activeUid, activeUid) ||
                other.activeUid == activeUid) &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.passiveUid, passiveUid) ||
                other.passiveUid == passiveUid) &&
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
      passiveUid,
      tokenId,
      tokenType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MuteUserTokenImplCopyWith<_$MuteUserTokenImpl> get copyWith =>
      __$$MuteUserTokenImplCopyWithImpl<_$MuteUserTokenImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuteUserTokenImplToJson(
      this,
    );
  }
}

abstract class _MuteUserToken implements MuteUserToken {
  const factory _MuteUserToken(
      {required final String activeUid,
      required final dynamic createdAt,
      required final String passiveUid,
      required final String tokenId,
      required final String tokenType}) = _$MuteUserTokenImpl;

  factory _MuteUserToken.fromJson(Map<String, dynamic> json) =
      _$MuteUserTokenImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  String get activeUid;
  @override
  dynamic get createdAt;
  @override
  String get passiveUid;
  @override
  String get tokenId;
  @override
  String get tokenType;
  @override
  @JsonKey(ignore: true)
  _$$MuteUserTokenImplCopyWith<_$MuteUserTokenImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
