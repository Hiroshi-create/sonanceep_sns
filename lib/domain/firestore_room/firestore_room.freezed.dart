// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'firestore_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FirestoreRoom _$FirestoreRoomFromJson(Map<String, dynamic> json) {
  return _FirestoreRoom.fromJson(json);
}

/// @nodoc
mixin _$FirestoreRoom {
// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt =>
      throw _privateConstructorUsedError; // dynamic型 なんでも許す
  List<String> get joinedUsers => throw _privateConstructorUsedError;
  String get talkRoomId => throw _privateConstructorUsedError;
  String get lastMessage => throw _privateConstructorUsedError;
  dynamic get updateAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FirestoreRoomCopyWith<FirestoreRoom> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FirestoreRoomCopyWith<$Res> {
  factory $FirestoreRoomCopyWith(
          FirestoreRoom value, $Res Function(FirestoreRoom) then) =
      _$FirestoreRoomCopyWithImpl<$Res, FirestoreRoom>;
  @useResult
  $Res call(
      {dynamic createdAt,
      List<String> joinedUsers,
      String talkRoomId,
      String lastMessage,
      dynamic updateAt});
}

/// @nodoc
class _$FirestoreRoomCopyWithImpl<$Res, $Val extends FirestoreRoom>
    implements $FirestoreRoomCopyWith<$Res> {
  _$FirestoreRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? joinedUsers = null,
    Object? talkRoomId = null,
    Object? lastMessage = null,
    Object? updateAt = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      joinedUsers: null == joinedUsers
          ? _value.joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      talkRoomId: null == talkRoomId
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FirestoreRoomImplCopyWith<$Res>
    implements $FirestoreRoomCopyWith<$Res> {
  factory _$$FirestoreRoomImplCopyWith(
          _$FirestoreRoomImpl value, $Res Function(_$FirestoreRoomImpl) then) =
      __$$FirestoreRoomImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic createdAt,
      List<String> joinedUsers,
      String talkRoomId,
      String lastMessage,
      dynamic updateAt});
}

/// @nodoc
class __$$FirestoreRoomImplCopyWithImpl<$Res>
    extends _$FirestoreRoomCopyWithImpl<$Res, _$FirestoreRoomImpl>
    implements _$$FirestoreRoomImplCopyWith<$Res> {
  __$$FirestoreRoomImplCopyWithImpl(
      _$FirestoreRoomImpl _value, $Res Function(_$FirestoreRoomImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = freezed,
    Object? joinedUsers = null,
    Object? talkRoomId = null,
    Object? lastMessage = null,
    Object? updateAt = freezed,
  }) {
    return _then(_$FirestoreRoomImpl(
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
      joinedUsers: null == joinedUsers
          ? _value._joinedUsers
          : joinedUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      talkRoomId: null == talkRoomId
          ? _value.talkRoomId
          : talkRoomId // ignore: cast_nullable_to_non_nullable
              as String,
      lastMessage: null == lastMessage
          ? _value.lastMessage
          : lastMessage // ignore: cast_nullable_to_non_nullable
              as String,
      updateAt: freezed == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FirestoreRoomImpl
    with DiagnosticableTreeMixin
    implements _FirestoreRoom {
  const _$FirestoreRoomImpl(
      {required this.createdAt,
      required final List<String> joinedUsers,
      required this.talkRoomId,
      required this.lastMessage,
      required this.updateAt})
      : _joinedUsers = joinedUsers;

  factory _$FirestoreRoomImpl.fromJson(Map<String, dynamic> json) =>
      _$$FirestoreRoomImplFromJson(json);

// const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  @override
  final dynamic createdAt;
// dynamic型 なんでも許す
  final List<String> _joinedUsers;
// dynamic型 なんでも許す
  @override
  List<String> get joinedUsers {
    if (_joinedUsers is EqualUnmodifiableListView) return _joinedUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_joinedUsers);
  }

  @override
  final String talkRoomId;
  @override
  final String lastMessage;
  @override
  final dynamic updateAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FirestoreRoom(createdAt: $createdAt, joinedUsers: $joinedUsers, talkRoomId: $talkRoomId, lastMessage: $lastMessage, updateAt: $updateAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FirestoreRoom'))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('joinedUsers', joinedUsers))
      ..add(DiagnosticsProperty('talkRoomId', talkRoomId))
      ..add(DiagnosticsProperty('lastMessage', lastMessage))
      ..add(DiagnosticsProperty('updateAt', updateAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FirestoreRoomImpl &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other._joinedUsers, _joinedUsers) &&
            (identical(other.talkRoomId, talkRoomId) ||
                other.talkRoomId == talkRoomId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality().equals(other.updateAt, updateAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(_joinedUsers),
      talkRoomId,
      lastMessage,
      const DeepCollectionEquality().hash(updateAt));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FirestoreRoomImplCopyWith<_$FirestoreRoomImpl> get copyWith =>
      __$$FirestoreRoomImplCopyWithImpl<_$FirestoreRoomImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FirestoreRoomImplToJson(
      this,
    );
  }
}

abstract class _FirestoreRoom implements FirestoreRoom {
  const factory _FirestoreRoom(
      {required final dynamic createdAt,
      required final List<String> joinedUsers,
      required final String talkRoomId,
      required final String lastMessage,
      required final dynamic updateAt}) = _$FirestoreRoomImpl;

  factory _FirestoreRoom.fromJson(Map<String, dynamic> json) =
      _$FirestoreRoomImpl.fromJson;

  @override // const factory 違うクラスのインスタンスを返すことができるコンストラクタ
  dynamic get createdAt;
  @override // dynamic型 なんでも許す
  List<String> get joinedUsers;
  @override
  String get talkRoomId;
  @override
  String get lastMessage;
  @override
  dynamic get updateAt;
  @override
  @JsonKey(ignore: true)
  _$$FirestoreRoomImplCopyWith<_$FirestoreRoomImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
