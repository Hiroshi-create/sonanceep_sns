// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'created_rooms.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CreatedRooms _$CreatedRoomsFromJson(Map<String, dynamic> json) {
  return _CreatedRooms.fromJson(json);
}

/// @nodoc
mixin _$CreatedRooms {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt => throw _privateConstructorUsedError;
  String get talkUid => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get talkRoomId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CreatedRoomsCopyWith<CreatedRooms> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatedRoomsCopyWith<$Res> {
  factory $CreatedRoomsCopyWith(
          CreatedRooms value, $Res Function(CreatedRooms) then) =
      _$CreatedRoomsCopyWithImpl<$Res, CreatedRooms>;
  @useResult
  $Res call({dynamic createdAt, String talkUid, String uid, String talkRoomId});
}

/// @nodoc
class _$CreatedRoomsCopyWithImpl<$Res, $Val extends CreatedRooms>
    implements $CreatedRoomsCopyWith<$Res> {
  _$CreatedRoomsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? talkUid = null,
    Object? uid = null,
    Object? talkRoomId = null,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      talkUid: null == talkUid
          ? _value.talkUid
          : talkUid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      talkRoomId: null == talkRoomId
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CreatedRoomsImplCopyWith<$Res>
    implements $CreatedRoomsCopyWith<$Res> {
  factory _$$CreatedRoomsImplCopyWith(
          _$CreatedRoomsImpl value, $Res Function(_$CreatedRoomsImpl) then) =
      __$$CreatedRoomsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic createdAt, String talkUid, String uid, String talkRoomId});
}

/// @nodoc
class __$$CreatedRoomsImplCopyWithImpl<$Res>
    extends _$CreatedRoomsCopyWithImpl<$Res, _$CreatedRoomsImpl>
    implements _$$CreatedRoomsImplCopyWith<$Res> {
  __$$CreatedRoomsImplCopyWithImpl(
      _$CreatedRoomsImpl _value, $Res Function(_$CreatedRoomsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? talkUid = null,
    Object? uid = null,
    Object? talkRoomId = null,
  }) {
    return _then(_$CreatedRoomsImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      talkUid: null == talkUid
          ? _value.talkUid
          : talkUid // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      talkRoomId: null == talkRoomId
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CreatedRoomsImpl with DiagnosticableTreeMixin implements _CreatedRooms {
  const _$CreatedRoomsImpl(
      {required this.createdAt,
      required this.talkUid,
      required this.uid,
      required this.talkRoomId});

  factory _$CreatedRoomsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CreatedRoomsImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final dynamic createdAt;
  @override
  final String talkUid;
  @override
  final String uid;
  @override
  final String talkRoomId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'CreatedRooms(createdAt: $createdAt, talkUid: $talkUid, uid: $uid, talkRoomId: $talkRoomId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'CreatedRooms'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('talkUid', talkUid))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('talkRoomId', talkRoomId));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreatedRoomsImpl &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            (identical(other.talkUid, talkUid) || other.talkUid == talkUid) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.talkRoomId, talkRoomId) ||
                other.talkRoomId == talkRoomId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(createdAt), talkUid, uid, talkRoomId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreatedRoomsImplCopyWith<_$CreatedRoomsImpl> get copyWith =>
      __$$CreatedRoomsImplCopyWithImpl<_$CreatedRoomsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CreatedRoomsImplToJson(
      this,
    );
  }
}

abstract class _CreatedRooms implements CreatedRooms {
  const factory _CreatedRooms(
      {required final dynamic createdAt,
      required final String talkUid,
      required final String uid,
      required final String talkRoomId}) = _$CreatedRoomsImpl;

  factory _CreatedRooms.fromJson(Map<String, dynamic> json) =
      _$CreatedRoomsImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt;
  @override
  String get talkUid;
  @override
  String get uid;
  @override
  String get talkRoomId;
  @override
  @JsonKey(ignore: true)
  _$$CreatedRoomsImplCopyWith<_$CreatedRoomsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
